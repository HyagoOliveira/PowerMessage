<%@ page import="com.acception.usuario.Pessoa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-pessoa" class="content scaffold-edit" role="main">
			<h1><g:message code="Editar Contato" args="[entityName]" /></h1>
			
			<g:link action="list">
				<div class="tiny ui button" >
					<i class="icon list"></i>
					<g:message code="Contato Listagem" args="[entityName]" />
				</div>
			</g:link>
			<g:link class="create" action="create">
				<div class="tiny ui button">
					<i class="icon add user"></i>
					<g:message code="Novo Contato" args="[entityName]" />
				</div>
			</g:link>
			
			<g:if test="${flash.message}">
			<div class="ui info message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${pessoaInstance}">
			<ul class="ui negative message" role="alert">
				<g:eachError bean="${pessoaInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form  class="ui form segment" method="post" >
				<g:hiddenField name="id" value="${pessoaInstance?.id}" />
				<g:hiddenField name="version" value="${pessoaInstance?.version}" />
				<g:render template="form"/>
				<i class="icon save" style="position: absolute;
				z-index: 1;
				vertical-align: bottom;
				opacity: 0.6 !important;
				padding: 8px;
				margin-left:3px;"></i>
				<g:actionSubmit value="Alterar" style="padding-left:28px;"  action="update" class="tiny labeled ui button"/>
				
			</g:form>
		</div>
	</body>
</html>