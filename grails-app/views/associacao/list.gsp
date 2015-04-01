
<%@ page import="com.acception.powermessage.Associacao"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'associacao.label', default: 'Associacao')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#list-associacao" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><g:link class="create" action="create">
					<g:message code="Nova Associação" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-associacao" class="content scaffold-list" role="main">
		<h1>
			<g:message code="Associação Listagem" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:if test="${associacaoInstanceTotal > 0}">
			<table>
				<thead>
					<tr>
						<g:sortableColumn property="nome"
							title="${message(code: 'associacao.nome.label', default: 'Nome')}" />

						<g:sortableColumn property="email"
							title="${message(code: 'associacao.email.label', default: 'Email')}" />

						<g:sortableColumn property="username"
							title="${message(code: 'associacao.username.label', default: 'Username')}" />

					</tr>
				</thead>
				<tbody>
					<g:each in="${associacaoInstanceList}" status="i"
						var="associacaoInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td><g:link action="show" id="${associacaoInstance.id}">
									${fieldValue(bean: associacaoInstance, field: "nome")}
								</g:link></td>

							<td>
								${fieldValue(bean: associacaoInstance, field: "email")}
							</td>

							<td>
								${fieldValue(bean: associacaoInstance, field: "username")}
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${associacaoInstanceTotal}" />
			</div>
		</g:if>
		<g:else>
			<div class="pagination">
				<h1>Não há associações cadastradas.</h1>
			</div>
		</g:else>
	</div>
</body>
</html>