<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate>

	<div class="confir-detalhes">
		<div class="endereco-confirm">
			<div class="title-endereco">
				<div class="left-title">
					<span class="icon-location3"></span>
					<p>Endereço</p>
				</div>
				
				<!-- <div class="rigth-title">
					<span class="icon-edit"></span>
					<a href="#">Editar</a>
				</div>-->
			</div>
			<div class="inform-entrega">
				<div class="inform-delivery">
					<p>${end.logradouro}, ${end.numero}  ${end.complemento}</p>
					<p>${end.cidade } - ${end.uf}</p>
					<p>CEP ${end.cep}</p> 
				</div>
			</div>
		</div>
		
		<div class="entrega-inform">
			<div class="title-endereco">
				<div class="left-delivery">
					<span class="icon-box1"></span>
					<p>Forma de entrega</p>
				</div>
				
			</div>
			<div class="inform-entrega">
				<div class="inform-delivery">
					<p>Sedex</p>
					<p>R$ ${pedido.frete }</p> 
				</div>
			</div>
		</div>
		
		<div class="products-inform">
			<div class="title-products">
				<div class="products-details">
					<div class="icons-products">
						<span class="icon-cart5"></span>
						<p>Produtos</p>
					</div>	
				</div>
				
				<div class="quant-products">
					<p>Quantidade</p>
					<p>Valor Unitário</p>
					<p>Subtotal</p>
				</div>
			</div>
			
			<div class="inform-products">
			
				<c:forEach var="itens" items="${itens}">
					<div class="prod-details">
						<div class="path-imag">
							<img  src="${itens.produto.path}">
							<p>${itens.produto.descricao}</p>
						</div>
						
						<div class="quant-itens">
							${itens.getQuantidade()}	
						</div>
						
						<div class="value-itens">
							${itens.produto.preco}	
						</div>
						
						<div class="valueSub-itens">
							<p>R$ ${pedido.getTotalItem(itens)}</p>
						</div>
					</div>
				</c:forEach>
				
				<div class="subto-item">
					<div class="value-sub">
						<p>Subtotal:</p>
						<p>R$ ${pedido.getTotal()}</p>
					</div>	
				</div>
				
				<div class="frete-item">
					<div class="value-sub">
						<p>Frente:</p>
						<p>R$ ${pedido.frete}</p>
					</div>	
				</div>
				
				<div class="total-pedido">
					<div class="value-total-confirm">
						<p>Total:</p>
						<p>R$ ${pedido.getTotalFrete()}</p>
					</div>
				</div>
								
			</div>
		</div>
			
	
	</div>
		<div class="pagamentos-container">
		<div class="titulo-pag">
			<p>Formas de Pagamento</p>
		</div>

		<div class="pag-options">
			
			<div class="div-img">
				<div class="left-pag">
					<input type="radio" checked>
					<img class="pag" src="<c:url value="/resources/imagens\imagensCapa/pagSeguro.png"/>">
				</div>
				
				<div class="rigth-pag">	
					<img src="<c:url value="/resources/imagens\imagensCapa/visa.jpg"/>">
					<img src="<c:url value="/resources/imagens\imagensCapa/master.png"/>">
					<img src="<c:url value="/resources/imagens\imagensCapa/american.png"/>">
					<img src="<c:url value="/resources/imagens\imagensCapa/boleto.jpg"/>">
				</div>
			</div>
			
			<div class="pag-message">
				<span class="icon-browser3"></span>
				<p class="message-pag">
					Após clicar em "Pagamento", você será redirecionado(a) para o PagSeguro para finalizar 
					a sua compra com segurança.
				</p>
			</div>
			
		</div>

		<div class="total-pag">Total: R$ ${pedido.getTotalFrete()}</div>
	</div>
	<form action="/rprvidros/pagSeguro">
		<button type="submit" class="continuar">
			Pagamento
			<input type="hidden" name="${_csrf.parameterName }"	value="${_csrf.token }" />
		</button>
	</form>
</tags:pageTemplate>