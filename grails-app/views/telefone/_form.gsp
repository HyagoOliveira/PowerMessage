<%@ page import="com.acception.usuario.Telefone" %>

<asset:javascript src="jquery.maskedinput.js"/>
<asset:javascript src="telefone_edit.js"/>


<br/>
<div id="telefonesTable" name="telefonesTable">
	<h4>
	   	<label for="telefone"><i class="icon call"></i>Telefone(s)</label>
	   	<div class="tiny labeled ui button" style="padding: 4px 6px;" onclick="addPhone()">
		<i class="icon plus" style="display:block; margin:auto;"></i>
	</div>
	</h4>
	
	<g:each var="telefone" in="${pessoaInstance?.telefones}" status="i">
		<div id="phonediv" class="${hasErrors(bean: telefoneInstance, field: 'numero', 'error')} ">	
			<g:textField class="ddd ui input" style="max-width: 65px" value="${telefone?.ddd}" name="ddd" required="" placeholder="DDD"/>
			<g:textField class="phone" style="max-width: 150px" value="${telefone?.numero}" name='numero' required="" placeholder="Telefone"/>
			<button type="button" class="tiny red labeled ui button disabled" style="margin: 2px" onclick="removePhone(this);">
				<i class="icon trash" style="display:block; margin:auto;"></i>
			</button>
		</div>
	</g:each>
	
	<g:if test="${pessoaInstance.telefones == null || pessoaInstance?.telefones?.size()==0}">
		<div id="phonediv" class="two fields">
			<div class="two wide field ui input">
				<g:textField class="ddd" name='ddd' size="3" required="" placeholder="DDD"/>
			</div>
			<div class="four wide field ui input">
				<g:textField class="phone" name='numero' required="" placeholder="Telefone"/>
			</div>
			<button type="button" class="tiny red labeled ui button disabled" style="margin: 2px" onclick="removePhone(this);">
				<i class="icon trash" style="display:block; margin:auto;"></i>
			</button>
		</div>
	</g:if>
</div>

<div style="margin: 8px 0">
	
</div>