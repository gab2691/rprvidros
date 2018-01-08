<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<c:forEach var="item" items="${pedidoItem}">
			<div class="car-products">
					<img src="<c:url value="/${item.produto.path}"/>">
					<p>${item.produto.descricao}</p>
				</div>
	
				<div class="car-vqs">
					<p>R$ ${item.produto.preco }</p>
					<div class="trash">
							<button type="submit" class="button-trash"> 
								<span class="icon-trashcan2"></span></button>
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
							<input class="quant-trash" type="number" min="0" id="quantidade" name="quantidade" value="${pedido.getQuantidade(item) }"/>
					</div>	
					<p>R$ ${pedido.getTotalItem(item) }</p>
				</div>
				</c:forEach>