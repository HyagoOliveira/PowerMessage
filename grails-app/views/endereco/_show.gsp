<%@ page import="com.acception.usuario.Endereco"%>
<g:if test="${enderecoInstance?.logradouro}">
	<span class="property-value" aria-labelledby="logradouro-label">
		<g:fieldValue bean="${enderecoInstance}" field="logradouro" />
	</span>
</g:if>
<g:if test="${enderecoInstance?.numero}">

	<span class="property-value" aria-labelledby="numero-label"> <g:fieldValue
			bean="${enderecoInstance}" field="numero" />
	</span>
</g:if>
<br>
<g:if test="${enderecoInstance?.complemento}">
	<span class="property-value" aria-labelledby="complemento-label">
		<g:fieldValue bean="${enderecoInstance}" field="complemento" />
	</span>
</g:if>
<br>
<g:if test="${enderecoInstance?.bairro}">

	<span class="property-value" aria-labelledby="bairro-label"> <g:fieldValue
			bean="${enderecoInstance}" field="bairro" />
	</span>
</g:if>
<g:if test="${enderecoInstance?.cidade}">

	<span class="property-value" aria-labelledby="cidade-label"> <g:fieldValue
			bean="${enderecoInstance}" field="cidade" />
	</span>
</g:if>
<br>
<g:if test="${enderecoInstance?.cep}">
	<span class="property-value" aria-labelledby="cep-label"> <g:fieldValue
			bean="${enderecoInstance}" field="cep" />
	</span>
</g:if>

