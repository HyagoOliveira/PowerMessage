
<%@ page import="com.acception.powermessage.Grupo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'grupo.label', default: 'Grupo')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-grupo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-grupo" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list grupo">
			
				<g:if test="${grupoInstance?.mensagens}">
				<li class="fieldcontain">
					<span id="mensagens-label" class="property-label"><g:message code="grupo.mensagens.label" default="Mensagens" /></span>
					
						<g:each in="${grupoInstance.mensagens}" var="m">
						<span class="property-value" aria-labelledby="mensagens-label"><g:link controller="mensagem" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${grupoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="grupo.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${grupoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${grupoInstance?.pessoas}">
				<li class="fieldcontain">
					<span id="pessoas-label" class="property-label"><g:message code="grupo.pessoas.label" default="Pessoas" /></span>
					
						<g:each in="${grupoInstance.pessoas}" var="p">
						<span class="property-value" aria-labelledby="pessoas-label"><g:link controller="pessoa" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${grupoInstance?.id}" />
					<g:link class="edit" action="edit" id="${grupoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>