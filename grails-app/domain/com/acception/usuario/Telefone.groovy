package com.acception.usuario

class Telefone {

    String ddd
	String numero
	
	static belongsTo = [pessoa:Pessoa]
	
	static constraints = {
		ddd(nullable:true, maxSize:3)
		numero(nullable:true, maxSize:12)
	}
	
	String toString() {
		"${ddd ? '('+ddd+') ' : ''}${numero ?: ''}"
	}
	def isEqual(tel) {
		if (!tel) return false
		else return (tel.ddd==this.ddd && tel.numero==this.numero)
	}
}
