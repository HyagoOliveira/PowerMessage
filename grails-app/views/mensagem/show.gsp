
<%@ page import="com.acception.powermessage.Mensagem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-mensagem" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Nova Mensagem" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-mensagem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mensagem">
			
				<g:if test="${mensagemInstance?.texto}">
				<li class="fieldcontain">
					<span id="texto-label" class="property-label"><g:message code="mensagem.texto.label" default="Texto" /></span>
					
						<span class="property-value" aria-labelledby="texto-label"><g:fieldValue bean="${mensagemInstance}" field="texto"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mensagemInstance?.dataEnvio}">
				<li class="fieldcontain">
					<span id="dataEnvio-label" class="property-label"><g:message code="mensagem.dataEnvio.label" default="Data de Envio" /></span>
					
						<span class="property-value" aria-labelledby="dataEnvio-label">
						<g:formatDate format="dd MMMM, yyyy" date="${mensagemInstance?.dataEnvio}" /></span>
					
				</li>
				</g:if>		
				
			
				<g:if test="${mensagemInstance?.msgStatus}">
				<li class="fieldcontain">
					<span id="msgStatus-label" class="property-label"><g:message code="mensagem.msgStatus.label" default="Msg Status" /></span>
					
						<span class="property-value" aria-labelledby="msgStatus-label"><g:fieldValue bean="${mensagemInstance}" field="msgStatus"/></span>
					
				</li>
				</g:if>			
				
			
				<g:if test="${mensagemInstance?.tentativas}">
				<li class="fieldcontain">
					<span id="tentativas-label" class="property-label"><g:message code="mensagem.tentativas.label" default="Tentativas" /></span>
					
						<span class="property-value" aria-labelledby="tentativas-label"><g:fieldValue bean="${mensagemInstance}" field="tentativas"/></span>
					
				</li>
				</g:if>
				
				<g:if test="${mensagemInstance?.grupos}">
				<li class="fieldcontain">
					<span id="grupos-label" class="property-label">Enviado para os grupos:</span>
					
						<g:each in="${mensagemInstance.grupos}" var="g">
						<span class="property-value" aria-labelledby="grupos-label"><g:link controller="grupo" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
				
				<g:if test="${mensagemInstance?.pessoas}">
				<li class="fieldcontain">
					<span id="pessoas-label" class="property-label">Enviado para as pessoas</span>
					
						<g:each in="${mensagemInstance.pessoas}" var="p">
						<span class="property-value" aria-labelledby="pessoas-label"><g:link controller="pessoa" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${mensagemInstance?.id}" />
					<a href="${createLink(uri: '/mensagem/create?texto=' + fieldValue(bean: mensagemInstance, field: "texto"))}" class="edit" ><g:message code="Encaminhar" default="Encaminhar" /></a>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>