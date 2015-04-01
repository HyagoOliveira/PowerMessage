<%@ page import="com.acception.usuario.Telefone" %>

<asset:javascript src="telefone_mask.js"/>

<div class="fieldcontain ${hasErrors(bean: telefoneInstance, field: 'numero', 'error')} ">	
	
	<g:each var="telefone" in="${pessoaInstance.telefones}">
    	<label for="numero">Telefone</label>	
		<g:textField name="ddd" 	class="ddd" 	size="2" value="${telefone?.ddd}"/>
		<g:textField name="numero" 	class="phone"  	value="${telefone?.numero}"/>
	</g:each>
	
</div>

