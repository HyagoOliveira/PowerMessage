<%@ page import="com.acception.powermessage.Associacao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'associacao.label', default: 'Associacao')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-associacao" class="content scaffold-edit" role="main">
		<h1>
			<g:message code="Ver Associação" args="[entityName]" />
		</h1>
		
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>

		<g:link action="list">
			<div class="tiny labeled ui button">
				<i class="icon list"></i>
				<g:message code="Associação Listagem" args="[entityName]" />
			</div>
		</g:link>
		<g:link action="create">
			<div class="tiny labeled ui button">
				<i class="icon building"></i>
				<g:message code="Nova Associação" args="[entityName]" />
			</div>
		</g:link>
		
		<br><br>
			<g:form method="post"  class="ui form">
				<g:hiddenField name="id" value="${associacaoInstance?.id}" />
				<g:hiddenField name="version" value="${associacaoInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="form">
			<g:actionSubmit class="tiny labeled ui button" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<g:actionSubmit class="tiny labeled ui button" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
			</g:form>
			<br>
		</div>
	</body>
</html>