package com.acception.usuario

class Estado {
	String nome
	String sigla
	
    static constraints = {
		nome(maxSize:40,nullable:true)
		sigla(maxSize:2)
    }
	
	String toString() {
		sigla
	}
	static mapping = {
		id generator:'sequence', params:[sequence:'estado_seq']
	}
}
