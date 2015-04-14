<%@ page import="com.acception.usuario.Pessoa"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'pessoa.label', default: 'Pessoa')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-pessoa" class="content scaffold-list" role="main">
		<h1>
			<g:message code="Contato Listagem" args="[entityName]" />
		</h1>
		
		<g:link action="create">
			<div class="tiny ui button">
				<i class="icon add user"></i>
				<g:message code="Novo Contato" args="[entityName]" />
			</div>
		</g:link>
		
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		
		<br/><br/>
		<div class="ui buttons">
			<g:link action="list" params="[letra: null]">
				<div class="ui button" style="font-size: 0.64em">
					<i class="ui icon refresh"></i>
				</div>
			</g:link>
			<g:each in="${alfabeto}" var="letra">
				<g:link action="list" params="[letra: letra]">
					<div class="ui button" style="font-size: 0.64em">${letra}</div>
				</g:link>
			</g:each>
		</div>
		<g:if test="${pessoaInstanceTotal > 0}">

			<table class="ui table">
				<thead>
					<tr>
						<g:sortableColumn property="nome"
							title="${message(code: 'pessoa.nome.label', default: 'Nome')}" />
						<g:sortableColumn property="telefones" title="Telefone(s)" />
					</tr>
				</thead>
				
				<tbody>
					<g:each in="${pessoaInstanceList}" status="i" var="pessoaInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td><g:link action="show" id="${pessoaInstance.id}">
									${fieldValue(bean: pessoaInstance, field: "nome")}
								</g:link></td>

							<td>
								${fieldValue(bean: pessoaInstance, field: "telefones")}
							</td>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${pessoaInstanceTotal}" />
			</div>
		</g:if>
		<g:else>
			<div class="pagination">
				Não há Contatos cadastrados.
			</div>
		</g:else>
	</div>
</body>
</html>
