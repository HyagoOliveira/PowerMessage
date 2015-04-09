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
				<br><i class="icon save" style="position: absolute;
				z-index: 1;
				vertical-align: bottom;
				opacity: 0.6 !important;
				padding: 8px;
				margin-left:3px;"></i>
					<g:submitButton action="create" name="create" style="padding-left:28px;" class="tiny labeled ui button" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			</g:form>
			<br><br>
		</div>
	</body>
</html>