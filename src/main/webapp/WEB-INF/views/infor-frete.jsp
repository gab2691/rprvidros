<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>



<c:forEach var="frete" items="${frete}">
	<div class="table-frete">
		<div class="valores-table">
			<div class="frete-sedex">

				<div class="input-extern">
					<div class="nucleo-input"></div>
				</div>

				<div>
					<p>Sedex |</p>
				</div>
				<div>
					<p>${frete.prazoEntrega} dia(s) útei(s) -</p>
				</div>
				<div>
					<p>R$ ${frete.valor}</p>
				</div>

			</div>
		</div>
	</div>

</c:forEach>
