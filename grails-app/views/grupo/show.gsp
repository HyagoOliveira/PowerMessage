
<%@ page import="com.acception.powermessage.Grupo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'grupo.label', default: 'Grupo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-grupo" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:link class="list" action="list">
				<div class="tiny ui button">
					<i class="icon list"></i>
					<g:message code="default.list.label" args="[entityName]" />
				</div>
			</g:link>
			
			<g:link action="create">
				<div class="tiny ui button">
					<i class="icon users"></i>
					<g:message code="default.new.label" args="[entityName]" />
				</div>
			</g:link>
			
			<table class="ui table">
				<g:if test="${grupoInstance?.nome}">
					<tr>
						<td>
							<span id="nome-label" class="property-label"><g:message code="grupo.nome.label" default="Nome" /></span>:
						</td>
						<td>
							<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${grupoInstance}" field="nome"/></span>
						</td>
					</tr>
				</g:if>
				<g:if test="${grupoInstance?.pessoas}">
					<tr>
						<td>
							<span id="pessoas-label" class="property-label"><g:message code="grupo.pessoas.label" default="Contatos" /></span>:
						</td>
						<td>
							<g:each in="${grupoInstance.pessoas}" var="p">
								<span class="property-value" aria-labelledby="pessoas-label"><g:link controller="pessoa" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
							</g:each>
						</td>
					</tr>
				</g:if>
			</table>
			<g:form>
				<g:hiddenField name="id" value="${grupoInstance?.id}" />
				<g:link action="edit" id="${grupoInstance?.id}">
					<div class="tiny ui button">
						<i class="icon pencil"></i>
						<g:message code="default.button.edit.label" default="Edit" />
					</div>
				</g:link>
				<i class="icon trash" style="position: absolute;
				z-index: 1;
				vertical-align: bottom;
				opacity: 0.6 !important;
				padding: 8px;
				margin-left:3px;"></i>
				<g:actionSubmit class="tiny ui button" style="padding-left:28px;" action="delete" code="default.button.delete.label" value="Remover" />
				
			</g:form>
		</div>
	</body>
</html>