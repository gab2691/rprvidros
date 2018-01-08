<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>


<tags:pageTemplate>
	<div class="products-list">
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
	</div>
	
	
	<div class="empty-car-user">
		<h1>Seu carrinho está vazio.</h1>
		<p>Volte na paginal inicial e escolha produtos para seu carrinho.</p>
		<form action="/rprvidros">
			<button>Escolher Produtos</button>
		</form>		
	</div>
	
	<p class="title-car-details">Meu Carrinho</p>
		
	<div class="drop-page">
		<div class="car-add">
	
			<div class="car-title">
				<p class="car-cabecaclho">Produto(s)</p>
				<div class="title-vqs">
					<p>Preço Unitário</p>
					<p>Quantidade</p>
					<p>Preço Total</p>
				</div>
			</div>
			<c:forEach var="item" items="${pedidoItem}">
				<div class="org-img">
					<div class="car-products">
						
						<img src="<c:url value="/${item.produto.path}"/>">
						<p>${item.produto.descricao}</p>
						
					</div>
		
					<div class="car-vqs">
						<p>R$ <spam class="preco-item">${item.produto.preco }</spam></p>
						<div class="trash">
								<button type="submit" class="button-trash">
									<p class="produtoId" style="display: none;">${item.produto.id}</p>
									<span class="icon-trashcan2"></span>
								</button>
									
								<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
								<input class="quant-trash" type="number" min="0"  name="quantidade" value="${pedido.getQuantidade(item)}"/>
								<p class="null-quantidade">${pedido.getQuantidade(item)}</p>
								<span class="icon-refresh"></span>
						</div>	
						<p>R$ <spam class="total-pedido-3">${pedido.getTotalItem(item)}</spam></p>
					</div>						
				</div>	
				
			</c:forEach>
			<div class="sub-total">
				<p class="valor-total">Sub-total:</p>
				<p class="car-sub">R$ <spam class="total-request">${pedido.getTotal()}</spam></p>
			</div>		
		</div>
	
		<div class="frete">
			<div class="frete-details">
				<p class="text-infor">Simule o prazo de entrega e o frete para seu CEP abaixo:</p>
				<div class="diplay-flex-form">
					<input class="input-cep1" type="text" name="cep" maxlength="8" min="9" autofocus placeholder="00000-000" required/>
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
					<button class="cep-ok" type="submit">OK</button>
					<a  class="link-cep" href="http://m.correios.com.br/movel/buscaCepConfirma.do" target="_blanck">Não sei meu CEP</a>
				</div>
					
					<div class="infrom-atencion">
						<div class="atencion">
							<p>Atenção:</p>
						</div>
						
						<div class="message-atencion">
							O prazo começa a contar a partir da aprovação do pagamento.
						</div>
						
					</div>
				
					
					
				</div>
						
				<div class="response-ajax-frete">
				
				</div>
		</div>
			<div class="button-cart">
				<form action="/rprvidros" method="get">
					<button type="submit" class="button-cont">Comprar Mais</button>
				</form>
			
				<button type="submit" class="button-fin" >
					Continuar 
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"  required/>
				</button>
			
				<div class="warn-cep">
					<p>Preencha o CEP</p>
				</div>
			</div>
	</div>
	
</tags:pageTemplate>