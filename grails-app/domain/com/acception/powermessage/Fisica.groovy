package com.acception.powermessage

import com.acception.usuario.Pessoa

class Fisica extends Pessoa {
	String cpf
    static constraints = {
		nome nullable: false, blank: false
    }
}
