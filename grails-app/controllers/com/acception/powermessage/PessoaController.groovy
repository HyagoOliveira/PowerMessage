package com.acception.powermessage

import com.acception.usuario.Pessoa
import com.acception.usuario.Telefone
import com.acception.usuario.Operadora

import org.springframework.dao.DataIntegrityViolationException

class PessoaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService;

    def index() {		
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        def alfabeto = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
        def pessoas = springSecurityService.currentUser.pessoas.findAll { it.ativo == true }
        if (params.letra) {
            pessoas = pessoas.findAll { it.nome.getAt(0) == params.letra }
        }
        [pessoaInstanceList: pessoas.sort { it.nome }, pessoaInstanceTotal: pessoas.size(), alfabeto: alfabeto]
    }

    def create() {		
		[pessoaInstance: new Pessoa(params), operadorasList: Operadora.list()]
    }

    def save() {
        def pessoaInstance = new Pessoa(params)
		
        springSecurityService.currentUser.addToPessoas(pessoaInstance)
		if (params?.ddd.getClass().isArray()) {
			for(int i=0; i<params?.ddd.size();i++){				
				pessoaInstance.addToTelefones(new Telefone(ddd:params?.ddd[i], numero: params?.numero[i], operadora: params?.operadora[i]));
			}
		} else {
			pessoaInstance?.addToTelefones(new Telefone(params));
        }
			
        if (!pessoaInstance.save(flush: true)) {
            render(view: "create", model: [pessoaInstance: pessoaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [
			message(code: 'nome.label', default: 'Contato'),
			pessoaInstance.nome
		])
        redirect(action: "show", id: pessoaInstance.id)
    }

    def show(Long id) {
        def pessoaInstance = Pessoa.get(id)
        if (!pessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), pessoaInstance.nome])
            redirect(action: "list")
            return
        }

        [pessoaInstance: pessoaInstance]
    }

    def edit(Long id) {
        def pessoaInstance = Pessoa.get(id)
        if (!pessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), pessoaInstance.nome])
            redirect(action: "list")
            return
        }

        [pessoaInstance: pessoaInstance,  operadorasList: Operadora.list()]
    }

    def update(Long id, Long version) {
        def pessoaInstance = Pessoa.get(id)
		
        if (!pessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), pessoaInstance.nome])
            redirect(action: "list")
            return
        }
		
		pessoaInstance.telefones.clear();
		
		if(params?.ddd.getClass().isArray()){
			for(int i=0; i<params?.ddd.size();i++){
				pessoaInstance.addToTelefones(new Telefone(ddd:params?.ddd[i], numero: params?.numero[i],  operadora: params?.operadora[i]));
			}
		}
		else
			pessoaInstance.addToTelefones(new Telefone(params));

        if (version != null) {
            if (pessoaInstance.version > version) {
                pessoaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pessoa.label', default: 'Contato')] as Object[],
                          "Another user has updated this Contato while you were editing")
                render(view: "edit", model: [pessoaInstance: pessoaInstance])
                return
            }
        }

        pessoaInstance.properties = params

        if (!pessoaInstance.save(flush: true)) {
            render(view: "edit", model: [pessoaInstance: pessoaInstance])
            return
        }

       
		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'pessoa.label', default: 'Pessoa'),
			pessoaInstance.nome
		])
        redirect(action: "show", id: pessoaInstance.id)
    }

    def delete(Long id) {
        def pessoaInstance = Pessoa.get(id)
        if (!pessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), pessoaInstance.nome])
            redirect(action: "list")
            return
        }

        try {
			pessoaInstance.desativar()
			for (grupo in pessoaInstance.grupos){
				grupo.pessoas.remove(pessoaInstance)
				if (grupo.pessoas.size() == 0){
					springSecurityService.currentUser.grupos.remove(grupo)
				}
			}
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), pessoaInstance.nome])
            redirect(action: "list")
        } catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), pessoaInstance.nome])
            redirect(action: "show", id: id)
        }
    }
}
