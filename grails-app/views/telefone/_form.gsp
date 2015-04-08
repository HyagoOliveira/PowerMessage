<%@ page import="com.acception.usuario.Telefone" %>

<asset:javascript src="jquery.maskedinput.js"/>
<asset:javascript src="telefone_edit.js"/>


<br/>
<div id="telefonesTable" name="telefonesTable">
	<h4>
	   	<label for="telefone"><i class="icon call"></i>Telefone(s)</label>
	</h4>
	<g:each var="telefone" in="${pessoaInstance?.telefones}" status="i">
		<div id="phonediv" style="margin: 2px" class="${hasErrors(bean: telefoneInstance, field: 'numero', 'error')} ">	
			<g:textField class="ddd ui input" style="max-width: 50px" size="2" value="${telefone?.ddd}" name='ddd' size="2" required="" />
			<g:textField class="phone" style="max-width: 150px" value="${telefone?.numero}" name='numero' required=""/>
			<button class="tiny red labeled ui button" style="margin: 2px" onclick="removePhone(this);">
				<i class="icon trash"></i>
			</button>
		</div>
	</g:each>
	
	<g:if test="${pessoaInstance.telefones == null || pessoaInstance?.telefones?.size()==0}">
		<div id="phonediv" class="fieldcontain ${hasErrors(bean: telefoneInstance, field: 'numero', 'error')} ">
			<label for="telefone">Telefone</label>	
			<div class="ui input">
			<g:textField class="ddd"	name='ddd' size="2" required="" />
			</div>
			<div class="ui input">
			<g:textField class="phone"  name='numero' required=""/>
			</div>
		</div>
	</g:if>
</div>

<div style="margin: 8px 0">
	<div class="tiny labeled ui button" onclick="addPhone()">
		<i class="icon plus"></i>
	</div>
</div>