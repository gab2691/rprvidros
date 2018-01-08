<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate>
	
	<div class="title-account">
		<p>Meu Perfil</p>
	
	</div>
	
	<div class="container-account">
		
		<div class="menu-account">
			<div class="account-user-menu">
				<span class="icon-user-account"></span>
				<a href="/rprvidros/MinhaConta"><p>Dados da minha conta</p></a>
			</div>
			
			<div class="account-user-menu">
				<span class="icon-box-menu"></span>
				<a href="/rprvidros/meusPedidos"><p>Meus pedidos</p></a>
			</div>
			
			<div class="account-user-menu">
				<span class="icon-location"></span>
				<a href="/rprvidros/meuEndereco"><p>Meus Endereços</p></a>
			</div>
			
			<div class="account-user-menu">
				<span class="icon-key3-account"></span>
				<a href="/rprvidros/alteraSenha"><p>Alterar minha senha</p></a>
			</div>
			
						
		</div>
		
		<div class="account-request">
			<div class="empty-request">
				<div class="title-request">
					<div class="number-request">
						<p>Pedido</p>
					</div>
					
					<div class="status-request">
						<p>Status</p>					
					</div>
					
					<div class="request-Qitens">
						<p>Qtde Itens</p>					
					</div>
					
					<div class="request-value">
						<p>Valor total</p>					
					</div>
				</div>
				<c:forEach var="pedido" items="${pedidos}">
					<div class="container-resuest">
						<div class="request-details">
							<div class="number-details">
								<p><spam class="id-pedido">${pedido.id}</spam></p>
								<p>
									<fmt:formatDate pattern="dd/MM/yyyy"  value="${pedido.data_pedido}"/>
								</p>
							</div>
							
							<div class="buttom-details-request">
								<button class="style-button-request">${pedido.status}</button>
							</div>
						
							<div class="itens-details">
								<p><spam class="quant-ped">${pedido.getQuantidade()}</spam></p>
							</div>
							<div class="value-details">
								<p>R$ ${pedido.getTotalFrete()}
							</div>
								
							
							<div class="details-request-full">
								<form class="form-request" action="/rprvidros/detalhesPedido" method="post">
									<button type="submit" class="button-req-det">Detalhes do Pedido</button>		
									<input type="hidden" name="pedidoId" value="${pedido.id }">
									<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
								</form>	
							</div>
						</div>
						<div class="container-img-status">
							<img class="img-status" src="">
						</div>
					</div>
				</c:forEach>
			</div>
			
		</div>
	</div>
	
</tags:pageTemplate>