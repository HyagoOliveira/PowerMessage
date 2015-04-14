import com.acception.authentication.*
import com.acception.powermessage.ConfiguracaoSistema;

fixture {

	if(ConfiguracaoSistema.count()==0){
		println "Criando configuração padrão do sistema!"
		defaultConfig(ConfiguracaoSistema,
				idProjeto: '7363000269c85acdce6873270f6898852f5f7684570626f8167e929369bd2b450ad549884367470e2371076c423c25552c1b79260c65f3a41613a07920baccc4bb73ef1c34371040e0c4462e102909b8cffa11d245b0b5b942727fa2e12e23a238bacb2e',
				khipuUrl: 'http://192.168.1.140:6543'
		)
	}

	if(Usuario.findByUsername('suporte.acception'))
		return
	
	println "Criando usuário administrador!"

	adminstrador(Usuario,
		username: "suporte.acception",
		password: "jmml72",
		enabled: true,
		accountExpired: false,
		accountLocked: false,
		passwordExpired:false)
	
	administradorUserRole(UsuarioPermissao, usuario: adminstrador,
			permissao: Permissao.findByAuthority('ROLE_ADMIN'))
}