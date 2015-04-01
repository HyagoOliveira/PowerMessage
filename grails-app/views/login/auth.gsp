<html>
	<head>
		<meta name='layout' content='main' />
		<title><g:message code="springSecurity.login.title" /></title>
		<asset:stylesheet href="auth.css"/>
		<asset:stylesheet href="login.css"/>
	</head>
	
<body>
	<div id="page-body" role="main">
		<sec:ifNotLoggedIn>
			<p>Seja bem-vindo(a) ao PowerMessage, o sistema de envio de
				mensagens desenvolvido pela equipe da Acception Tecnologia.</p>
		</sec:ifNotLoggedIn>
		<sec:ifAnyGranted roles="ROLE_SUPER_ADMIN">
			<p>Seja bem-vindo(a), Super Administrador, ao sistema de envio de
				mensagens desenvolvido pela equipe da Acception Tecnologia.</p>
		</sec:ifAnyGranted>
		<sec:ifAnyGranted roles="ROLE_ADMIN">
			<p>Seja bem-vindo(a), <sec:username/>, ao sistema de envio de
				mensagens desenvolvido pela equipe da Acception Tecnologia.</p>
		</sec:ifAnyGranted>

	</div>
	<sec:ifNotLoggedIn>
		<div class="login-card">
			<h1>Log-in</h1>
			<br>

			<g:if test='${flash.message}'>
				<div class='login_message'>
					${flash.message}
				</div>
			</g:if>
			<form action='${request.contextPath}/j_spring_security_check' method='POST' id='loginForm' class='cssform' autocomplete='off'>
				<input type="text" placeholder="Usuário" name='j_username' id='username'>  
				<input type="password" placeholder="Senha" name='j_password' id='password'>
				<p id="remember_me_holder">
					<input type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if> />
					<label for='remember_me'>Lembre-me</label>
				</p>
				<input type='submit' id="submit" value='${message(code: "springSecurity.login.button")}' class="login login-submit" />
			</form>
		</div>

		<!-- <div id="error"><img src="https://dl.dropboxusercontent.com/u/23299152/Delete-icon.png" /> Your caps-lock is on.</div> -->

		<script
			src='http://codepen.io/assets/libs/fullpage/jquery_and_jqueryui.js'></script>
	</sec:ifNotLoggedIn>
	<script type='text/javascript'>
	<!--
		(function() {
			document.forms['loginForm'].elements['j_username'].focus();
		})();
	// -->
	</script>
</body>
</html>