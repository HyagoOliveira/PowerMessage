
<%@ page import="com.acception.powermessage.Mensagem"%>
<%@ page import="com.acception.powermessage.Grupo"%>
<%@ page import="com.acception.usuario.Pessoa"%>

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

<g:if test="${listGrupos}">
	<table id="tabelaGrupos" hidden="true" class="ui table">
		<thead>
			<tr>
				<th><g:checkBox name="checkBoxGrupos" checked="false" onchange="selectAll('tabelaGrupos')"/></th>
				<g:sortableColumn property="nome"
					title="${message(code: 'pessoa.nome.label', default: 'Nome')}" />

				<g:sortableColumn property="descricao"
					title="${message(code: 'pessoa.telefone2.label', default: 'Descrição')}" />
			</tr>
		</thead>
		<tbody>
			<g:each in="${listGrupos}" status="i"
				var="grupoInstance">
				
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td>
					 	<g:checkBox name="grupos" value="${grupoInstance.id}" checked="false"/>
					 </td>
						<td>
							<a href="${createLink(uri: '/grupo/show/' + fieldValue(bean: grupoInstance, field: "id"))}">${fieldValue(bean: grupoInstance, field: "nome")}</a>
						</td>
						<td>
							${fieldValue(bean: grupoInstance, field: "pessoas")}						
						</td>
					</tr>
			</g:each>
		</tbody>
	</table>
</g:if>
<g:if test="${listPessoas}">
	<table id="tabelaContatos" class="ui table">
		<thead>
			<tr>
				<th><g:checkBox id="teste" class="ui checkbox" name="checkBoxPessoas" checked="false"onchange="selectAll('tabelaContatos')"/></th>
				<g:sortableColumn property="nome"
					title="${message(code: 'pessoa.nome.label', default: 'Nome')}" />

				<g:sortableColumn property="descricao"
					title="${message(code: 'pessoa.descricao.label', default: 'Descrição')}" />
			</tr>
		</thead>
		<tbody>
			<g:each in="${listPessoas}" status="i"
				var="pessoaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td>
					 	<g:checkBox name="contatos" class="ui checkbox" value="${pessoaInstance.id}" checked="false"  />
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
