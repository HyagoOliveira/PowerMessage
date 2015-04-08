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

<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${assetPath(src: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${assetPath(src: 'apple-touch-icon-retina.png')}">

<g:layoutHead />
<asset:javascript src="semantic.min.js"/>
<asset:stylesheet src="semantic.min.css"/>
	<asset:javascript src="application.js"/>
<r:layoutResources />
</head>
<body style="max-width: 900px; margin: 0 auto">
	<sec:ifLoggedIn>
		<div class="ui menu">
				<a class="item" href="${createLink(uri: '/' )}" class="item">
					<i class="home icon"></i>Home
				</a>
				<sec:ifAnyGranted roles="ROLE_ADMIN">
					<g:link controller="mensagem" action="create" class="item">
						<i class="mail icon"></i> Enviar Mensagem
					</g:link>
					<g:link controller="mensagem" action="index" class="item">
					<i class="mail outline icon"></i>Mensagens Enviadas
					</g:link>
					<g:link controller="pessoa" action="index" class="item">
						<i class="book icon"></i>Contatos
					</g:link>
					<g:link controller="grupo" action="index" class="item">
						<i class="users icon"></i>Grupos
					</g:link>
				</sec:ifAnyGranted>

				<sec:ifAnyGranted roles="ROLE_SUPER_ADMIN">
					<g:link controller="associacao" action="index" class="item">
						<i class="building icon"></i>Associação
					</g:link>
				</sec:ifAnyGranted>

				<sec:ifLoggedIn>
					<g:link controller="logout" class="ui item right">Logout</g:link>
				</sec:ifLoggedIn>
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