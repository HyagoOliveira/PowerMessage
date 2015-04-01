package com.acception.powermessage;

public enum MsgStatus {
	ENVIANDO("Enviando"),
	ENVIADA("Enviada"),
	CHEGOU("Chegou"), 
	PERDIDA("Perdida"), 
	NAO_ENVIADA("Não Enviada"),
	EM_ESPERA("Em Espera"), 
	LIDA("Lida")
	
	String nome
	
	MsgStatus(nome){
		this.nome = nome
	}

	static def list(){
		[ENVIANDO, ENVIADA, CHEGOU, PERDIDA, NAO_ENVIADA, EM_ESPERA, LIDA]
	}
}
