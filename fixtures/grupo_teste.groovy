import com.acception.powermessage.Grupo;
import com.acception.usuario.Pessoa;


fixture {

	if(!Grupo.findByNome('Acception Developers')) {
		println "Criando Acception Developers";

		developers(Grupo,
				nome: 'Acception Developers',
				pessoas: [
						Pessoa.findByNome('Hyago Oliveira'),
						Pessoa.findByNome('Elder Ferreira'),
						Pessoa.findByNome('Derick Rosa'),
						Pessoa.findByNome('Anderson Marques'),
						Pessoa.findByNome('Mikael Lima'),
						Pessoa.findByNome('Mister Konno'),
						Pessoa.findByNome('Mister Lion')
				]
		)
	}

	if(!Grupo.findByNome('Acception Bosses')) {
		println "Criando Acception Bosses";

		bosses(Grupo,
				nome: 'Acception Bosses',
				pessoas: [
						Pessoa.findByNome('Mister Konno'),
						Pessoa.findByNome('Mister Lion')
				]
		)
	}
}