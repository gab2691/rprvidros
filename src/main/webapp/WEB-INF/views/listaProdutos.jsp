<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="list-names">
	<c:forEach var="categoria" items="${categoria}">
		<form action="/rprvidros/categoria" method="get">
			<button class="button-list">
				<p class="name">${categoria.nome}</p>
			</button>
			<input type="hidden" name="categoria" value="'${categoria.nome}'" />
		</form>
	</c:forEach>
</div>