package com.acception.powermessage

import com.acception.usuario.Pessoa

class Mensagem {
	String texto
	Date dataEnvio
	Integer tentativas
	MsgStatus msgStatus

	static hasMany = [grupos: Grupo, pessoas: Pessoa]	
	static belongsTo = [Associacao, Pessoa, Grupo]
	
    static constraints = {
		texto nullable:false, blank:false, maxSize: 512		
		dataEnvio nullable:true
		msgStatus nullable:true
		tentativas nullable:true
    }
}