package com.acception.usuario

import com.acception.powermessage.*

class Pessoa {
	String nome
	String endereco
	Telefone telefone1
	Telefone telefone2
	
	static belongsTo = [Associacao, Grupo]
	static hasMany = [grupos: Grupo, mensagens: Mensagem]
	
    static constraints = {
		nome nullable: false, blank: false
		endereco nullable: false, blank: false
		telefone1 nullable: false, blank: false
		telefone2 nullable: true, blank: true
    }
	
	
	String toString() {
		"${nome}"
	}
}
