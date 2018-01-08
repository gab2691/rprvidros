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
		<div class="flex-status-confirmacao">
			<span class="icon-checkmark2"></span>
			<p class="titulo-car">confirmação</p>
		</div>
		<div class="flex-status-pagamento">
			<span class="icon-credit-card2"></span>
			<p class="titulo-car">pagamentos</p>
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