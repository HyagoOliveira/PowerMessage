import com.acception.powermessage.Grupo;
import com.acception.usuario.Pessoa;


fixture {
	def grupo = Grupo.findByNome('Acception Developers')
	
	println "Criando grupo Acception Developers";
	
	developers(Grupo, 
		nome: 'Acception Developers', 
		pessoas: [
			Pessoa.findByNome('Hyago Oliveira'),
			Pessoa.findByNome('Elder Ferreira'),
			Pessoa.findByNome('Derick Rosa'),
			Pessoa.findByNome('Anderson Marques'),
			Pessoa.findByNome('Mikael Lima')
			]
		)
}