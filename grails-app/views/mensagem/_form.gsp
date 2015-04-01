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

<div
	class="fieldcontain ${hasErrors(bean: mensagemInstance, field: 'texto', 'error')} required">
	<label for="texto"> <g:message code="mensagem.texto.label"
			default="Texto" /> <span class="required-indicator">*</span>
	</label>
	<g:textArea name="texto" cols="40" rows="5" maxlength="512" required=""
		value="${mensagemInstance?.texto}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: mensagemInstance, field: 'grupos', 'error')} ">

	<g:if test="${Grupo.list()}">
		<label for="grupos"> <g:message code="mensagem.grupos.label"
				default="Grupos" />
		</label>
		<g:select name="grupos" from="${Grupo.list()}"
			multiple="multiple" optionKey="id" size="5"
			onchange="updatePessoasList(this.value)"
			value="${mensagemInstance?.grupos*.id}" class="many-to-many" />
	</g:if>

</div>

<div id="divpessoa"
	class="fieldcontain ${hasErrors(bean: mensagemInstance, field: 'pessoas', 'error')} ">
	<g:if test="${Pessoa.list()}">
		<label for="pessoas"> <g:message code="mensagem.pessoas.label"
				default="Pessoas" /> <span class="required-indicator">*</span>
		</label>
		<g:select name="pessoas" from="${Pessoa.list()}"
			multiple="multiple" optionKey="id" size="5" id="pessoasSelect"
			value="${mensagemInstance?.pessoas*.id}" class="many-to-many" />
	</g:if>

</div>

