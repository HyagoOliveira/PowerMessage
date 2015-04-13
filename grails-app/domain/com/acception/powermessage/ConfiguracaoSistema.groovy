package com.acception.powermessage

class ConfiguracaoSistema {

    String idProjeto
    String khipuUrl

    static constraints = {
        idProjeto (nullable:false, blank: false)
        khipuUrl (nullable: false, url: true)
    }
}
