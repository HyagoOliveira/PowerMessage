<%@ page import="com.acception.usuario.Pessoa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-pessoa" class="content scaffold-show" role="main">
			<h1><g:message code="Ver Contato" args="[entityName]" /></h1>
			
			<g:if test="${flash.message}">
				<div class="ui info message" role="status">${flash.message}</div>
			</g:if>
			
			<g:link action="list">
				<div class="tiny labeled ui button">
					<i class="icon list"></i>
					<g:message code="Contato Listagem" args="[entityName]" />
				</div>
			</g:link>
			<g:link action="create">
				<div class="tiny labeled ui button">
					<i class="icon user"></i>
					<g:message code="Novo Contato" args="[entityName]" />
				</div>
			</g:link>
			
			<table class="ui table">
				<g:if test="${pessoaInstance?.nome}">
					<tr>
						<td>
							<span id="nome-label" class="property-label"><g:message code="pessoa.nome.label" default="Nome" /></span>
						</td>
						<td>
							<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${pessoaInstance}" field="nome"/></span>
						</td>
					</tr>
				</g:if>
			
				<g:if test="${pessoaInstance?.grupos}">
					<tr>
						<td>
							<span id="grupos-label" class="property-label"><g:message code="pessoa.grupos.label" default="Grupo" /></span>
						</td>
						<td>
							<g:each in="${pessoaInstance.grupos}" var="g">
								<span class="property-value" aria-labelledby="grupos-label"><g:link controller="grupo" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></span>
							</g:each>						
						</td>
					</tr>
						
				</g:if>
				
				<g:if test="${pessoaInstance?.telefones}">
					<tr>
						<td>
							<span id="telefone-label" class="property-label">Telefone</span> 
						</td>
						<td>
							<span class="property-value" aria-labelledby="numero-label">
								<g:join in="${pessoaInstance?.telefones}" delimiter=", "/>
							</span>
						</td>
					</tr>
				</g:if>
			</table>			
			<g:form>
				<g:hiddenField name="id" value="${pessoaInstance?.id}" />
				<g:link action="edit" id="${pessoaInstance?.id}">
					<div class="tiny labeled ui button">
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
				<g:actionSubmit class="tiny labeled ui button" style="padding-left:28px;" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</g:form>
		</div>
	</body>
