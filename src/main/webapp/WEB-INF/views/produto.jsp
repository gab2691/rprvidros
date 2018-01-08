<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate>
	
	
	<div class="container-product">
		<div class="img-product">
			
			<div class="button-foto">
				<span class="icon-camera"></span>
				<p>FOTOS</p>
			</div>
			
			<img class="img-style" src="<c:url value="/${produto.path}"/>">
		</div>
		
		<div class="product-side">
			<div class="details-produt">
				<div class="title-product-details">
					<div class="title-side-product">
						<span class="icon-file-text-o"></span>
						<p>DESCRIÇÃO</p>
					</div>
				</div>
				
				<p class="title-product">${produto.descricao}</p>
			</div>
			
			<div class="form-product-details">
				<div class="quant-form-products">
					
					<form action='<c:url value="/carrinho/add" />' method="POST">
						<div class="display-flex-form">
							<div class="display-form">
								<p>Quantidade</p>
								<input type="number" value="1" name="quantidade">
							</div>
							
							<div class="display-form">
								<p>Cor</p>
								<input type="text" value="${produto.cor}">
							</div>
							
							<div class="preco-products">
								R$ ${produto.preco}
							</div>
							
							<input type="hidden" name="produtoId" value="${produto.id}" />
	                        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
							<button class="button-page-produtcs" type="submit">ADICIONAR AO CARRINHO</button>
						</div>		
					</form>
				</div>
				
			</div>
		
		</div>
	
	</div>
	

</tags:pageTemplate>