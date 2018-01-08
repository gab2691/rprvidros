<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div class="remove-car">
		<div class="title-car-user">
			<p>Meu carrinho</p>
		</div>
		
		<c:forEach var="prod" items="${pedidoItem}">
			<div class="prod-car-user">
				<img src="<c:url value="/${prod.produto.path}"/>">
				<p>
					${prod.produto.descricao} <br> Quantidade:
					${pedido.getQuantidade(prod)}
				</p>
				<div class="value-car-item">R$ ${pedido.getTotalItem(prod) }</div>
			</div>
		</c:forEach>
		<div class="closed-request-user">
			<div class="delivery-request">
				Total(valor sem frete): <strong class="value-delivery">R$<spam class="check-car">${pedido.getTotal()}</spam></strong>
			</div>
		
			<div class="button-closed-request">
				<a href="/rprvidros/carrinho/detalhe">Ver meu carrinho</a>
		
				<form action="/rprvidros/confirmacao" method="post">
					<button class="button-closed" type="submit">Fechar pedido</button>
					<input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }" required />
				</form>
			</div>
		</div>
	</div>