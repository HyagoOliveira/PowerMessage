<%@ page import="com.acception.powermessage.Associacao"%>

<script type="text/javascript">
function validaSenha (input){ 
    if (input.value != document.getElementById('password').value) {
    input.setCustomValidity('As senhas inseridas devem ser as mesmas.');
  } else {
    input.setCustomValidity('');
  }
} 
</script>

<g:hasErrors bean="${associacaoInstance}">
	<div class="ui negative message">
		
		<div class="header"><i class="warning sign icon"></i>Houveram alguns erros com o seu cadastro</div>
		<ul class="list" role="alert">
			<g:eachError bean="${associacaoInstance}" var="error">
				<li
					<g:if test="${error in org.springframework.validation.FieldError}"> data-field-id="${error.field}"</g:if>><g:message
						error="${error}" /></li>
			</g:eachError>
		</ul>
	</div>
</g:hasErrors>




<h4 class="ui dividing header">Informações Básicas</h4>
<div class="two fields">
	<div class="required field">
		<label> Nome</label>
		<div class="ui input field">
			<g:textField name="nome" required=""
				value="${associacaoInstance?.nome}" />
		</div>
	</div>
	<div class="required field">
		<label>E-mail</label>
		<div class="ui input field">
			<g:textField name="email" required=""
				value="${associacaoInstance?.email}" />
		</div>
	</div>
</div>
<g:render template="/endereco/form"></g:render>
<h4 class="ui dividing header">Informações de Login</h4>

<div class="ten wide required field">
	<label>Nome de Usuário</label>
	<div class="ui icon input">
		<g:textField name="username" required=""
			value="${associacaoInstance?.username}" />
		<i class="user icon"></i>
	</div>
</div>

<br>
<div class="two fields">
	<div class="five wide required field">
		<label>Senha</label>
		<div class="ui icon input">
			<g:passwordField id="password" name="password" required="" value="" />
			<i class="lock icon"></i>
		</div>
	</div>
	<div class="five  wide required field">
		<label>Repetir Senha</label>
		<div class="ui icon input">
			<g:passwordField id= "rptpassword" name="rptpassword" required="" value=""  oninput="validaSenha(this)"/>
			<i class="lock icon"></i>
		</div>
	</div>
</div>

