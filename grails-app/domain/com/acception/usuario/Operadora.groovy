package com.acception.usuario

public enum Operadora {

    TIM("Tim"),
    VIVO("Vivo"),
    CLARO("Claro"),
    OI("Oi"),
	ALGAR("Algar"),
	NEXTEL("Nextel"),
	SERCOMTEL("Sercomtel"),
	CTBC("CTBC"),
	CONVERGIA("Convergia"),
	INTELIG("Intelig Tim"),
	GVT("GVT"),
	AEROTECH("Aerotech")
	
    String nome

    Operadora(nome){
        this.nome=nome
    }

    static def list(){
        [TIM, VIVO, CLARO, OI, ALGAR, NEXTEL, SERCOMTEL, CTBC, CONVERGIA, INTELIG, GVT, AEROTECH]
    }

    static transients = ['operadora']

    static Operadora getOperadora(def numero){
        Operadora operadora
        def prefixo = numero[1..2]

        if (prefixo in '80'..'83')
            operadora = Operadora.TIM
        else if (prefixo in '84'..'85')
            operadora = Operadora.CLARO
        else if (prefixo in '86'..'88')
            operadora = Operadora.OI
        else if (prefixo in '91'..'94')
            operadora = Operadora.VIVO

        operadora
    }
}
