<div id=listaContato>
<g:if test="${contatos?.size() > 0 }">
	<table>
		<tr>
			<th>Telefone</th>
		</tr>
		<g:each var="contato" in="${contatos}">
			<tr>
				<td>
					${contato?.fone}
				</td>
				<td>
					<a href="#">Alterar</a>
					<a href="#">Excluir</a>
				</td>
			</tr>
		</g:each>
	</table>
</g:if>
<g:else>
	Não há telefones cadastrados.
</g:else>
</div>