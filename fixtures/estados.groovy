import com.acception.usuario.Estado


fixture {
	
	if(Estado.getAll().size() > 0)
		return;
	
	println "Populando estados!"
	
	ufAC(Estado, sigla:'AC', nome:'Acre')
	ufAL(Estado, sigla:'AL',nome:'Alagoas')
	ufAM(Estado, sigla:'AM',nome:'Amazonas')
	ufAP(Estado, sigla:'AP',nome:'Amapá')
	ufBA(Estado, sigla:'BA',nome:'Bahia')
	ufCE(Estado, sigla:'CE',nome:'Ceará')
	ufDF(Estado, sigla:'DF',nome:'Distrito Federal')
	ufES(Estado, sigla:'ES',nome:'Espirito Santos')
	ufGO(Estado, sigla:'GO',nome:'Goiás')
	ufMA(Estado, sigla:'MA',nome:'Maranhão')
	ufMG(Estado, sigla:'MG',nome:'Minas Gerais')
	ufMS(Estado, sigla:'MS',nome:'Mato Grosso do Sul')
	ufMT(Estado, sigla:'MT',nome:'Mato Grosso')
	ufPA(Estado, sigla:'PA',nome:'Pará')
	ufPB(Estado, sigla:'PB',nome:'Paraíba')
	ufPE(Estado, sigla:'PE',nome:'Pernambuco')
	ufPI(Estado, sigla:'PI',nome:'Piauí')
	ufPR(Estado, sigla:'PR',nome:'Paraná')
	ufRJ(Estado, sigla:'RJ',nome:'Rio de Janeiro')
	ufRN(Estado, sigla:'RN',nome:'Rio Grande do Norte')
	ufRO(Estado, sigla:'RO',nome:'Rondônia')
	ufRR(Estado, sigla:'RR',nome:'Roraima')
	ufRS(Estado, sigla:'RS',nome:'Rio Grande do Sul')
	ufSC(Estado, sigla:'SC',nome:'Santa Catarina')
	ufSE(Estado, sigla:'SE',nome:'Sergipe')
	ufSP(Estado, sigla:'SP',nome:'São Paulo')
	ufTO(Estado, sigla:'TO',nome:'Tocantins')
}