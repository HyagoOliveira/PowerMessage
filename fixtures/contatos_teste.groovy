import com.acception.powermessage.Associacao
import com.acception.usuario.*;


fixture {
	
	def hyago = Pessoa.findByNome('Hyago Oliveira')
	def elder = Pessoa.findByNome('Elder Ferreira')
	def derick = Pessoa.findByNome('Derick Rosa')
	def mikael = Pessoa.findByNome('Mikael Lima')
	def anderson = Pessoa.findByNome('Anderson Marques')
	def konno = Pessoa.findByNome('Mister Konno')
	def lion = Pessoa.findByNome('Mister Lion')

	def acceptionAssociacao = Associacao.findByNome('Acception Tecnologias')

	
	if(!hyago){
		println "Criando contato Hyago!";
		hyagoInstance(Pessoa, nome: 'Hyago Oliveira', telefones: [new Telefone(ddd:'91', numero: '98279-1024')])
	}
	if(!elder){
		println "Criando contato Elder!";
		elderInstance(Pessoa, nome: 'Elder Ferreira', telefones: [new Telefone(ddd:'91', numero: '98916-5288')])
	}
	
	if(!derick){
		println "Criando contato Derick!";
		derickInstance(Pessoa, nome: 'Derick Rosa', telefones: [new Telefone(ddd:'91', numero: '98290-9520')])
	}
	if(!mikael){
		println "Criando contato Mikael!";
		mikaelInstance(Pessoa, nome: 'Mikael Lima', telefones: [new Telefone(ddd:'91', numero: '98393-6247')])
	}
	if(!anderson){
		println "Criando contato Anderson!";
		andersonInstance(Pessoa, nome: 'Anderson Marques', telefones: [new Telefone(ddd:'91', numero: '98459-3967')])
	}
	if(!konno){
		println "Criando contato Konno!";
		konnoInstance(Pessoa, nome: 'Mister Konno', telefones: [new Telefone(ddd:'91', numero: '98839-2920')])
	}
	if(!lion){
		println "Criando contato Lion!";
		lionInstance(Pessoa, nome: 'Mister Lion', telefones: [new Telefone(ddd:'63', numero: '99979-5725')])
	}
}