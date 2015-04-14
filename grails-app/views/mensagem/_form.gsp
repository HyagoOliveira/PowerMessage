
<%@ page import="com.acception.powermessage.Mensagem"%>

<script type="text/javascript">
	function updatePessoasList(value) {
		var parameters = {
			"id" : value,
			selection : 1
		}
		<g:remoteFunction controller="mensagem" action="grupoChangeSelection" 
			update ="divpessoa" params="parameters" />
		
		pessoasSelect.selectedIndex = 0;
		pessoasSelect.selectedIndex = 1;
	}
</script>

<div class="ui form">
	<div class="field">
		<h3>
			<label for="texto"> <g:message code="mensagem.texto.label"
					default="Texto" /> <span class="required-indicator">*</span>
			</label>
		</h3>
		<g:textArea name="texto" value="${mensagemInstance?.texto}" />
	</div>
	
	<div class="field">
		<h3>
			<label for="texto">Destinatários <span class="required-indicator">*</span></label>
		</h3>
		<g:radio name="myGroup" value="tabelaContatos" checked="true" onclick="handleClick(this);" style="padding-left:20px; "/> 
		Todos os Contatos
		<g:radio name="myGroup" value="tabelaGrupos" onclick="handleClick(this);"/>
		Grupos
 	</div>
</div>

<g:if test="${com.acception.powermessage.Grupo.list()}">
	<table id="tabelaGrupos" hidden="true" class="ui table">
		<thead>
			<tr>
				<th><g:checkBox name="checkBoxGrupos" checked="false" onchange="selectAll('tabelaGrupos')"/></th>
				<g:sortableColumn property="nome"
					title="${message(code: 'pessoa.label', default: 'Contato')}" />

				<g:sortableColumn property="descricao"
					title="${message(code: 'telefones.numero.label', default: 'Numero(s)')}" />
			</tr>
		</thead>
		<tbody>
			<g:each in="${com.acception.powermessage.Grupo.list()}" status="i"
				var="grupoInstance">
				
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td>
					 	<g:checkBox name="grupos" value="${grupoInstance.id}" checked="false"/>
					 </td>
						<td>
							<a href="${createLink(uri: '/grupo/show/' + fieldValue(bean: grupoInstance, field: "id"))}">${fieldValue(bean: grupoInstance, field: "nome")}</a>
						</td>
						<td>
							<g:join in="${grupoInstance.pessoas}" delimiter=", "/>
						</td>
					</tr>
			</g:each>
		</tbody>
	</table>
</g:if>
<g:if test="${com.acception.usuario.Pessoa.list()}">
	<table id="tabelaContatos" class="ui table">
		<thead>
			<tr>
				<th><g:checkBox id="teste" class="ui checkbox" name="checkBoxPessoas" checked="false"onchange="selectAll('tabelaContatos')"/></th>
				<g:sortableColumn property="nome"
					title="${message(code: 'pessoa.label', default: 'Contato')}" />

				<g:sortableColumn property="descricao"
					title="${message(code: 'telefone.numero.label', default: 'Numero(s)')}" />
			</tr>
		</thead>
		<tbody>
			<g:each in="${com.acception.usuario.Pessoa.list()}" status="i"
				var="pessoaInstance">
				
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td>
					 	<g:checkBox name="contatos" class="ui checkbox" value="${pessoaInstance.id}" checked="false"  />
					 </td>
						<td>
							<a href="${createLink(uri: '/pessoa/show/' + fieldValue(bean: pessoaInstance, field: "id"))}">${fieldValue(bean: pessoaInstance, field: "nome")}</a>
						</td>
						<td>
							<g:join in="${pessoaInstance.telefones}" delimiter=", "/>
						</td>
					</tr>
			</g:each>
		</tbody>
	</table>
	</g:if>
