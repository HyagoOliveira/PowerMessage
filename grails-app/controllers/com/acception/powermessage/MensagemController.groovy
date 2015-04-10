package com.acception.powermessage


import com.acception.usuario.Pessoa

class MensagemController {

	def smsService;

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[mensagemInstanceList: Mensagem.list(params), mensagemInstanceTotal: Mensagem.count()]
	}

	def create() {
		if(Pessoa.ativos.list().size() == 0) {
			flash.message = "Você não possui contatos para enviar mensagens."
			redirect(action: "list")
			return;
		}

		[mensagemInstance: new Mensagem(params)]
	}

	def save() {
		def mensagemInstance = new Mensagem(params)

		switch (params.myGroup){

			case 'tabelaContatos':

				if(!params.contatos){
					flash.message = "Você deve selecionar pelo menos um contato."
					render(view: "create", model: [mensagemInstance: mensagemInstance])
					return
				}

				flash.message = "Enviando Mensagem..."
				smsService.send(mensagemInstance, params.contatos)
				break

			case 'tabelaGrupos':

				if(!params.grupos ){
					flash.message = "Você deve selecionar pelo menos um grupo."
					render(view: "create", model: [mensagemInstance: mensagemInstance])
					return
				}

				flash.message = "Enviando Mensagem..."
				def grupos = Grupo.getAll(params.grupos)
				mensagemInstance.grupos = grupos
				smsService.send(mensagemInstance, grupos.pessoas*.id)
				break
		}


		flash.message = "Mensagem Enviada"
		redirect(action: "show", id: mensagemInstance.id)
	}


	def show(Long id) {
		def mensagemInstance = Mensagem.get(id)
		if (!mensagemInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
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
			flash.message = message(code: 'default.not.found.message', args: [
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
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'mensagem.label', default: 'Mensagem'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (mensagemInstance.version > version) {
				mensagemInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
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

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'mensagem.label', default: 'Mensagem'),
			mensagemInstance.id
		])
		redirect(action: "show", id: mensagemInstance.id)
	}

	def delete(Long id) {
		def mensagemInstance = Mensagem.get(id)
		mensagemInstance.flag = "false"

		mensagemInstance.save(flush: true)

		redirect(action: "list")
	}
	
	def grupoChangeSelection = {
		Grupo g = Grupo.get(params.id);
		
//		println "Grupo selecionado: $g.nome"
//		
//		(g?.pessoas*.id).each { pessoaId ->
//			println "\tPessoas selecionadas: ${Pessoa.get(pessoaId).nome}"
//		}
	}
}
