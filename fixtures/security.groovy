import com.acception.authentication.*;


fixture {
	def administrador = Usuario.findByUsername('suporte.acception');
	if(administrador)
		return
	
	println "Criando usuário super administrador!"
	
	superPermissao(Permissao, authority: 'ROLE_SUPER_ADMIN')
	superAdminstrador(Usuario, 
		username: "suporte.acception",
		password: "jmml72",
		enabled: true,
		accountExpired: false,
		accountLocked: false,
		passwordExpired:false)
	
	superAdministradorPermisao(UsuarioPermissao, usuario: superAdminstrador, permissao: superPermissao)
}