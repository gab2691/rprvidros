<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

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
		
		<div class="details-menu-account">
			<form action="/rprvidros/editarSenha" method="post" style="height: 22em;">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
				<div class="cotainer-account-details">
					<p class="title-account-user">Alterar Minha Senha</p>
					
					<div class="infor-user-account2">
						<p class="text-padrao-account">Senha Atual: </p>
						<input class="edit-input" type="password" name="senha" value="" required>
					</div>
					
					
					<div class="infor-user-account2">
						<p class="text-padrao-account">Senha Nova: </p>
						<input class="edit-input new-password" type="password" name="senhaNova" value="" required>
					</div>
					
					<div class="infor-user-account2">
						<p class="text-padrao-account">Confirmar Senha: </p>
						<input class="edit-input compar-password" type="password" name="confirmSenha" value="" required>
					</div>
				</div>
			
				<button type="submit" class="edit-account-password">
					<p>Confirmar edição</p>
				</button>
			</form>
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