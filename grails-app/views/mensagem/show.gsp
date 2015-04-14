
<%@ page import="com.acception.powermessage.Mensagem" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
	</head>
	<body>
		<div id="show-mensagem" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="ui info message" role="status">${flash.message}</div>
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
							<span id="dataEnvio-label" class="property-label"><g:message code="mensagem.dataEnvio.label" default="Enviada em" /></span>
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
							<span id="msgStatus-label" class="property-label"><g:message code="mensagem.msgStatus.label" default="Status" /></span>
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
							<g:each in="${mensagemInstance.grupos}" var="g" status="j">
									<span class="property-value" aria-labelledby="grupos-label">
										<g:link controller="grupo" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link><g:if test="${j != mensagemInstance.grupos.size() - 1}">,</g:if> <g:else>.</g:else> 
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
							<g:each in="${mensagemInstance.pessoas}" var="p" status="j">
							<g:if test="${p.ativo == true}"><span class="property-value" aria-labelledby="pessoas-label"><g:link controller="pessoa" action="show" id="${p?.id}">${p?.encodeAsHTML()}</g:link></span></g:if><g:else><span class="property-value" aria-labelledby="pessoas-label">${p?.telefones}</span>
							</g:else><g:if test="${j != mensagemInstance.pessoas.size() - 1}">,</g:if> <g:else>.</g:else> 
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
											<g:message code="Remover Mensagem" args="[entityName]" />
										</h4>
									</div>
									<div class="modal-body">
										<i><h3 align="center">
												Tem certeza que deseja remover a mensagem?
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