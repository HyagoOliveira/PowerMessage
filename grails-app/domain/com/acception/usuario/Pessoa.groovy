package com.acception.usuario

import com.acception.powermessage.*

class Pessoa {
	String nome	
	
	static belongsTo = [Associacao, Grupo]
	static hasMany = [grupos: Grupo, mensagens: Mensagem, telefones:Telefone]
	
    static constraints = {
		nome nullable: false, blank: false
		telefones nullable:false, blank:false
    }
	
	
	String toString() {
		"${nome}"
	}
}
