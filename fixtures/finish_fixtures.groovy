import com.acception.powermessage.Associacao
import com.acception.powermessage.Grupo
import com.acception.usuario.Pessoa


fixture {

	def acceptionAssociacao = Associacao.findByNome('Acception Tecnologias')

	if(!acceptionAssociacao.pessoas) {
		acceptionAssociacao.addToPessoas(Pessoa.findByNome('Hyago Oliveira'))
		acceptionAssociacao.addToPessoas(Pessoa.findByNome('Elder Ferreira'))
		acceptionAssociacao.addToPessoas(Pessoa.findByNome('Derick Rosa'))
		acceptionAssociacao.addToPessoas(Pessoa.findByNome('Mikael Lima'))
		acceptionAssociacao.addToPessoas(Pessoa.findByNome('Anderson Marques'))
		acceptionAssociacao.addToPessoas(Pessoa.findByNome('Mister Konno'))
		acceptionAssociacao.addToPessoas(Pessoa.findByNome('Mister Lion'))
	}

	if(!acceptionAssociacao.grupos) {
		acceptionAssociacao.addToGrupos(Grupo.findByNome('Acception Developers'))
		acceptionAssociacao.addToGrupos(Grupo.findByNome('Acception Bosses'))
	}
}

