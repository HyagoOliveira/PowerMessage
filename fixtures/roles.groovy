import com.acception.authentication.Permissao

fixture {

	if(!Permissao.findByAuthority('ROLE_ADMIN')) {
		println "Criando ROLE_ADMIN!"
		adminPermissao(Permissao, authority: 'ROLE_ADMIN')
	}

	if(!Permissao.findByAuthority('ROLE_ASSOCIACAO')) {
		println "Criando ROLE_ASSOCIACAO!"
		associacaoPermissao(Permissao, authority: 'ROLE_ASSOCIACAO')
	}
}