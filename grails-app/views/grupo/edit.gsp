<%@ page import="com.acception.powermessage.Grupo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'grupo.label', default: 'Grupo')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
		<div id="edit-grupo" class="content scaffold-edit" role="main">
			<h1>
			<g:message code="Ver Grupo" args="[entityName]" />
		</h1>
		
		<g:if test="${flash.message}">
			<div class="ui info message" role="status">
				${flash.message}
			</div>
		</g:if>

		<g:link action="list">
			<div class="tiny labeled ui button">
				<i class="icon list"></i>
				<g:message code="Grupo Listagem" args="[entityName]" />
			</div>
		</g:link>
		<g:link action="create">
			<div class="tiny labeled ui button">
				<i class="icon building"></i>
				<g:message code="Novo Grupo" args="[entityName]" />
			</div>
		</g:link>
		<br>
			<g:hasErrors bean="${grupoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${grupoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<br>
			<g:form method="post" >
				<g:hiddenField name="id" value="${grupoInstance?.id}" />
				<g:hiddenField name="version" value="${grupoInstance?.version}" />
<%--				<fieldset class="form">--%>
					<g:render template="form"/>
<%--				</fieldset>--%>
<%--				<fieldset class="buttons">--%>
<br>
<i class="icon save" style="position: absolute;
				z-index: 1;
				vertical-align: bottom;
				opacity: 0.6 !important;
				padding: 8px;
				margin-left:3px;"></i>
			<g:actionSubmit class="tiny labeled ui button" style="padding-left:28px;" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
			<i class="icon trash" style="position: absolute;
				z-index: 1;
				vertical-align: bottom;
				opacity: 0.6 !important;
				padding: 8px;
				margin-left:3px;"></i>
			<g:actionSubmit class="tiny labeled ui button" style="padding-left:28px;" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" formnovalidate="" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
<%--				</fieldset>--%>
			</g:form>
		</div>
	</body>
</html>