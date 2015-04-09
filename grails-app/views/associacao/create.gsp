<%@ page import="com.acception.powermessage.Associacao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'associacao.label', default: 'Associação')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<g:link class="list" action="list">
				<div class="tiny ui button">
					<i class="icon list"></i>
					<g:message code="default.list.label" args="[entityName]" />
				</div>
			</g:link>
		<div id="create-associacao" class="content scaffold-create" role="main">
			<h1><g:message code="Criar Associação" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:form action="save"  class="ui form">
					<g:render template="form"/>
				<br>
					<g:submitButton name="create" class="tiny labeled ui button" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</g:form>
		</div>
	</body>
</html>