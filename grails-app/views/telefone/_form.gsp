<%@ page import="com.acception.usuario.Telefone"%>

<asset:javascript src="jquery.maskedinput.js" />
<asset:javascript src="telefone_edit.js" />
<script type="text/javascript">
	$(document).ready(function() {
		$('.ui.search.dropdown').dropdown();
	});

	$(document).on("click", ".tiny.labeled.ui.button", function() {
		$('.ui.search.dropdown').dropdown();
	});
</script>

<br />
<div id="telefonesTable" name="telefonesTable">
	<h4>
		<label for="telefone"><i class="icon call"></i>Telefone(s)</label>
		<div class="tiny labeled ui button" style="padding: 4px 6px;"
			onclick="addPhone()">
			<i class="icon plus" style="display: block; margin: auto;"></i>
		</div>
	</h4>

	<g:each var="telefone" in="${pessoaInstance?.telefones}" status="i">
		<div id="phonediv" class="two fields">
			<div class="two wide field ui input">
				<g:textField class="ddd" value="${telefone?.ddd}" name="ddd"
					required="" placeholder="DDD" />
			</div>
			<div class="four wide field ui input">
				<g:textField class="phone" value="${telefone?.numero}" name='numero'
					required="" placeholder="Telefone" />
			</div>
			<div class="four wide field ">
				<g:select name="operadora" from="${operadorasList}"
					class="ui search dropdown">
				</g:select>
			</div>
			<button type="button" class="tiny red labeled ui button disabled"
				style="margin: 2px" onclick="removePhone(this);">
				<i class="icon trash" style="display: block; margin: auto;"></i>
			</button>
		</div>
	</g:each>

	<g:if
		test="${pessoaInstance.telefones == null || pessoaInstance?.telefones?.size()==0}">
		<div id="phonediv" class="two fields">
			<div class="two wide field ui input">
				<g:textField class="ddd" name='ddd' size="3" required=""
					placeholder="DDD" />
			</div>
			<div class="four wide field ui input">
				<g:textField class="phone" name='numero' required=""
					placeholder="Telefone" />
			</div>
			<div class="four wide field ">
				<g:select name="operadora" from="${operadorasList}"
					class="ui search dropdown">

				</g:select>
			</div>
			<button type="button" class="tiny red labeled ui button disabled"
				style="margin: 2px" onclick="removePhone(this);">
				<i class="icon trash" style="display: block; margin: auto;"></i>
			</button>
		</div>
	</g:if>
</div>

<div style="margin: 8px 0"></div>