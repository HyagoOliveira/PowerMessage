
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
	<a href="#list-mensagem" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><g:link class="create" action="create">
					<g:message code="Nova Mensagem" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-mensagem" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:if test="${mensagemInstanceList?.size() > 0}">
			<table>
				<thead>
					<tr>

						<g:sortableColumn property="texto"
							title="${message(code: 'mensagem.texto.label', default: 'Texto')}" />

						<g:sortableColumn property="dataEnvio"
							title="${message(code: 'mensagem.dataEnvio.label', default: 'Data Envio')}" />

						<g:sortableColumn property="msgStatus"
							title="${message(code: 'mensagem.msgStatus.label', default: 'Msg Status')}" />

						<th></th>
					</tr>
				</thead>
				<tbody>
					<g:each in="${mensagemInstanceList}" status="i"
						var="mensagemInstance">
						<g:if test="${mensagemInstance.flag.contains('true')}">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show" id="${mensagemInstance.id}">
										${fieldValue(bean: mensagemInstance, field: "texto")}
									</g:link></td>

								<td><g:formatDate format="dd MMMM, yyyy" date="${mensagemInstance.dataEnvio}" /></td>

								<td>
									${fieldValue(bean: mensagemInstance, field: "msgStatus")}
								</td>

								<td><a
									href="${createLink(uri: '/mensagem/create?texto=' + fieldValue(bean: mensagemInstance, field: "texto"))}">Encaminhar<img
										style="float: left;" alt=""
										src="${resource(dir: 'images', file: 'forward.png')}"></a></td>
							</tr>
						</g:if>
					</g:each>
				</tbody>
			</table>

			<div class="pagination">
				<g:paginate total="${mensagemInstanceTotal}" />
			</div>

		</g:if>
		<g:else>
			<div class="pagination">
				Não há messagens.
			</div>
		</g:else>
	</div>
</body>
</html>