package com.acception.powermessage

import com.acception.usuario.Pessoa
import grails.converters.JSON
import grails.transaction.Transactional

@Transactional
class SmsService {

    static String PROJETO_ID = "7363000269c85acdce6873270f6898852f5f7684570626f8167e929369bd2b450ad549884367470e2371076c423c25552c1b79260c65f3a41613a07920baccc4bb73ef1c34371040e0c4462e102909b8cffa11d245b0b5b942727fa2e12e23a238bacb2e"
    static String KHIPU_URI = "http://192.168.1.140:6543"

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
                        id_projeto: PROJETO_ID,
                        id_mensagem: sms.id,
                        contatos: contatosmap,
                        sms_texto: sms.texto
                ]
        ]

        try {
            send_data_khipu(map)
            sms.msgStatus = MsgStatus.ENVIADA
        }
        catch (Exception e){
            e.printStackTrace()
        }


    }

    //idsContatos = lista de ids (int)
    def getInformacao(def idsContatos){
        println("Getting informação....")

        def dados = [mensagem_ids: idsContatos, id_projeto:PROJETO_ID]
        def msg=""
        withHttp(uri: KHIPU_URI){
            msg = get(path: '/informacao', query:[q:dados as JSON])
        }

        println "INFORMAÇÃO OBTIDA: $msg"
        return msg
    }

    private def send_data_khipu(dados=null){
        def msg=""
        withHttp(uri: KHIPU_URI){
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
