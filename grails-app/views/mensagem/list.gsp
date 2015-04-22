
<%@ page import="com.acception.powermessage.Mensagem"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName"
		   value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
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
<div id="list-mensagem" class="content scaffold-list" role="main">
	<h1>
		<g:message code="default.list.label" args="[entityName]" />
	</h1>
	<g:if test="${flash.message}">
		<div class="ui info message" role="status">
			${flash.message}
		</div>
	</g:if>
	<g:if test="${mensagemInstanceList?.size() > 0}">
		<table class="ui table">
			<thead>
			<tr>

				<g:sortableColumn property="texto"
								  title="${message(code: 'mensagem.texto.label', default: 'Texto')}" />

				<g:sortableColumn property="dataEnvio"
								  title="${message(code: 'mensagem.dataEnvio.label', default: 'Data Envio')}" />

				<g:sortableColumn property="msgStatus"
								  title="${message(code: 'mensagem.msgStatus.label', default: 'Status')}" />

				<th></th>
				<th></th>
			</tr>
			</thead>
			<tbody>
			<g:each in="${mensagemInstanceList}" status="i"
					var="mensagemInstance">
				<g:form method="post" mapping="" id="${mensagemInstance?.id}">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

					<td><g:link action="show" id="${mensagemInstance.id}">
						${fieldValue(bean: mensagemInstance, field: "texto")}
					</g:link></td>

					<td><g:formatDate format="dd MMMM, yyyy" date="${mensagemInstance.dataEnvio}" /></td>

					<td>
						${fieldValue(bean: mensagemInstance, field: "msgStatus")}
					</td>

					<td><a title="Encaminhar" href="${createLink(uri: '/mensagem/create?texto=' + fieldValue(bean: mensagemInstance, field: "texto"))}">
						<i class="icon reply"></i>
					</a>
					</td>

					<td>
						<a id="modal-494344" href="#modal-container-494344" role="button"

						   data-toggle="modal">
						<i class="icon trash"></i>


						</a>

					</td>
				</tr>

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
				</g:form>
			</g:each>
			</tbody>
		</table>

		<div class="pagination">
			<g:paginate total="${mensagemInstanceTotal}" />
		</div>

	</g:if>
	<g:else>
	<div class="ui warning message" role="status">
				Não há mensagens enviadas.
			</div>
	</g:else>
</div>
</body>
</html>