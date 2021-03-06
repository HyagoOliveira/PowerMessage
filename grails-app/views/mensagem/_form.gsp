
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
		<g:textArea name="texto" required="" oninvalid="this.setCustomValidity('Digite uma mensagem')" onchange="this.setCustomValidity('')" value="${mensagemInstance?.texto}" />
	</div>

	<div class="field">
		<h3>
			<label for="texto">Destinatários <span
				class="required-indicator">*</span></label>
		</h3>
		<g:radio name="myGroup" value="tabelaContatos" checked="true"
			onclick="handleClick(this);" style="padding-left:20px; " />
		Todos os Contatos
		<g:radio name="myGroup" value="tabelaGrupos"
			onclick="handleClick(this);" />
		Grupos
	</div>
</div>

<g:if test="${listGrupos}">
	<table id="tabelaGrupos" hidden="true" class="ui table">
		<thead>
			<tr>
				<th><g:checkBox name="checkBoxGrupos" checked="false"
						onchange="selectAll('tabelaGrupos')" /></th>
				<g:sortableColumn property="nome"
					title="${message(code: 'pessoa.label', default: 'Contato')}" />

				<g:sortableColumn property="descricao"
					title="${message(code: 'telefones.numero.label', default: 'Telefone(s)')}" />
					
			</tr>
		</thead>
		<tbody>
			<g:each in="${listGrupos}" status="i" var="grupoInstance">

				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					<td><g:checkBox name="grupos" value="${grupoInstance.id}"
							checked="false" /></td>
					<td><a
						href="${createLink(uri: '/grupo/show/' + fieldValue(bean: grupoInstance, field: "id"))}">
							${fieldValue(bean: grupoInstance, field: "nome")}
					</a></td>
					<td>
						<g:each in="${grupoInstance.pessoas}" var="pessoaInstance" status="j">
						<g:link controller="pessoa" action="show" id="${pessoaInstance?.id}">${pessoaInstance?.encodeAsHTML()}</g:link><g:if test="${j != grupoInstance.pessoas.size() - 1}">,</g:if> <g:else>.</g:else> 
						</g:each>

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
				<th><g:checkBox id="teste" class="ui checkbox"
						name="checkBoxPessoas" checked="false"
						onchange="selectAll('tabelaContatos')" /></th>
				<g:sortableColumn property="nome"
					title="${message(code: 'pessoa.label', default: 'Contato')}" />

				<g:sortableColumn property="descricao"
					title="${message(code: 'telefone.numero.label', default: 'Numero(s)')}" />
					
				<g:sortableColumn property="descricao"
					title="${message(code: 'telefone.operadora.label', default: 'Operadora(s)')}" />
			</tr>
		</thead>
		<tbody>
			<g:each in="${listPessoas}" status="i" var="pessoaInstance">
				<g:if test="${pessoaInstance.ativo}">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
							<g:checkBox name="contatos"  class="ui checkbox"
								value="${pessoaInstance.id}" checked="false" />
						</td>
						<td>
							<a
							href="${createLink(uri: '/pessoa/show/' + fieldValue(bean: pessoaInstance, field: "id"))}">
								${fieldValue(bean: pessoaInstance, field: "nome")}
							</a>
						</td>
						<td>
							<g:join in="${pessoaInstance.telefones}" delimiter=", "/>
						</td>
						<td>
							<g:each in="${pessoaInstance.telefones}" status="j" var="telefoneInstance">
								<g:if test="${telefoneInstance.operadora}">${telefoneInstance.operadora}<g:if test="${j != pessoaInstance.telefones.size() - 1}">,</g:if> <g:else>.</g:else></g:if> 
							</g:each>
						</td>
					</tr>
				</g:if>
			</g:each>
		</tbody>
	</table>
</g:if>
