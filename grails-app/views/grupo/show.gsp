
<%@ page import="com.acception.powermessage.Grupo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'grupo.label', default: 'Grupo')}" />
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
		<div id="show-grupo" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="ui info message" role="status">${flash.message}</div>
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
						<g:each in="${grupoInstance.pessoas}" var="p" status="j">
							<g:if test="${p.ativo}"><span class="property-value" aria-labelledby="pessoas-label">
							<g:link controller="pessoa" action="show" id="${p?.id}">${p?.encodeAsHTML()}</g:link></span></g:if><g:if test="${(j != grupoInstance.pessoas.size() - 1) && p.ativo}">,</g:if> <g:elseif  test="${(j == grupoInstance.pessoas.size() - 1) && p.ativo}">.</g:elseif> 
							
							</g:each>
						</td>
					</tr>
				</g:if>
			</table>
			<g:form>
				<g:hiddenField name="id" value="${grupoInstance?.id}" />
				<i class="icon save" style="position: absolute;
				z-index: 1;
				vertical-align: bottom;
				opacity: 0.6 !important;
				padding: 8px;
				margin-left:3px;"></i>
			<g:actionSubmit class="tiny labeled ui button" style="padding-left:28px;" action="edit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
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
											<g:message code="Remover Grupo" args="[entityName]" />
										</h4>
									</div>
									<div class="modal-body">
										<i><h3 align="center">
												Tem certeza que deseja remover o grupo
												${grupoInstance.nome}?
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