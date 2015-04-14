<%@ page import="com.acception.powermessage.Associacao"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'associacao.label', default: 'Associação')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

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
			<i class="icon trash"
				style="position: absolute; z-index: 1; vertical-align: bottom; opacity: 0.6 !important; padding: 8px; margin-left: 3px;"></i>


			<a id="modal-494344" href="#modal-container-494344" role="button"
				style="padding-left: 28px;" class="tiny ui button"
				data-toggle="modal">Remover</a>

			<div class="container">
				<div class="row clearfix">
					<div class="col-md-12 column">

						<div class="modal fade" id="modal-container-494344" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="ui modal-dialog modal-sm">
								<div class="modal-content">
									<div class="modal-header" style="background-color: #E0E0E0;">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h4 class="modal-title" id="myModalLabel" args="">
											<g:message code="Remover Associação" args="[entityName]" />
										</h4>
									</div>
									<div class="modal-body">
										<i><h3 align="center">
												Tem certeza que deseja remover a associação
												${associacaoInstance.nome}?
											</h3></i>
									</div>
									<div class="modal-footer">
										<div style="display: block; margin: auto; float: center;">
											<button type="button" class="btn btn-danger"
												data-dismiss="modal">Não</button>
											<g:actionSubmit class="btn btn-success" action="delete"
												code="default.button.delete.label" value="Sim" />
										</div>
									</div>
								</div>

							</div>

						</div>

					</div>
				</div>
			</div>
		</g:form>
	</div>


</body>
</html>