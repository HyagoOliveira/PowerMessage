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
			<g:hasErrors bean="${associacaoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${associacaoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form action="save"  class="ui form">
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>