
<%@ page import="com.acception.powermessage.Mensagem"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName"
		   value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
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
			</tr>
			</thead>
			<tbody>
			<g:each in="${mensagemInstanceList}" status="i"
					var="mensagemInstance">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

					<td><g:link action="show" id="${mensagemInstance.id}">
						${fieldValue(bean: mensagemInstance, field: "texto")}
					</g:link></td>

					<td><g:formatDate format="dd MMMM, yyyy" date="${mensagemInstance.dataEnvio}" /></td>

					<td>
						${fieldValue(bean: mensagemInstance, field: "msgStatus")}
					</td>

					<td><a href="${createLink(uri: '/mensagem/create?texto=' + fieldValue(bean: mensagemInstance, field: "texto"))}">
						<i class="icon reply"></i>Encaminhar
					</a>
					</td>
				</tr>

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