<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

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
	
	<div class="title-account">
		<p>Meu Perfil</p>
	
	</div>
	
	<div class="container-account">
		<div class="message-success">
			<div class="details-message">
				<span class="icon-check-circle-o"></span>
				<p>Dados alterados com sucesso!</p>
			</div>
			<button class="btn-message-success">OK</button>
		</div>	
	
		
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
		
		<div class="details-menu-account1">
				<div class=	"cotainer-account-details">
					<p class="title-account-user">Editar Meus Endereço</p>
					
					<div class="infor-user-account1">
						<p class="text-padrao-account">Endereço: </p>
						<input class="edit-input end-log" type="text" name="logradouro" value="${endereco.logradouro}">
					</div>					
					
					<div class="infor-user-account1">
						<p class="text-padrao-account">Nùmero: </p>
						<input class="edit-input end-num" type="text" name="numero" value="${endereco.numero}">
					</div>
					
					<div class="infor-user-account1">
						<p class="text-padrao-account">Complemento: </p>
						<input class="edit-input end-com" type="text" name="complemento" value="${endereco.complemento}">
					</div>
														
					<div class="infor-user-account1">
						<p class="text-padrao-account">Digite seu CEP: </p>
						<input class="edit-input end-cep" type="text" name="cep" value="${endereco.cep}">
					</div>
					
					<div class="infor-user-account1">
						<p class="text-padrao-account">Cidade: </p>
						<input class="edit-input end-cid" type="text" name="cidade" value="${endereco.cidade}">
					</div>
					
					<div class="infor-user-account1">
						<p class="text-padrao-account">UF: </p>
						<input class="edit-input end-uf" type="text" name="uf" value="${endereco.uf}">
						<input type="hidden" class="end-id" name="id" value="${endereco.id }">
					</div>
					
				</div>
			
				<button type="submit" class="edit-account-user edit-adress">
					<p>Salvar Informações</p>
				</button>
		</div>
	</div>
	

</tags:pageTemplate>