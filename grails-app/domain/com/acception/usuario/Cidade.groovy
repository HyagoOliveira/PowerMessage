package com.acception.usuario

class Cidade {
	String nome
	Estado estado
	
    static constraints = {
		nome(maxSize:60)
    }
	String toString() {
		"${nome} - ${estado}"
	}
	static mapping = {
		id generator:'sequence', params:[sequence:'cidade_seq']
	}
	
}
