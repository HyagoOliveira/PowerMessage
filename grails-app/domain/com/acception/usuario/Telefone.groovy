package com.acception.usuario

class Telefone {

    String ddd
	String numero
	Operadora operadora
	
	static belongsTo = [pessoa:Pessoa]
	
	static constraints = {
		ddd(nullable:true, maxSize:3)
		numero(nullable:true, maxSize:12)
		operadora(nullable: true)
	}
	
	String toString() {
		"${ddd ? '('+ddd+') ' : ''}${numero ?: ''}"
	}
	def isEqual(tel) {
		if (!tel) return false
		else return (tel.ddd==this.ddd && tel.numero==this.numero)
	}
}
