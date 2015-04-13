package com.acception.powermessage

import com.acception.usuario.Pessoa
import com.acception.usuario.Telefone
import org.springframework.dao.DataIntegrityViolationException

class PessoaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService;

    def index() {		
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        def pessoas = springSecurityService.currentUser.pessoas.findAll { it.ativo == true }
        [pessoaInstanceList: pessoas.sort { it.nome }, pessoaInstanceTotal: pessoas.size()]
    }

    def create() {		
		[pessoaInstance: new Pessoa(params)]
    }

    def save() {
        def pessoaInstance = new Pessoa(params)
        springSecurityService.currentUser.addToPessoas(pessoaInstance)
		if (params?.ddd.getClass().isArray()) {
			for(int i=0; i<params?.ddd.size();i++){
				pessoaInstance.addToTelefones(new Telefone(ddd:params?.ddd[i], numero: params?.numero[i]));
			}
		} else {
			pessoaInstance.addToTelefones(new Telefone(params));
        }

        if (!pessoaInstance.save(flush: true)) {
            render(view: "create", model: [pessoaInstance: pessoaInstance])
            return
        }

        flash.message = "O contato ${pessoaInstance.nome} foi salvo com sucesso!"
        redirect(action: "show", id: pessoaInstance.id)
    }

    def show(Long id) {
        def pessoaInstance = Pessoa.get(id)
        if (!pessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), id])
            redirect(action: "list")
            return
        }

        [pessoaInstance: pessoaInstance]
    }

    def edit(Long id) {
        def pessoaInstance = Pessoa.get(id)
        if (!pessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), id])
            redirect(action: "list")
            return
        }

        [pessoaInstance: pessoaInstance]
    }

    def update(Long id, Long version) {
        def pessoaInstance = Pessoa.get(id)
		
        if (!pessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), id])
            redirect(action: "list")
            return
        }
		
		pessoaInstance.telefones.clear();
		
		if(params?.ddd.getClass().isArray()){
			for(int i=0; i<params?.ddd.size();i++){
				pessoaInstance.addToTelefones(new Telefone(ddd:params?.ddd[i], numero: params?.numero[i]));
			}
		}
		else
			pessoaInstance.addToTelefones(new Telefone(params));

        if (version != null) {
            if (pessoaInstance.version > version) {
                pessoaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'pessoa.label', default: 'Pessoa')] as Object[],
                          "Another user has updated this Pessoa while you were editing")
                render(view: "edit", model: [pessoaInstance: pessoaInstance])
                return
            }
        }

        pessoaInstance.properties = params

        if (!pessoaInstance.save(flush: true)) {
            render(view: "edit", model: [pessoaInstance: pessoaInstance])
            return
        }

        flash.message = "O contato ${pessoaInstance.nome} foi alterado com sucesso!"
        redirect(action: "show", id: pessoaInstance.id)
    }

    def delete(Long id) {
        def pessoaInstance = Pessoa.get(id)
        if (!pessoaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), id])
            redirect(action: "list")
            return
        }

        try {
			pessoaInstance.desativar()
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), id])
            redirect(action: "list")
        } catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pessoa.label', default: 'Pessoa'), id])
            redirect(action: "show", id: id)
        }
    }
}
