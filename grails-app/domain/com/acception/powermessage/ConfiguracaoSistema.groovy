package com.acception.powermessage

class ConfiguracaoSistema {

    String idProjeto
    String khipuUrl

    private static  ConfiguracaoSistema instance = null

    static constraints = {
        idProjeto (nullable:false, blank: false)
        khipuUrl (nullable: false, url: true)
    }

    static transients = ['instance']

    public static ConfiguracaoSistema getInstance() {
        if(!instance) {
            instance = ConfiguracaoSistema.getAll()[0]
        }

        return instance;
    }
}
