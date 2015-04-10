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
		
		<br>
			<g:form method="post"   class="ui form segment">
				<g:hiddenField name="id" value="${associacaoInstance?.id}" />
				<g:hiddenField name="version" value="${associacaoInstance?.version}" />
<%--				<fieldset class="form">--%>
					<g:render template="formedit"/>
<%--				</fieldset>--%>
<%--				<fieldset class="form">--%>
<br><i class="icon save" style="position: absolute;
				z-index: 1;
				vertical-align: bottom;
				opacity: 0.6 !important;
				padding: 8px;
				margin-left:3px;"></i>
			<g:actionSubmit class="tiny labeled ui button" style="padding-left:28px;" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			
			</g:form>
			
		</div>
	</body>
</html>