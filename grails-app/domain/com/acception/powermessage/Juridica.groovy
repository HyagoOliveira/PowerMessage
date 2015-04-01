package com.acception.powermessage

import com.acception.usuario.Pessoa

class Juridica extends Pessoa {
	String cnpj
    static constraints = {
		nome nullable: false, blank: false
    }
}
