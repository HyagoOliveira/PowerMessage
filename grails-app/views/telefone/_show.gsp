
<%@ page import="com.acception.usuario.Telefone"%>

<div id="show-telefone" class="content scaffold-show" role="main">

	<ol class="property-list telefone">

		<g:if test="${telefoneInstance?.numero}">
			<li class="fieldcontain">
				<span id="numero-label"	class="property-label">
					Telefone
				</span> 
				<span class="property-value" aria-labelledby="numero-label">
					<g:fieldValue bean="${telefoneInstance}" field="ddd" />
					<g:fieldValue bean="${telefoneInstance}" field="numero" />
				</span>
			</li>
		</g:if>

	</ol>
</div>

