package com.acception.powermessage
import com.acception.usuario.Pessoa

import org.springframework.dao.DataIntegrityViolationException

class GrupoController {
	def springSecurityService
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def associacao = Associacao.findById(springSecurityService.currentUser.id)
		[grupoInstanceList: associacao.grupos, grupoInstanceTotal: associacao.grupos.size()]
	}

	def create() {
		[grupoInstance: new Grupo(params)]
	}

	def save() {
		def grupoInstance = new Grupo(params)

		if(params['pessoas'] == null){
			grupoInstance.errors.rejectValue(null, null,
					null,
					"Um grupo não pode ser criado sem contatos.")
			render(view: "create", model: [grupoInstance: grupoInstance])
			return
		}else{
			//remover todas as pessoas e depois adicionar
		}
		if (!grupoInstance.save(flush: true)) {
			render(view: "create", model: [grupoInstance: grupoInstance])
			return
		}

		def id =  springSecurityService.principal.id
		def associacao = Associacao.findById(id)
		associacao.grupos.add(grupoInstance)
		associacao.save(flush:true)

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'grupo.label', default: 'Grupo'),
			grupoInstance.id
		])
		redirect(action: "show", id: grupoInstance.id)
	}

	def show(Long id) {
		def grupoInstance = Grupo.get(id)
		if (!grupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				id
			])
			redirect(action: "list")
			return
		}

		[grupoInstance: grupoInstance]
	}

	def edit(Long id) {
		def grupoInstance = Grupo.get(id)
		if (!grupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				id
			])
			redirect(action: "list")
			return
		}

		[grupoInstance: grupoInstance]
	}

	def update(Long id, Long version) {
		def grupoInstance = Grupo.get(id)
		if(!params['pessoas']){

			grupoInstance.errors.rejectValue(null, null,
					null,
					"Um grupo não pode ser criado sem contatos.")
			render(view: "edit", model: [grupoInstance: grupoInstance])
			return
		}


		if (!grupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (grupoInstance.version > version) {
				grupoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'grupo.label', default: 'Grupo')] as Object[],
						"Another user has updated this Grupo while you were editing")
				render(view: "edit", model: [grupoInstance: grupoInstance])
				return
			}
		}


		grupoInstance.nome = params.nome
		def savedPeople = grupoInstance.pessoas.id
		def updatedPeople = params['pessoas']


		for(person in savedPeople){
			def pessoa = Pessoa.get(person)
			pessoa.grupos.remove(grupoInstance)
			pessoa.save(flush: true)
			grupoInstance.pessoas.remove(pessoa)
		}
		
		for(person in updatedPeople){
			def pessoa = Pessoa.get(person)
			pessoa.grupos.add(grupoInstance)
			for(p in pessoa){
				p.save(flush: true)
				}
			grupoInstance.pessoas.add(pessoa)
		}

		if (!grupoInstance.save(flush: true)) {
			render(view: "edit", model: [grupoInstance: grupoInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'grupo.label', default: 'Grupo'),
			grupoInstance.id
		])
		redirect(action: "show", id: grupoInstance.id)
	}

	def delete(Long id) {
		def grupoInstance = Grupo.get(id)
		if (!grupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			if(grupoInstance.pessoas){
				for (pessoa in grupoInstance.pessoas){
					pessoa.grupos.remove(grupoInstance)					
					pessoa.save(flush: true)
				}
			}
						
			def associacao = Associacao.findById(springSecurityService.principal.id)
			associacao.grupos.remove(grupoInstance)
			associacao.save(flush:true)
			grupoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
