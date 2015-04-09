<%@ page import="com.acception.usuario.Pessoa" %>

<br/>
<div class="${hasErrors(bean: pessoaInstance, field: 'nome', 'error')} required">
	<h4>
		<label for="nome">
			<i class="icon user"></i>
			<g:message code="pessoa.nome.label" default="Nome" />
			<span class="required-indicator">*</span>
		</label>
	</h4>
	<div class="ui input field">
		<g:textField name="nome" required="" size="29" value="${pessoaInstance?.nome}" placeholder="Insira o nome do contato"/>
	</div>
</div>

<g:render template="/telefone/form"></g:render>