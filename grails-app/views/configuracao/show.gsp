
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
	<table class="ui padded table">
		<tbody>
		<g:if test="${configuracaoInstance?.idProjeto}">
			<tr>
				<td>Id do Projeto</td>
				<td>${configuracaoInstance.idProjeto[0][0..80]} .......</td>
			</tr>
		</g:if>

		<g:if test="${configuracaoInstance?.khipuUrl}">
			<tr>
				<td>Url do Khipu</td>
				<td>${configuracaoInstance.khipuUrl[0]}</td>
			</tr>
		</g:if>
		</tbody>
	</table>

	<g:form>
		<g:hiddenField name="id" value="${configuracaoInstance?.id}" />

		<div class="ui basic button">
			<i class="edit icon"></i>
			<g:link action="edit">Reconfigurar</g:link>
		</div>
	</g:form>
</div>
</body>
</html>