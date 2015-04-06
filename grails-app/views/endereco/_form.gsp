<%@ page import="com.acception.usuario.Endereco" %>

<asset:javascript src="jquery.maskedinput.js"/>
<asset:javascript src="cep_mask.js"/>


<div class="fieldcontain ${hasErrors(bean: associacaoInstance.endereco, field: 'cep', 'error')} ">
	<label for="cep">
		<g:message code="endereco.cep.label" default="Cep" />		
	</label>
	<g:textField name="cep" class="cep" maxlength="9" value="${associacaoInstance.endereco?.cep}"/>
</div>
<script type="text/javascript">

	String.prototype.removeAccents = function(){
	 return this
	         .replace(/[áàãâä]/gi,"a")
	         .replace(/[éè¨ê]/gi,"e")
	         .replace(/[íìïî]/gi,"i")
	         .replace(/[óòöôõ]/gi,"o")
	         .replace(/[úùüû]/gi, "u")
	         .replace(/[ç]/gi, "c")
	         .replace(/[ñ]/gi, "n")
	         .replace(/[^a-zA-Z0-9]/g," ");
	}
	function stripos (f_haystack, f_needle, f_offset) {
	  var haystack = (f_haystack + '').toLowerCase().removeAccents();
	  var needle = (f_needle + '').toLowerCase().removeAccents();
	  var index = 0;

	  if ((index = haystack.indexOf(needle, f_offset)) !== -1) {
	    return index;
	  }
	  return false;
	}

	$('#cep').blur(function() {
		console.log($('#cep').val());
		$.getJSON("//viacep.com.br/ws/" + $('#cep').val() + "/json/?callback?", function(data) {
			
			$('#logradouro').val(data.logradouro);
			$('#complemento').val(data.complemento);
			$('#bairro').val(data.bairro);
		
			var uf = data.uf;
			$("#estado option").filter(function() {
				$.trim(uf);
			    return $(this).text() == uf; 
			}).prop('selected', true);
			
			var cidade = data.localidade.removeAccents() +" - " +$( "#estado option:selected" ).text();
			alert(data.localidade);		
			$("#cidade option").filter(function() {		
				
			    return $(this).text() == cidade.toUpperCase();
			}).prop('selected', true);
		});
	});
</script>


<div class="fieldcontain ${hasErrors(bean: associacaoInstance.endereco, field: 'logradouro', 'error')} ">
	<label for="logradouro">
		<g:message code="endereco.logradouro.label" default="Logradouro" />		
	</label>
	<g:textField name="logradouro" maxlength="60" value="${associacaoInstance.endereco?.logradouro}"/>
	Nº
	<g:textField name="numero" size="3" maxlength="10" value="${associacaoInstance.endereco?.numero}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: associacaoInstance.endereco, field: 'complemento', 'error')} ">
	<label for="complemento">
		<g:message code="endereco.complemento.label" default="Complemento" />		
	</label>
	<g:textField name="complemento" maxlength="60" value="${associacaoInstance.endereco?.complemento}"/>
	Bairro
	<g:textField name="bairro" maxlength="40" value="${associacaoInstance.endereco?.bairro}"/>	
</div>

<div class="fieldcontain ${hasErrors(bean: associacaoInstance.endereco, field: 'estado', 'error')} ">
	<label for="estado">
		<g:message code="endereco.estado.label" default="Estado" />		
	</label>
	<g:select id="estado" name="estado.id" from="${com.acception.usuario.Estado.list()}" optionKey="id" value="${associacaoInstance.endereco?.estado?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: associacaoInstance.endereco, field: 'cidade', 'error')} ">
	<label for="cidade">
		<g:message code="endereco.cidade.label" default="Cidade" />		
	</label>
	<g:select id="cidade" name="cidade.id" from="${com.acception.usuario.Cidade.list()}" optionKey="id" value="${associacaoInstance.endereco?.cidade?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

