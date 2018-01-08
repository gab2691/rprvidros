<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>


<tags:pageTemplate>


	<div class="status-car">
		<div class="flex-status">
			<span class="icon-cart"></span>
			<p class="titulo-car">meu carrinho</p>
		</div>	
		<div class="flex-status-cadastro">
			<span class="icon-checklist"></span>
			<p class="titulo-car">cadastro</p>
		</div>
		<div class="flex-status-pagamento">	
			<span class="icon-credit-card2"></span>
			<p class="titulo-car">pagamentos</p>
		</div>	
		<div class="flex-status-confirmacao">
			<span class="icon-checkmark2"></span>
			<p class="titulo-car">confirmação</p>
		</div>	
	</div>
	<div class="car-add">

		<div class="car-title">
			<p class="car-cabecaclho">Produto</p>
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
					<p>R$ ${item.produto.preco }</p>
					<div class="trash">
						<form action="${s:mvcUrl('CCC#remover').arg(0,item.produto.id).build() }" method="post">
							<button type="submit" class="button-trash"> 
								<span class="icon-trashcan2"></span></button>
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						</form>	
							<input class="quant-trash" type="number" min="0" id="quantidade" name="quantidade" value="${pedido.getQuantidade(item) }"/>
					</div>	
					<p>R$ ${pedido.getTotalItem(item) }</p>
				</div>						
			</div>	
			
		</c:forEach>
		<div class="sub-total">
			<p class="valor-total">Sub-total:</p>
			<p class="car-sub">R$ ${pedido.getTotal()}</p>
		</div>
		<div class="frete">
				<div class="frete-details">
					<p class="text-infor">Informe o CEP do local de entrega para calcular o valor do Frete e Previsão de Entrega:</p>
					<form action="/carrinho/frete">
						<input class="input-cep1" type="text" name="cep1" maxlength="5" autofocus placeholder="00000" required/>
						<input class="input-cep2" type="text" name="cep2" maxlength="3" autofocus placeholder="000" required/>
						<button class="cep-ok" type="submit">OK</button>
					</form>
				</div>
			
			<div class="valor-frete">
				<p class="valor-total">Frete</p>
				<p class="car-sub">R$</p>
			</div>
		</div>
	</div>
	<div class="button-cart">
			<form action="/rprvidros" method="get">
				<button type="submit" class="button-cont">Comprar Mais</button>
			</form>
			
			
			<form action="/rprvidros/confirmacao" method="post">
				<button type="submit" class="button-fin">
					Continuar 
					<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
				</button>
				
			</form>
	</div>		
</tags:pageTemplate>