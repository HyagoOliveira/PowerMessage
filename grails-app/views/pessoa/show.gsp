<%@ page import="com.acception.usuario.Pessoa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
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
							<g:each in="${pessoaInstance.grupos}" var="g" status="j">
								<span class="property-value" aria-labelledby="grupos-label">
								<g:link controller="grupo" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link><g:if test="${j != pessoaInstance.grupos.size() - 1}">,</g:if> <g:else>.</g:else> 
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
											<g:message code="Remover Contato" args="[entityName]" />
										</h4>
									</div>
									<div class="modal-body">
										<i><h3 align="center">
												Tem certeza que deseja remover o contato
												${pessoaInstance.nome}?
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
