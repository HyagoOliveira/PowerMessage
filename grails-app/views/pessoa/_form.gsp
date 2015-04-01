<%@ page import="com.acception.usuario.Pessoa" %>




<div class="fieldcontain ${hasErrors(bean: pessoaInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="pessoa.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" size="29" value="${pessoaInstance?.nome}"/>
</div>

<g:render template="/telefone/form"></g:render>


