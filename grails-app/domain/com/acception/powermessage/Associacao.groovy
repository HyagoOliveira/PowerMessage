package com.acception.powermessage

import com.acception.authentication.Usuario
import com.acception.usuario.*



class Associacao extends Usuario {
	String nome
	String email 	
	Endereco endereco
	
	static hasMany = [pessoas: Pessoa, grupos: Grupo, mensagens: Mensagem]
	
	static embedded = ['endereco']
	
    static constraints = {
		nome nullable: false, blank: false
		email nullable: false, blank: false, email:true
		endereco nullable: false
	}
}
