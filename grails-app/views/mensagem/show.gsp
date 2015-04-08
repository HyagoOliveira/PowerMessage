
<%@ page import="com.acception.powermessage.Mensagem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-mensagem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="ui table">
				<g:if test="${mensagemInstance?.texto}">
					<tr>
						<td>
							<span id="texto-label" class="property-label"><g:message code="mensagem.texto.label" default="Texto" /></span>
						</td>
						<td>
							<span class="property-value" aria-labelledby="texto-label"><g:fieldValue bean="${mensagemInstance}" field="texto"/></span>
						</td>				
					</tr>
				</g:if>
			
				<g:if test="${mensagemInstance?.dataEnvio}">
					<tr>
						<td>
							<span id="dataEnvio-label" class="property-label"><g:message code="mensagem.dataEnvio.label" default="Data de Envio" /></span>
						</td>
						<td>
							<span class="property-value" aria-labelledby="dataEnvio-label">
								<g:formatDate format="dd MMMM, yyyy" date="${mensagemInstance?.dataEnvio}" />
							</span>
						</td>			
					</tr>
				</g:if>		
				
			
				<g:if test="${mensagemInstance?.msgStatus}">
					<tr>
						<td>
							<span id="msgStatus-label" class="property-label"><g:message code="mensagem.msgStatus.label" default="Msg Status" /></span>
						</td>
						<td>
							<span class="property-value" aria-labelledby="msgStatus-label"><g:fieldValue bean="${mensagemInstance}" field="msgStatus"/></span>
						</td>					
					</tr>
				</g:if>			
				
			
				<g:if test="${mensagemInstance?.tentativas}">
					<tr>
						<td>
							<span id="tentativas-label" class="property-label"><g:message code="mensagem.tentativas.label" default="Tentativas" /></span>
						</td>
						<td>
							<span class="property-value" aria-labelledby="tentativas-label"><g:fieldValue bean="${mensagemInstance}" field="tentativas"/></span>
						</td>
					</tr>
				</g:if>
				
				<g:if test="${mensagemInstance?.grupos}">
					<tr>
						<td>
							<span id="grupos-label" class="property-label">Enviado para os grupos:</span>
						</td>
						<td>
							<g:each in="${mensagemInstance.grupos}" var="g">
								<span class="property-value" aria-labelledby="grupos-label">
									<g:link controller="grupo" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link>
								</span>
							</g:each>
						</td>					
					
					</tr>
				</g:if>
				
				<g:if test="${mensagemInstance?.pessoas}">
					<tr>
						<td>
							<span id="pessoas-label" class="property-label">Enviado para as pessoas</span>
						</td>
						<td>
							<g:each in="${mensagemInstance.pessoas}" var="p">
								<span class="property-value" aria-labelledby="pessoas-label"><g:link controller="pessoa" action="show" id="${p?.id}">${p?.encodeAsHTML()}</g:link></span>
							</g:each>
						</td>
					</tr>
				</g:if>
			</table>			
			
			<g:form>
				<g:hiddenField name="id" value="${mensagemInstance?.id}" />
				<a href="${createLink(uri: '/mensagem/create?texto=' + fieldValue(bean: mensagemInstance, field: "texto"))}">
					<div class="tiny labeled ui button">
						<i class="icon reply"></i>
						<g:message code="Encaminhar" default="Encaminhar" />
					</div>
				</a>
				<g:link action="delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
					<div class="tiny labeled ui button">
						<i class="icon trash"></i>
						<g:message code="default.button.delete.label" default="Delete" />
					</div>
				</g:link>
			</g:form>
		</div>
	</body>
</html>