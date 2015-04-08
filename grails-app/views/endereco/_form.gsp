<%@ page import="com.acception.usuario.Endereco" %>

<asset:javascript src="jquery.maskedinput.js" />
<asset:javascript src="cep_mask.js" />


<div class="two wide field">
	<label>CEP</label> <input type="text" id="cep" name="cep" class="cep"
		maxlength="9" value="${associacaoInstance.endereco?.cep}">
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
           
            $("#cidade option").filter(function() {     
                
                return $(this).text() == cidade.toUpperCase();
            }).prop('selected', true);
        });
    });
</script>


<div class="fields">
	<div class="six wide field">
		<label>Logradouro</label> <input id="logradouro" type="text"
			name="logradouro" maxlength="60"
			value="${associacaoInstance.endereco?.logradouro}">
	</div>
	<div class="four wide field">
		<label>Número</label> <input type="text" id="numero" name="numero"
			size="3" maxlength="10"
			value="${associacaoInstance.endereco?.numero}">
	</div>
</div>

<div class="ten wide field">
	<label>Complemento</label> <input type="text" id="complemento"
		name="complemento" maxlength="60"
		value="${associacaoInstance.endereco?.complemento}">
</div>

<div class="three fields">
	<div class="two wield field">
		<label>Bairro</label> <input name="bairro" id="bairro"
			value="${associacaoInstance.endereco?.bairro}">
	</div>
	<div class="required field">
		<label>Estado</label>
		<div class="ui icon input">
			<g:select class="ui dropdown"  id="estado" name="estado.id" from="${com.acception.usuario.Estado.list()}" optionKey="id" value="${associacaoInstance.endereco?.estado?.id}" class="many-to-one" noSelection="['null': 'Selecione']"/>
		</div>
	</div>
	<div class="required field">
		<label>Cidade</label>
		<div class="ui icon input">
			<g:select id="cidade" name="cidade.id" from="${com.acception.usuario.Cidade.list()}" optionKey="id" value="${associacaoInstance.endereco?.cidade?.id}" class="many-to-one" noSelection="['': 'Selecione']"/>
		</div>
	</div>
</div>

