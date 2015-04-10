<%@ page import="com.acception.powermessage.Grupo"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'grupo.label', default: 'Grupo')}" />
<title>
<g:message code="default.create.label" args="[entityName]" />
		</title>
<script type="text/javascript">

		function selectAll(idTabela){
			$('#' + idTabela + ' input:checkbox').prop('checked', $('#' + idTabela + ' th input:checkbox').is(':checked'));
		}
		
		var currentValue = 0;
		
		function handleClick(myRadio) {
			var idTabela = $(myRadio).val();			
		    if(myRadio.value.indexOf("tabelaContatos") > -1) {
		    	$("#tabelaContatos").show();
		    	$("#tabelaGrupos").hide();
		    	$("#tabelaGrupos input:checkbox").prop("checked", false);
			} else {
				$("#tabelaContatos").hide();
		    	$("#tabelaGrupos").show();
		    	$("#tabelaContatos input:checkbox").prop("checked", false);
			}
		}
		
		</script>
</head>
<body>
	<div id="create-grupo" role="main">
	<h1>
			<g:message code="default.create.label" args="[entityName]" />
		</h1>
		
		<g:link action="list">
			<div class="tiny labeled ui button">
				<i class="icon list"></i>
				<g:message code="Associação Listagem" args="[entityName]" />
			</div>
		</g:link>
		<br><br>
		<g:form action="save"  class="ui form segment">
			<g:render template="form" />
			<br />
			<i class="icon save" style="position: absolute;
				z-index: 1;
				vertical-align: bottom;
				opacity: 0.6 !important;
				padding: 8px;
				margin-left:3px;"></i>
			<g:submitButton name="create" action="create" name="create" style="padding-left:28px;" class="tiny labeled ui button" value="${message(code: 'default.button.create.label', default: 'Create')}" />
			
		</g:form>
	</div>
</body>
</html>