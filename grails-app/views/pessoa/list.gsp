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
			<div class="ui info message" role="status">
				${flash.message}
			</div>
		</g:if>
		
		<div class="ui buttons" style="padding-top:8px;">
			<g:link action="list" params="[letra: null]">
				<div class="ui button" style="font-size: 0.64em; " data-content="Listar todos os contatos" data-variation="basic">
					<i class="ui icon list layout" ></i>
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
								%{--${fieldValue(bean: pessoaInstance, field: "telefones")}--}%
								<g:join in="${pessoaInstance?.telefones}" delimiter=", "/>
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
			<div class="ui warning message" role="status">
				Não há contatos cadastrados.
			</div>
		</g:else>
	</div>
</body>
</html>
