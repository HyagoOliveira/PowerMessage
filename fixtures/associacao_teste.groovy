import com.acception.authentication.*;
import com.acception.powermessage.*;
import com.acception.usuario.*;


fixture {
	def associacao = Associacao.findByNome('Acception Tecnologias');
	if(associacao)
		return
	
	println "Criando associação Acception Tecnologias!"
	
	Endereco enderecoI = new Endereco(
		logradouro: 'Predio Metropolitan',
		numero: '1107',
		complemento:'prox. a. cacela',
		bairro: 'Cremação',
		cep: '66666-666',
		cidade: Cidade.findByNome('BELEM'),
		estado: Estado.findBySigla('PA')
		)
	
	acceptionTecnologia(Associacao, 
		username: "teste_acception",
		password: "123456",
		enabled: true,
		accountExpired: false,
		accountLocked: false,
		passwordExpired:false,
		nome: 'Acception Tecnologias', 
		email:'acception@acception.com.br',
		endereco: enderecoI);
	
	adminPermissao(Permissao, authority: 'ROLE_ADMIN')	
	administradorPermisao(UsuarioPermissao, usuario: acceptionTecnologia, permissao: adminPermissao)
}