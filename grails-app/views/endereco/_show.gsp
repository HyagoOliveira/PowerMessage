<%@ page import="com.acception.usuario.Endereco" %>


<div id="show-endereco" class="content scaffold-show" role="main">

	<ol class="property-list endereco">
	
		<g:if test="${enderecoInstance?.cep}">
			<li class="fieldcontain">
				<span id="cep-label" class="property-label">
					<g:message code="endereco.cep.label" default="Cep" />
				</span> 
				<span class="property-value" aria-labelledby="cep-label">
					<g:fieldValue bean="${enderecoInstance}" field="cep" />
				</span>
			</li>
		</g:if>

		
		<li class="fieldcontain">
			<g:if test="${enderecoInstance?.logradouro}">
				<span id="logradouro-label" class="property-label">
					<g:message code="endereco.logradouro.label" default="Logradouro" />
				</span> 
				<span class="property-value" aria-labelledby="logradouro-label">
					<g:fieldValue bean="${enderecoInstance}" field="logradouro" />
				</span>
			</g:if>
				
			<g:if test="${enderecoInstance?.numero}">
				<span id="numero-label" class="property-label">
					<g:message code="endereco.numero.label" default="Numero" />
				</span>
				<span class="property-value" aria-labelledby="numero-label">
					<g:fieldValue bean="${enderecoInstance}" field="numero"/>
				</span>
			</g:if>
		</li>
		

		<g:if test="${enderecoInstance?.complemento}">
			<li class="fieldcontain">
				<span id="complemento-label" class="property-label">
					<g:message code="endereco.complemento.label" default="Complemento" />
				</span> 
				<span class="property-value" aria-labelledby="complemento-label">
					<g:fieldValue bean="${enderecoInstance}" field="complemento" />
				</span>
			</li>
		</g:if>

		<li class="fieldcontain">
			<g:if test="${enderecoInstance?.bairro}">
				<span id="bairro-label" class="property-label">
					<g:message code="endereco.bairro.label" default="Bairro" />
				</span>
				<span class="property-value" aria-labelledby="bairro-label">
					<g:fieldValue bean="${enderecoInstance}" field="bairro"/>
				</span>
			</g:if>
			
			<g:if test="${enderecoInstance?.cidade}">
				<span id="cidade-label" class="property-label">
					<g:message code="endereco.cidade.label" default="Cidade" />
				</span>
				<span class="property-value" aria-labelledby="cidade-label">
					<g:fieldValue bean="${enderecoInstance}" field="cidade"/>
				</span>
			</g:if>
		</li>

	</ol>
</div>
