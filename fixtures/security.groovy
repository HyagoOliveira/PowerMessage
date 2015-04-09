import com.acception.authentication.*;

fixture {

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