<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate>

		<div class="title-account">
		<p>Meu Endereco</p>
	
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
				<a href="/rprvidros/meuEndereco"><p>Meus Endereços </p></a>
			</div>
			
			<div class="account-user-menu">
				<span class="icon-key3-account"></span>
				<a href="/rprvidros/alteraSenha"><p>Alterar minha senha</p></a>
			</div>
			
			
			
		</div>
		
		
		<div class="details-menu-account">
			<div class="cotainer-account-details">
				<p class="title-account-user">Endereço atual dos meus pedidos</p>
				<div class="infor-user-account"><p class="text-padrao-account">Destinatário: </p><p class="inform-details-account">${usuario.nome}</p></div>
				<div class="infor-user-account"><p class="text-padrao-account">Endereco: </p><p class="inform-details-account">${endereco.logradouro}, ${endereco.numero} ${endereco.complemento}</p></div>
				<div class="infor-user-account"><p class="text-padrao-account">Cidade: </p> <p class="inform-details-account">${endereco.cidade}</p></div>
				<div class="infor-user-account"><p class="text-padrao-account">CEP: </p> <p class="inform-details-account cep-user10">${endereco.cep}</p></div>
			</div>
			
			<form action="/rprvidros/editarEndereco">
				<button class="edit-account-user">
				<p>Editar Dados</p>
				</button>
			</form>
		</div>	
	
	</div>


</tags:pageTemplate>