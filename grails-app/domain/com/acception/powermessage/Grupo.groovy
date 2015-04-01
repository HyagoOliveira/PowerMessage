package com.acception.powermessage

import com.acception.usuario.Pessoa

class Grupo {
	String nome
	
	static belongsTo = [Associacao]
	static hasMany = [pessoas: Pessoa, mensagens: Mensagem]	
	
    static constraints = {
    }
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return nome;
	}
}
