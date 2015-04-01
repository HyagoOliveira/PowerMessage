package com.acception.powermessage


import com.acception.gcm.Gcm
import grails.converters.JSON
import org.springframework.dao.DataIntegrityViolationException
import com.acception.usuario.Pessoa

class MensagemController {

	def post2GcmService;

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[mensagemInstanceList: Mensagem.list(params), mensagemInstanceTotal: Mensagem.count()]
	}

	def create() {
		if(Pessoa.list().size()==0) {
			flash.message = "Você não possui contatos para poder enviar mensagens."
			redirect(action: "list")
			return;
		}

		[mensagemInstance: new Mensagem(params)]
	}

	def save() {

		def mensagemInstance = new Mensagem(params)
		mensagemInstance.dataEnvio = new Date()
		mensagemInstance.msgStatus = MsgStatus.ENVIANDO
		mensagemInstance.tentativas = new Integer(1)
		mensagemInstance.flag = "true"

		if(params.pessoas==null && params.grupos==null){
			flash.message = "Você deve selecionar um destinatário."
			render(view: "create", model: [mensagemInstance: mensagemInstance])
			return
		}

		if (!mensagemInstance.save(flush: true)) {
			render(view: "create", model: [mensagemInstance: mensagemInstance])
			return
		}

		def todosIds = [] as Set

		if(params.pessoas) {
			for (element in params.pessoas) {
				todosIds << (String) element
			}
		}

		if(params.grupos) {
			for (idGrupo in params.grupos) {
				def grupoInst = Grupo.findById(idGrupo);

				def pessoasIdList = grupoInst.pessoas*.id;
				for (element in pessoasIdList) {
					todosIds << (String) element
				}
			}
		}

		String ids = "";
		(todosIds).each { ids+="$it," }
		ids = ids.substring(0, ids.size()-1);

		//print ids;

		post2GcmService.processarDados(mensagemInstance, ids.toString())

		flash.message = "Mensagem Enviada"

		redirect(action: "show", id: mensagemInstance.id)
	}

	def criarGcm(){
		println params.toString()

		def gcmClass = Gcm.findByNome("GCMKYES")
		println "Entrei no givegcm $gcmClass"
		if(!gcmClass){
			Gcm.withTransaction{ status ->
				gcmClass = new Gcm()
				gcmClass.addRegId(params.RegId)
				gcmClass.save(flush:true)
				println "List: ${gcmclass.registration_ids}"
				render([ok:"ok"]);
			}
		}
		render([ok:"ok"])
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
