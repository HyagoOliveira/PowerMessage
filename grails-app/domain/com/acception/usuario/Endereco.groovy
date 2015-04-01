package com.acception.usuario

import com.acception.authentication.Usuario

class Endereco {
	
	String logradouro
	String numero
	String complemento
	String bairro
	String cep
	Cidade cidade
	Estado estado
	
    static constraints = {
		logradouro(nullable:true,maxSize:60)
		numero(nullable:true,maxSize:20)
		complemento(nullable:true,maxSize:60)
		bairro(nullable:true,maxSize:40)
		cep(nullable:true,maxSize:10)
		cidade(nullable:true)
    }
	static transients = ['valido']
	
	def toHtml() {
		"""${logradouro}${numero ? (','+numero) : ''}<br/>
		${complemento ? complemento + '<br/>' : ''}
		${bairro ? 'Bairro: '+bairro : ''} - CEP: ${cep ? Util.rawToCep(cep) : '---'}<br/>
		${cidade}"""
	}
	String toString() {
		"${logradouro}${numero ? (','+numero) : ''}\n${complemento}\n${bairro} CEP: ${cep}\n${cidade}"
	}
	
	boolean getValido() {
		(cidade && cep && logradouro)
	}
}
