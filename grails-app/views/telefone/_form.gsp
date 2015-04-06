<%@ page import="com.acception.usuario.Telefone" %>

<asset:javascript src="jquery.maskedinput.js"/>
<asset:javascript src="telefone_edit.js"/>
<asset:stylesheet href="button.css"/>
	
<div id="telefonesTable" name="telefonesTable">
	<g:each var="telefone" in="${pessoaInstance?.telefones}" status="i">
		<div id="phonediv" class="fieldcontain ${hasErrors(bean: telefoneInstance, field: 'numero', 'error')} ">	
		   	<label for="telefone">Telefone</label>	
			<g:textField class="ddd"	value="${telefone?.ddd}"    name='ddd' size="2" required="" />
			<g:textField class="phone"  value="${telefone?.numero}"	name='numero' required=""/>
			<input type="button" class="button" value=" - " onclick="removePhone(this);"/>
		</div>	
	</g:each>
	
	<g:if test="${pessoaInstance.telefones == null || pessoaInstance?.telefones?.size()==0}">
		<div id="phonediv" class="fieldcontain ${hasErrors(bean: telefoneInstance, field: 'numero', 'error')} ">
			<label for="telefone">Telefone</label>	
			<g:textField class="ddd"	name='ddd' size="2" required="" />
			<g:textField class="phone"  name='numero' required=""/>
		</div>
	</g:if>
</div>

<div>
	<input type="button" class="button" value="+" onclick="addPhone()" />	
</div>

