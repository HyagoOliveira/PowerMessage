<%@ page import="com.acception.powermessage.ConfiguracaoSistema" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'configuracaoSistema.label', default: 'Configuração')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
<div id="show-mensagem" class="content scaffold-show" role="main">
	<h1><g:message code="default.show.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>

	<g:form method="post">
		<g:hiddenField name="version" value="${configuracaoSistema?.version}" />
		<g:hiddenField name="id" value="${configuracaoSistema?.id}" />

		<div class="ui form">
			<div class="field">
				<label for="idProjeto">
					<g:message code="configuracaoSistema.khipuUrl.label" default="Url Khipu" />
				</label>
				<g:field name="khipuUrl" type="url" value="${configuracaoInstance.khipuUrl}" required=""/>
			</div>
		</div>
		<br>

		<div class="ui form">
			<div class="field">
				<label for="idProjeto">
					<g:message code="configuracaoSistema.idProjeto.label" default="Id do Projeto" />
				</label>
				<g:textArea name="idProjeto" value="${configuracaoInstance.idProjeto}" required=""/>
			</div>
		</div>
		<br>


		<div class="button">
			<g:actionSubmit class="tiny ui button" action="update" value="Alterar" />
		</div>

	</g:form>
</div>
</body>
</html>