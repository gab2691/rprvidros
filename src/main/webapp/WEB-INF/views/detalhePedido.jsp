<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate>
	<div class="list-names">
			<c:forEach var="categoria" items="${categoria}">
				<form action="/rprvidros/categoria" method="get">
					<button class="button-list">
						<p class="name">${categoria.nome}</p>
					</button>
					<input type="hidden" name="categoria" value="'${categoria.nome}'"/>
				</form>	
			</c:forEach>	
		</div>
	
	<div class="details-request-user">
	
		<div class="request-number-status">
			<p class="title-number-request">Número do seu pedido</p>
			<p class="number-request-details">${pedidos.id}</p>
			<p class="request-satus-details">${pedidos.status}</p>			
		</div>
		
		<div class="request-user">
			<p>Destinatario: ${usuario.nome}</p>
			<p>${endereco.logradouro}, ${endereco.numero}</p>
			<p>${endereco.cidade} - ${endereco.uf}</p>
			<p>CEP: ${endereco.cep}</p>
		</div>
		
	</div>
	
	<div class="payment-request">
			<div class="title-payment">
				<p>Forma de Pagamento PagSeguro - <fmt:formatDate pattern="dd/MM/yyyy"  value="${pedidos.data_pedido}"/></p>
			</div>
			
			<div class="infor-payment-request">
				<p>A confirmação do pedido e todas as atualizações vão ser mandadas para este email: <div class="email-payment">${usuario.email}</div></p>
			</div>
		</div>
	
	<div class="request-details-page">
		<div class="title-request-details">
			<p>Dados da compra</p>
		</div>
		
		<div class="titles-request">
			<div>
				<p>Produtos</p>
			</div>	
			<div>
				<p>Quantidade</p>
			</div>	
			<div>
				<p>Preço Unitário</p>
			</div>	
			<div>
				<p>Preço Total</p>
			</div>	
		</div>
		
		

			<c:forEach var="item" items="${pedidoitem}">
				<div class="details-titles-request">
					<div>
						<p style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">${item.produto.descricao}</p>
					</div>
					
					<div>
						<p>${item.quantidade}</p>
					</div>
					
					<div>
						<p>${item.produto.preco}</p>		
					</div>
					
					<div>
						<p>R$ ${pedidos.getTotalItem(item)}</p>
					</div>
				</div>				
			</c:forEach>		
			
			<div class="frete-request">
			
				<div>
					<p>Frete</p>
				</div>
				<div>
					<p>R$ ${pedidos.frete}
				</div>
			</div>
			
			<div class="end-request">
				
				<div>
					<p>Total da Compra</p>
				</div>
				
				<div>
					<p>R$ ${pedidos.getTotalFrete()}</p>
				</div>
				
			</div>
		</div>
		
		

</tags:pageTemplate>