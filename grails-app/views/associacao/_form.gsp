<%@ page import="com.acception.powermessage.Associacao" %>
<div class="ui attached message" hidden="true">
  <div class="header">
    Welcome to our site!
  </div>
  <p>Fill out the form below to sign-up for a new account</p>
</div>
<h4 class="ui dividing header">Informações Básicas</h4>
<div class="two fields">
    <div class="required field ">     
      <label> Nome</label>
      <input placeholder="Nome" type="text"  name="nome" value="${associacaoInstance?.nome}">
    </div>
    <div class="required field">
      <label>E-mail</label>
      <input name="email" placeholder="E-mail" type="text" value="${associacaoInstance?.email}">
    </div>
</div>
<g:render template="/endereco/form"></g:render>
<h4 class="ui dividing header">Informações de Login</h4>
<div class="two fields">
    <div class="required field">
      <label>Nome de Usuário</label>
      <div class="ui icon input">
        <input type="text" placeholder="Username" value="${associacaoInstance?.username}" name="username">
        <i class="user icon"></i>
      </div>
    </div>
    <div class="required field">
      <label>Senha</label>
      <div class="ui icon input">
        <input name="password"  type="password" value="">
        <i class="lock icon"></i>
      </div>
    </div>
  </div>
