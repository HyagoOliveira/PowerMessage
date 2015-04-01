<%@ page import="com.acception.powermessage.Associacao" %>



<div class="fieldcontain ${hasErrors(bean: associacaoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="associacao.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" required="" value="${associacaoInstance?.nome}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: associacaoInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="associacao.email.label" default="Email" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="email" required="" value="${associacaoInstance?.email}"/>
</div>

<g:render template="/endereco/form"></g:render>

<div class="fieldcontain ${hasErrors(bean: associacaoInstance, field: 'username', 'error')} required">
	<label for="username">
		Login
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${associacaoInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: associacaoInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="associacao.password.label" default="Senha" />
		<span class="required-indicator">*</span>
	</label>
	<g:passwordField name="password" type="password" value=""/>
</div>