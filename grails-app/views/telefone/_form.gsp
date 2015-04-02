<%@ page import="com.acception.usuario.Telefone" %>

<asset:javascript src="jquery.maskedinput.js"/>
<asset:javascript src="telefone_edit.js"/>
<asset:stylesheet href="button.css"/>
	
<div id="telefonesTable">

		<g:each var="telefone" in="${pessoaInstance.telefones}" status="i">

					<div id="phone${i}" class="fieldcontain ${hasErrors(bean: telefoneInstance, field: 'numero', 'error')} ">	
					   	<label for="telefone">Telefone</label>	
						<g:textField class="ddd"	value="${telefone?.ddd}"    name='ddd' size="2"/>
						<g:textField class="phone"  value="${telefone?.numero}"	name='numero'/>
						<input type="button" class="button" value="-" onclick="removePhone(this);"/>
					</div>	
		</g:each>
</div>
	<input type="button" class="button" value="+" onclick="addPhone()" />

	


