package com.acception.powermessage

import com.acception.usuario.Pessoa
import grails.converters.JSON
import grails.transaction.Transactional
import com.acception.powermessage.Mensagem

@Transactional
class SmsService {

    def khipuAnswer = 'none'


    def send(Mensagem sms, def contatosIds) {
        sms.msgStatus = MsgStatus.ENVIANDO
        sms.tentativas = new Integer(1)
        sms.dataEnvio = new Date()

		if (!sms.save(flush: true)) {
			render(view: "create", model: [mensagemInstance: mensagemInstance])
			return
		}

        def contatosIntance = Pessoa.getAll(contatosIds)

        println("SMS sendo enviado para ${contatosIntance}")
        def contatosmap = buildMapContatos(contatosIntance)
        sms.pessoas = contatosIntance

        def map = [
                data:[
                        id_projeto: ConfiguracaoSistema.getInstance().idProjeto,
                        id_mensagem: sms.id,
                        contatos: contatosmap,
                        sms_texto: sms.texto
                ]
        ]

        try {
            khipuAnswer = send_data_khipu(map)
            sms.msgStatus = MsgStatus.ENVIADA
        }
        catch (Exception e){
            e.printStackTrace()
        }


    }

    //idsContatos = lista de ids (int)
    def getInformacao(def idsContatos){
        println("Getting informação....")

        def dados = [mensagem_ids: idsContatos, id_projeto:ConfiguracaoSistema.getInstance().idProjeto]
        def msg=""
        withHttp(uri: KHIPU_URI){
            msg = get(path: '/informacao', query:[q:dados as JSON])
        }

        println "INFORMAÇÃO OBTIDA: $msg"
        return msg
    }

    private def send_data_khipu(dados=null){
        def msg=""
        withHttp(uri: ConfiguracaoSistema.getInstance().khipuUrl){
            msg = get(path: '/receiver', query:[q:dados as JSON])
            println "RESPOSTA: $msg"
        }
        return msg
    }

    private def buildMapContatos(def contatos){
        def listcontatos = []
        contatos.each{p ->
            listcontatos += [nome: p.nome, telefones: p.telefones]
        }

        listcontatos
    }
}
