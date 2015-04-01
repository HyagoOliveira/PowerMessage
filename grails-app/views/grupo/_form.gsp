<%@ page import="com.acception.powermessage.Grupo" %>
<%@ page import="com.acception.usuario.Pessoa" %>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'nome', 'error')} ">
	<label for="nome">
		<g:message code="grupo.nome.label" default="Nome" />
		
	</label>
	<g:textField name="nome" value="${grupoInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: grupoInstance, field: 'pessoas', 'error')} ">
	<label for="pessoas">
		<g:message code="grupo.pessoas.label" default="Pessoas" />
		
	</label>
	<g:select name="pessoas" from="${Pessoa.list()}" multiple="multiple" optionKey="id" size="5" value="${grupoInstance?.pessoas*.id}" class="many-to-many"/>
</div>
