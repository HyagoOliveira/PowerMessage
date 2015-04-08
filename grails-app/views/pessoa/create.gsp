<%@ page import="com.acception.usuario.Pessoa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
					
	</head>
	<body>
		<div id="create-pessoa" role="main">
			<h1><g:message code="Criar Contato" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${pessoaInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${pessoaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save">
				<g:render template="form"/>
				<g:submitButton name="create" class="tiny ui button" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</g:form>
		</div>
	</body>
</html>