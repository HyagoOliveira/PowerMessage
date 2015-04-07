import com.acception.usuario.*;


fixture {
	
	def hyago = Pessoa.findByNome('Hyago Oliveira')
	def elder = Pessoa.findByNome('Elder Ferreira')
	def derick = Pessoa.findByNome('Derick Rosa')
	def mikael = Pessoa.findByNome('Mikael Lima')
	def anderson = Pessoa.findByNome('Anderson Marques')
	
	
	if(!hyago){
		println "Criando contato Hyago!";
		hyagoInstance(Pessoa, nome: 'Hyago Oliveira', telefones: [new Telefone(ddd:'91', numero: '987654321')])
	}
	if(!elder){
		println "Criando contato Elder!";
		elderInstance(Pessoa, nome: 'Elder Ferreira', telefones: [new Telefone(ddd:'91', numero: '987654321')])
	}
	
	if(!derick){
		println "Criando contato Derick!";
		derickInstance(Pessoa, nome: 'Derick Rosa', telefones: [new Telefone(ddd:'91', numero: '987654321')])
	}
	if(!mikael){
		println "Criando contato Mikael!";
		mikaelInstance(Pessoa, nome: 'Mikael Lima', telefones: [new Telefone(ddd:'91', numero: '987654321')])
	}
	if(!anderson){
		println "Criando contato Anderson!";
		andersonInstance(Pessoa, nome: 'Anderson Marques', telefones: [new Telefone(ddd:'91', numero: '987654321')])
	}
}