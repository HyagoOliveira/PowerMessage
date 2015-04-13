package com.acception.powermessage

import org.springframework.dao.DataIntegrityViolationException

class ConfiguracaoController {

    def index() {
    }

    def show(){
        def configuracaoInstance = ConfiguracaoSistema.getInstance()

        if (!configuracaoInstance) {
            flash.message = message(code: 'default.not.found.message.female', args: [message(code: 'configuracaoSistema.label')])
            redirect(action: "list")
            return
        }

        [configuracaoInstance: configuracaoInstance]
    }

    def edit(){
        def configuracaoInstance = ConfiguracaoSistema.getInstance()


        if (!configuracaoInstance) {
            flash.message = message(code: 'default.not.found.message.female', args: [message(code: 'configuracaoSistema.label')])
            redirect(action: "list")
            return
        }

        [configuracaoInstance: configuracaoInstance]
    }

    def update(Long version) {
        def configuracaoInstance = ConfiguracaoSistema.getInstance()
        if (!configuracaoInstance) {
            flash.message = message(code: 'default.not.found.message.female', args: [
                    message(code: 'configuracaoSistema.label')])
            redirect(action: "show")
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
            flash.message = message(code: 'default.not.found.message.female', args: [message(code: 'configuracaoSistema.label')])
            render(view: "edit", model: [configuracaoInstance: configuracaoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message.female',
                default: "Configuração {0} atualizada com sucesso!",
                args: [message(code: 'configuracaoSistema.label')])
        redirect(action: "show")
    }

//    def delete(Long id) {
//        def configuracaoInstance = ConfiguracaoSistema.get(id)
//        if (!configuracaoInstance) {
//            flash.message = message(code: 'default.not.found.message.female', args: [message(code: 'configuracaoSistema.label'), id])
//            redirect(action: "list")
//            return
//        }
//
//        try {
//            configuracaoInstance.delete(flush: true)
//            flash.message = message(code: 'default.deleted.message.female', args: [message(code: 'configuracaoSistema.label'), id])
//            redirect(action: "list")
//        }
//        catch (DataIntegrityViolationException e) {
//            flash.message = message(code: 'default.not.deleted.message.female', args: [message(code: 'configuracaoSistema.label'), id])
//            redirect(action: "show", id: id)
//        }
//    }
}
