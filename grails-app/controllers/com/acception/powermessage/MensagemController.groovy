package com.acception.powermessage


import com.acception.usuario.Pessoa

class MensagemController {
	def springSecurityService
	def smsService

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)		
		def msgs = springSecurityService.currentUser.mensagens.findAll { it.ativo == true }
		[mensagemInstanceList: msgs, mensagemInstanceTotal: msgs.size()]
	}

	def create() {
		if(Pessoa.ativos.list().size() == 0) {
			   mensagemInstance.errors.rejectValue("version", "mensagem.create.no.people.found",
                          [message(code: 'mensagem.label', default: 'Mensagem')] as Object[],
                          "A message can't be sent without a recipient")
			redirect(action: "list")
			return;
		}
		
		[mensagemInstance: new Mensagem(params),
			listPessoas: Associacao.findById(springSecurityService.currentUser.id).pessoas.findAll { it.ativo == true },
			listGrupos: Associacao.findById(springSecurityService.currentUser.id).grupos ]
	}

	def save() {
		def mensagemInstance = new Mensagem(params)
		def associacao = Associacao.findById(springSecurityService.currentUser.id)
		switch (params.myGroup){

			case 'tabelaContatos':

				if(!params.contatos){
					 mensagemInstance.errors.rejectValue("version", "mensagem.create.no.people.found",
                          [message(code: 'mensagem.label', default: 'Mensagem')] as Object[],
                          "A message can't be sent without a recipient")
					 println listPessoas: Associacao.findById(springSecurityService.currentUser.id).pessoas.findAll { it.ativo == true }
					render(view: "create", model: [mensagemInstance: mensagemInstance, listPessoas: Associacao.findById(springSecurityService.currentUser.id).pessoas,
			listGrupos: Associacao.findById(springSecurityService.currentUser.id).grupos])
					return
				}
				flash.message = message(code: 'mensagem.being.send', args: [message(code: 'mensagem.label', default: 'Mensagem'), mensagemInstance.id])
		
				associacao.mensagens.add(mensagemInstance)
				associacao.save(flush:true)
				for(p in Pessoa.getAll(params.contatos)){
					p.mensagens.add(mensagemInstance)
					p.save(flush:true)
				}
				smsService.send(mensagemInstance, params.contatos)
				break

			case 'tabelaGrupos':

				if(!params.grupos ){
					 mensagemInstance.errors.rejectValue("version", "mensagem.create.no.people.found",
                          [message(code: 'mensagem.label', default: 'Mensagem')] as Object[],
                          "A message can't be sent without a recipient")
					render(view: "create", model: [mensagemInstance: mensagemInstance], listPessoas: Associacao.findById(springSecurityService.currentUser.id).pessoas,
			listGrupos: Associacao.findById(springSecurityService.currentUser.id).grupos)
					return
				}

				flash.message = message(code: 'mensagem.being.send', args: [message(code: 'mensagem.label', default: 'Mensagem'), mensagemInstance.id])
		
				def grupos = Grupo.getAll(params.grupos)
				for (g in grupos){					
					g.mensagens.add(mensagemInstance)		
					g.save(flush:true)	
				}
				associacao.grupos = Grupo.getAll(params.grupos)
				associacao.mensagens.add(mensagemInstance)
				associacao.save(flush:true)
				smsService.send(mensagemInstance, grupos.pessoas*.id)
				break
		}

		springSecurityService.currentUser.addToMensagens(mensagemInstance)
		if(smsService.khipuAnswer != 'none'){
			flash.message = smsService.khipuAnswer
		} else { flash.message = message(code: 'mensagem.being.send', args: [message(code: 'mensagem.label', default: 'Mensagem'), mensagemInstance.id])
		}
		
		redirect(action: "show", id: mensagemInstance.id)
	}


	def show(Long id) {
		def mensagemInstance = Mensagem.get(id)
		if (!mensagemInstance) {
			flash.message = message(code: 'default.not.found.message.female', args: [
				message(code: 'mensagem.label', default: 'Mensagem'),
				id
			])
			redirect(action: "list")
			return
		}

		[mensagemInstance: mensagemInstance]
	}

	def edit(Long id) {
		def mensagemInstance = Mensagem.get(id)
		if (!mensagemInstance) {
			flash.message = message(code: 'default.not.found.message.female', args: [
				message(code: 'mensagem.label', default: 'Mensagem'),
				id
			])
			redirect(action: "list")
			return
		}

		[mensagemInstance: mensagemInstance]
	}

	def update(Long id, Long version) {
		def mensagemInstance = Mensagem.get(id)
		if (!mensagemInstance) {
			flash.message = message(code: 'default.not.found.message.female', args: [
				message(code: 'mensagem.label', default: 'Mensagem'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (mensagemInstance.version > version) {
				mensagemInstance.errors.rejectValue("version", "default.optimistic.locking.failure.female",
						[
							message(code: 'mensagem.label', default: 'Mensagem')] as Object[],
						"Another user has updated this Mensagem while you were editing")
				render(view: "edit", model: [mensagemInstance: mensagemInstance])
				return
			}
		}

		mensagemInstance.properties = params

		if (!mensagemInstance.save(flush: true)) {
			render(view: "edit", model: [mensagemInstance: mensagemInstance])
			return
		}

		flash.message = message(code: 'default.updated.message.female', args: [
			message(code: 'mensagem.label', default: 'Mensagem'),
			mensagemInstance.id
		])
		redirect(action: "show", id: mensagemInstance.id)
	}

	def delete(Long id) {
		def mensagemInstance = Mensagem.get(id)
		def associacao = Associacao.findById(springSecurityService.currentUser.id)
		mensagemInstance.ativo = false
		mensagemInstance.save(flush: true)		
		associacao.save(flush:true)
		redirect(action: "list")
	}
}
