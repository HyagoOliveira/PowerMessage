package com.acception.powermessage

import com.acception.authentication.Permissao
import com.acception.authentication.UsuarioPermissao
import com.acception.usuario.Endereco
import org.springframework.dao.DataIntegrityViolationException

class AssociacaoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [associacaoInstanceList: Associacao.list(params), associacaoInstanceTotal: Associacao.count()]
    }

    def create() {
		
        [associacaoInstance: new Associacao(params)]
    }

    def save() {		
        def associacaoInstance = new Associacao (params);		
		associacaoInstance.endereco = new Endereco(params)
		
		associacaoInstance.enabled=true
		associacaoInstance.accountExpired=false
		associacaoInstance.accountLocked=false
		associacaoInstance.passwordExpired=false
		
		Permissao administradorPermissao = Permissao.findByAuthority("ROLE_ADMIN")
		if(administradorPermissao == null){
			administradorPermissao = new Permissao(authority: "ROLE_ADMIN").save(flush:true)
		}	
		
		
        if (!associacaoInstance.save(flush: true)) {
            render(view: "create", model: [associacaoInstance: associacaoInstance])
            return
        }
		
		if(UsuarioPermissao.findByUsuarioAndPermissao(associacaoInstance, administradorPermissao) == null){
			new UsuarioPermissao(usuario: associacaoInstance, permissao: administradorPermissao).save(flush:true)
		}
		
		
        flash.message = message(code: 'default.created.message', args: [message(code: 'associacao.label', default: 'Associacao'), associacaoInstance.id])
        redirect(action: "show", id: associacaoInstance.id)
    }

    def show(Long id) {
        def associacaoInstance = Associacao.get(id)
        if (!associacaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'associacao.label', default: 'Associacao'), id])
            redirect(action: "list")
            return
        }

        [associacaoInstance: associacaoInstance]
    }

    def edit(Long id) {
        def associacaoInstance = Associacao.get(id)
        if (!associacaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'associacao.label', default: 'Associacao'), id])
            redirect(action: "list")
            return
        }

        [associacaoInstance: associacaoInstance]
    }

    def update(Long id, Long version) {
        def associacaoInstance = Associacao.get(id)
        if (!associacaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'associacao.label', default: 'Associacao'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (associacaoInstance.version > version) {
                associacaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'associacao.label', default: 'Associacao')] as Object[],
                          "Another user has updated this Associacao while you were editing")
                render(view: "edit", model: [associacaoInstance: associacaoInstance])
                return
            }
        }

        associacaoInstance.properties = params
		associacaoInstance.endereco = new Endereco(params)

        if (!associacaoInstance.save(flush: true)) {
            render(view: "edit", model: [associacaoInstance: associacaoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'associacao.label', default: 'Associacao'), associacaoInstance.id])
        redirect(action: "show", id: associacaoInstance.id)
    }

    def delete(Long id) {
        def associacaoInstance = Associacao.get(id)		
		UsuarioPermissao usuarioPermissao = UsuarioPermissao.findByUsuario(associacaoInstance)
		usuarioPermissao.delete(flush: true)
		
        if (!associacaoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'associacao.label', default: 'Associacao'), id])
            redirect(action: "list")
            return
        }

        try {
            associacaoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'associacao.label', default: 'Associacao'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'associacao.label', default: 'Associacao'), id])
            redirect(action: "show", id: id)
        }
    }
}