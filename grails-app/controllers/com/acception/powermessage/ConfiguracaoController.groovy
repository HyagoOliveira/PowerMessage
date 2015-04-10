package com.acception.powermessage

import org.springframework.dao.DataIntegrityViolationException

class ConfiguracaoController {

    def index() {
    }

    def show(){
        def configuracaoInstance = ConfiguracaoSistema.getAll()

        if (!configuracaoInstance) {
            flash.message = message(code: 'default.not.found.message.female', args: [message(code: 'configuracaoSistema.label'), id])
            redirect(action: "list")
            return
        }

        [configuracaoInstance: configuracaoInstance]
    }

    def edit(Long id){
        def configuracaoInstance = ConfiguracaoSistema.get(id)

        println("ID: $id")

        if (!configuracaoInstance) {
            flash.message = essage(code: 'default.not.found.message.female', args: [message(code: 'configuracaoSistema.label'), id])
            redirect(action: "list")
            return
        }

        [configuracaoInstance: configuracaoInstance]
    }

    def update(Long id, Long version) {
        def configuracaoInstance = ConfiguracaoSistema.get(id)
        if (!configuracaoInstance) {
            flash.message = message(code: 'default.not.found.message.female', args: [
                    message(code: 'configuracaoSistema.label'), id
            ])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (configuracaoInstance.version > version) {
                configuracaoInstance.errors.rejectValue("version", "default.optimistic.locking.failure.female",
                        [
                                message(code: 'configuracaoSistema.label')] as Object[],
                        "Another user has updated this Mensagem while you were editing")
                render(view: "edit", model: [mensagemInstance: configuracaoInstance])
                return
            }
        }

        configuracaoInstance.properties = params

        if (!configuracaoInstance.save(flush: true)) {
            render(view: "edit", model: [configuracaoInstance: configuracaoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message.female', args: [
                message(code: 'configuracaoSistema.label'),
                configuracaoInstance.id
        ])
        redirect(action: "show", id: configuracaoInstance.id)
    }

    def delete(Long id) {
        def configuracaoInstance = ConfiguracaoSistema.get(id)
        if (!configuracaoInstance) {
            flash.message = message(code: 'default.not.found.message.female', args: [message(code: 'configuracaoSistema.label'), id])
            redirect(action: "list")
            return
        }

        try {
            configuracaoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message.female', args: [message(code: 'configuracaoSistema.label'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message.female', args: [message(code: 'configuracaoSistema.label'), id])
            redirect(action: "show", id: id)
        }
    }
}
