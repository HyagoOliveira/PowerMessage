
<%@ page import="com.acception.powermessage.Associacao"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'associacao.label', default: 'Associação')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</head>
<body>
	<div id="show-associacao" class="content scaffold-show" role="main">
		<h1>
			<g:message code="Ver Associação" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="ui info message" role="status">
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
		<table class="ui table">
			<g:if test="${associacaoInstance?.nome}">
				<tr>
					<td><span id="nome-label" class="property-label"><g:message
								code="associacao.nome.label" default="Nome" /></span>:</td>
					<td><span class="property-value" aria-labelledby="nome-label"><g:fieldValue
								bean="${associacaoInstance}" field="nome" /></span></td>
				</tr>
			</g:if>
			<g:if test="${associacaoInstance?.email}">
				<tr>
					<td><span id="email-label" class="property-label"><g:message
								code="associacao.email.label" default="E-mail" /></span>:</td>
					<td><span class="property-value" aria-labelledby="email-label"><g:fieldValue
								bean="${associacaoInstance}" field="email" /></span></td>
				</tr>
			</g:if>
			<g:if test="${associacaoInstance?.email}">
				<tr>
					<td><span id="username-label" class="property-label"><g:message
								code="associacao.username.label" default="Nome de Usuário" /></span>:</td>
					<td><span class="property-value"
						aria-labelledby="username-label"><g:fieldValue
								bean="${associacaoInstance}" field="username" /></span></td>
				</tr>
			</g:if>
			<g:if test="${associacaoInstance?.endereco}">
				<tr>
					<td><span id="endereco-label" class="property-label"><g:message
								code="associacao.endereco.label" default="Endereço" /></span>:</td>
					<td><g:render template="/endereco/show"
							bean="${associacaoInstance?.endereco}" var="enderecoInstance"></g:render></td>
				</tr>
			</g:if>

		</table>

		<g:form class="ui form">
			<g:hiddenField name="id" value="${associacaoInstance?.id}" />
			<g:link action="edit" id="${associacaoInstance?.id}">
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
				<g:actionSubmit class="tiny ui button" style="padding-left:28px;" action="delete" code="default.button.delete.label" value="Remover" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
		</g:form>
	</div>
</body>
</html>