
<%@ page import="com.acception.usuario.Pessoa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-pessoa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link class="list" action="list"><g:message code="Contato Listagem" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="Novo Contato" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-pessoa" class="content scaffold-show" role="main">
			<h1><g:message code="Ver Contato" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list pessoa">
			
				<g:if test="${pessoaInstance?.nome}">
					<li class="fieldcontain">
						<span id="nome-label" class="property-label"><g:message code="pessoa.nome.label" default="Nome" /></span>
						
							<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${pessoaInstance}" field="nome"/></span>
						
					</li>
				</g:if>
			
				<g:if test="${pessoaInstance?.grupos}">
					<li class="fieldcontain">
						<span id="grupos-label" class="property-label"><g:message code="pessoa.grupos.label" default="Grupos" /></span>
						
							<g:each in="${pessoaInstance.grupos}" var="g">
							<span class="property-value" aria-labelledby="grupos-label"><g:link controller="grupo" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
							</g:each>						
					</li>
				</g:if>
				
				<g:if test="${pessoaInstance?.telefones}">
					<li class="fieldcontain">
						<span id="telefone-label" class="property-label">
							Telefone
						</span> 
						<span class="property-value" aria-labelledby="numero-label">							
							${fieldValue(bean: pessoaInstance, field: "telefones")}
						</span>
					</li>
				</g:if>
				
				
			
<%--				<g:render template="/telefone/show" collection="${pessoaInstance.telefones}" var="telefoneInstance" ></g:render>			--%>
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${pessoaInstance?.id}" />
					<g:link class="edit" action="edit" id="${pessoaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>