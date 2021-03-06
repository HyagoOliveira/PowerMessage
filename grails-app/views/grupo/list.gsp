
<%@ page import="com.acception.powermessage.Grupo"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'grupo.label', default: 'Grupo')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-grupo" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		
		<g:if test="${flash.message}">
			<div class="ui info message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:link action="create">
			<div class="tiny ui button">
				<i class="icon users"></i>
				<g:message code="default.new.label" args="[entityName]" />
			</div>
		</g:link>
		
		
		<g:if test="${grupoInstanceList?.size()>0}">
			<table class="ui table">
				<thead>
					<tr>
						<g:sortableColumn property="nome"
							title="${message(code: 'grupo.nome.label', default: 'Nome do Grupo')}" />
						<g:sortableColumn property="pessoas" title="Contatos no Grupo" />
					</tr>
				</thead>
				<tbody>
					<g:each in="${grupoInstanceList}" status="i" var="grupoInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td><g:link action="show" id="${grupoInstance.id}">
									${fieldValue(bean: grupoInstance, field: "nome")}
								</g:link></td>
							<td>
								<g:each in="${grupoInstance.pessoas}" var="p" status="j">
							<g:if test="${p.ativo}"><span class="property-value" aria-labelledby="pessoas-label">
							<g:link controller="pessoa" action="show" id="${p?.id}">${p?.encodeAsHTML()}</g:link></span></g:if><g:if test="${(j != grupoInstance.pessoas.size() - 1) && p.ativo}">,</g:if> <g:elseif  test="${(j == grupoInstance.pessoas.size() - 1) && p.ativo}">.</g:elseif> 
							</g:each>
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${grupoInstanceTotal}" />
			</div>
		</g:if>
		<g:else>
			<div class="ui warning message" role="status">
				Não há grupos cadastrados.
			</div>
		</g:else>
	</div>
</body>
</html>