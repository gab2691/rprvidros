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
		
		<div class="details-menu-account">
				<div class="cotainer-account-details">
					<p class="title-account-user">Editar Meus Dados</p>
					
					<div class="infor-user-account">
						<p class="text-padrao-account">Nome Completo: </p>
						<input class="edit-input name-alter" type="text" name="nome" value="${usuario.nome}">
					</div>
					
					
					<div class="infor-user-account">
						<p class="text-padrao-account">Email: </p>
						<input class="edit-input email-alter" type="email" name="email" value="${usuario.email}">
					</div>
					
					<div class="infor-user-account">
						<p class="text-padrao-account">Telefone: </p>
						<input class="edit-input tel-user" type="text" name="telefone" value="${usuario.telefone}">
					</div>
				</div>
			
				<button type="submit" class="edit-account-user">
					<p>Confirmar edição</p>
				</button>
		</div>
		
		<div class="message-success">
			<div class="details-message">
				<span class="icon-check-circle-o"></span>
				<p>Dados alterados com sucesso!</p>
			</div>
			<button class="btn-message-success">OK</button>
		</div>
		
	</div>
	

</tags:pageTemplate>