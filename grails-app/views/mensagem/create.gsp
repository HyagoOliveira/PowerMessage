
<%@ page import="com.acception.powermessage.Mensagem"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="layout" content="main">
	<g:set var="entityName" value="${message(code: 'mensagem.label', default: 'Mensagem')}" />
	<title><g:message code="default.create.label" args="[entityName]" /></title>
	<script type="text/javascript">

		function selectAll(idTabela) {
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
<div id="create-mensagem" role="main">
	<h1><g:message code="default.create.label" args="[entityName]" /></h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">${flash.message}</div>
	</g:if>
	<g:hasErrors bean="${mensagemInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${mensagemInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
			</g:eachError>
		</ul>
	</g:hasErrors>
	<g:form action="save">
		<g:render template="form"/>
		<button type="submit" name="create" class="ui right labeled icon button">
			Enviar <i class="icon send"></i>
		</button>
	</g:form>
</div>
</body>
</html>