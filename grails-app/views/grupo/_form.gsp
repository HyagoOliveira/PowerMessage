<%@ page import="com.acception.powermessage.Grupo" %>
<%@ page import="com.acception.usuario.Pessoa" %>


<div>
	<div class="ui labeled input">
		<div class="ui label">
    		<i class="icon users"></i>
  		</div>
		<g:textField name="nome" required placeholder="Insira o nome do grupo" size="50" value="${grupoInstance?.nome}"/>
	</div>
</div>

<br/>
<div>
	<h3>
		<label for="pessoas">
			Escolha os contatos para adicionar ao grupo
		</label>
	</h3>
	<g:if test="${com.acception.usuario.Pessoa.list()}">
		<table id="tabelaPessoas" class="ui table">
			<thead>
				<tr>
					<th><g:checkBox id="teste" name="checkBoxPessoas" required oninvalid="this.setCustomValidity('Selecione um contato')" checked="false"onchange="selectAll('tabelaPessoas')"/></th>
					<g:sortableColumn property="nome"
						title="${message(code: 'pessoa.nome.label', default: 'Nome')}" />
	
					<g:sortableColumn property="telefone1"
						title="${message(code: 'pessoa.telefone1.label', default: 'Descrição')}" />
				</tr>
			</thead>
			<tbody>
				<g:each in="${com.acception.usuario.Pessoa.list()}" status="i"
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