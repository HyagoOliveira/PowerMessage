<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	
		<title><g:layoutTitle default="Grails" /></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">
		
		
		<asset:javascript src="application.js"/>
		<asset:javascript src="script.js"/>
		
		<asset:stylesheet href="menu.css"/>
		<asset:stylesheet href="mobile.css"/>
		<asset:stylesheet href="main.css"/>
		<asset:stylesheet href="application.css"/>
	
		<g:layoutHead />
		<r:layoutResources />
	</head>
	<body>	
		<div id="grailsLogo" align="center" role="banner">
			<a href="${createLink(uri: '/')}">
				<asset:image src="power_logo.png" alt="Grails"/>
			</a>
		</div>	
		
		<sec:ifLoggedIn>		
			<div id='cssmenu'>
				<ul>
					<li><a href="${createLink(uri: '/' )}">Home</a></li>
					<sec:ifAnyGranted roles="ROLE_ADMIN">
					<li><g:link controller="mensagem" action="create">Enviar Mensagem</g:link>
						<li><g:link controller="mensagem" action="index">Mensagens Enviadas</g:link></li>					
						<li><g:link controller="pessoa" action="index">Contatos</g:link></li>
						<li><g:link controller="grupo" action="index">Grupos</g:link></li>
					</sec:ifAnyGranted>
					
					<sec:ifAnyGranted roles="ROLE_SUPER_ADMIN">
						<li><g:link controller="associacao" action="index">Associação</g:link></li>
					</sec:ifAnyGranted>
					
					<sec:ifLoggedIn>
						<li style="float: right;"><g:link controller="logout">Logout</g:link></li>
					</sec:ifLoggedIn>
				</ul>
			</div>
		</sec:ifLoggedIn>	
		
		
		<g:layoutBody />
		
		<div class="footer" role="contentinfo"></div>
		<div id="spinner" class="spinner" style="display: none;">
			<g:message code="spinner.alt" default="Loading&hellip;" />
		</div>
		<r:layoutResources />
	</body>
</html>