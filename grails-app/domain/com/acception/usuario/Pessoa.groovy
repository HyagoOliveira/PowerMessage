package com.acception.usuario

import com.acception.powermessage.*

class Pessoa {
	String nome	
	Boolean ativo = true;
	
	static belongsTo = [Associacao, Grupo]
	static hasMany = [grupos: Grupo, mensagens: Mensagem, telefones:Telefone]
	
    static constraints = {
		nome nullable: false, blank: false
		telefones nullable:false, blank:false
    }
	
	static mapping = {
		telefones cascade: "all-delete-orphan"
	}
	
	
	String toString() {
		"${nome}"
	}
	
	static namedQueries = {
		ativos {
			eq ('ativo', true)
		}
	}
	
	void reativar(){
		ativo = true;
	}
	
	void desativar(){
		ativo = false;
	}
	
	static getIfAtivo(Integer id){
		Pessoa p = Pessoa.get(id)
		if(p?.ativo)
			return p;
	}
}
