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
		 def pessoas = springSecurityService.currentUser.pessoas.findAll { it.ativo == true }		
		[grupoInstance: new Grupo(params), pessoasList: pessoas]
	}

	def save() {
		def grupoInstance = new Grupo(params)

		if(params.list('pessoas').size() == 0){
			grupoInstance.errors.rejectValue("version", "grupo.create.no.people.found",
				[
					message(code: 'grupo.label', default: 'Grupo')] as Object[],
				"A group can't be created with no contacts in it.")
			
		render(view: "edit", model: [grupoInstance: grupoInstance])
			def pessoas = springSecurityService.currentUser.pessoas.findAll { it.ativo == true }
			render(view: "create", model: [grupoInstance: grupoInstance, pessoasList: pessoas])	
			return		
		}
		
		if (!grupoInstance.save(flush: true)) {
			def pessoas = springSecurityService.currentUser.pessoas.findAll { it.ativo == true }
			render(view: "create", model: [grupoInstance: grupoInstance, pessoasList: pessoas])	
			return
		}

		def id =  springSecurityService.currentUser.id
		def associacao = Associacao.findById(id)
		associacao.grupos.add(grupoInstance)
		associacao.save(flush:true)

		def people = params.list('pessoas')
		for(person in people){
			def pessoa = Pessoa.findById(person)
			pessoa.grupos.add(grupoInstance)
			pessoa.save(flush: true)
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'grupo.label', default: 'Grupo'),
			grupoInstance.nome
		])
		redirect(action: "show", id: grupoInstance.id)
	}

	def show(Long id) {
		def grupoInstance = Grupo.get(id)
		if (!grupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				grupoInstance.nome
			])
			redirect(action: "list")
			return
		}

		[grupoInstance: grupoInstance]
	}

	def edit(Long id) {
		def pessoas = []
		for(pessoa in Associacao.findById(springSecurityService.currentUser.id).pessoas){
			if(pessoa.ativo){
				pessoas.add(pessoa)
			}
		}
		def grupoInstance = Grupo.get(id)
		if (!grupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				grupoInstance.nome
			])
			redirect(action: "list")
			return
		}

		[grupoInstance: grupoInstance, pessoasList:pessoas]
	}

	def update(Long id, Long version) {
		def grupoInstance = Grupo.get(id)
		if(!params['pessoas']){

			grupoInstance.errors.rejectValue("version", "grupo.create.no.people.found",
				[
					message(code: 'grupo.label', default: 'Grupo')] as Object[],
				"A group can't be created with no contacts in it.")
			render(view: "edit", model: [grupoInstance: grupoInstance])
			return
		}


		if (!grupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				grupoInstance.nome
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
		def updatedPeople = params.pessoas


		for(person in savedPeople){
			def pessoa = Pessoa.get(person)
			pessoa.grupos.remove(grupoInstance)
			pessoa.save(flush: true)
			grupoInstance.pessoas.remove(pessoa)
		}
		
		def lista = params.list('pessoas')
		
		for(person in lista){
			def pessoa = Pessoa.findById(person.toLong())
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
			grupoInstance.nome
		])
		redirect(action: "show", id: grupoInstance.id)
	}
	
	def delete(Long id) {
		def grupoInstance = Grupo.get(id)
		if (!grupoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				grupoInstance.nome
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

			def associacao = Associacao.findById(springSecurityService.currentUser.id)
			associacao.grupos.remove(grupoInstance)
			associacao.save(flush:true)
			grupoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				grupoInstance.nome
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'grupo.label', default: 'Grupo'),
				grupoInstance.nome
			])
			redirect(action: "show", id: id)
		}
	}
}
