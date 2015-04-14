<%@ page import="com.acception.powermessage.Grupo" %>
<%@ page import="com.acception.usuario.Pessoa" %>


<g:hasErrors bean="${grupoInstance}">
	<div class="ui negative message">		
		<div class="header">Há erros no seu cadastro:</div>
		<ul class="list" role="alert">
			<g:eachError bean="${grupoInstance}" var="error">
				<li
					<g:if test="${error in org.springframework.validation.FieldError}"> data-field-id="${error.field}"</g:if>><g:message
						error="${error}" /></li>
			</g:eachError>
		</ul>
	</div>
</g:hasErrors>

<div>
<div class="required field">
		<label> Nome do Grupo </label>
		<div class="ui input field">
			<g:textField name="nome" required=""
				value="${grupoInstance?.nome}" />
		</div>
	</div>
</div>

<br/>
<div class="required field">
		<label for="pessoas">
			Escolha os contatos para adicionar ao grupo
		</label>
	<g:if test="${pessoasList}">
		<table id="tabelaPessoas" class="ui table">
			<thead>
				<tr>
					<th><g:checkBox id="teste" name="checkBoxPessoas" checked="false"onchange="selectAll('tabelaPessoas')"/></th>
					<g:sortableColumn property="nome"
						title="${message(code: 'pessoa.nome.label', default: 'Nome')}" />
	
					<g:sortableColumn property="telefone1"
						title="${message(code: 'pessoa.telefone1.label', default: 'Descrição')}" />
				</tr>
			</thead>
			<tbody>
				<g:each in="${pessoasList}" status="i"
					var="pessoaInstance">
					
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td> 
							<g:if test="${grupoInstance?.pessoas?.contains(pessoaInstance)}">
						 		<g:checkBox name="pessoas" value="${pessoaInstance.id}" checked="true"  />
						 	</g:if>
						 	<g:else>
						 		<g:checkBox name="pessoas" value="${pessoaInstance.id}" checked="false"  />
						 	</g:else>
						 </td>
							<td>
								<a href="${createLink(uri: '/pessoa/show/' + fieldValue(bean: pessoaInstance, field: "id"))}">${fieldValue(bean: pessoaInstance, field: "nome")}</a>
							</td>
							<td>
								${fieldValue(bean: pessoaInstance, field: "telefones")}
							</td>
						</tr>
				</g:each>
			</tbody>
		</table>
	</g:if>
</div>