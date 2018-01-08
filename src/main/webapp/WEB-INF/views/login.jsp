<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate>
	<div class="status-car">
		<div class="flex-status">
			<span class="icon-cart"></span>
			<p class="titulo-car">meu carrinho</p>
		</div>	
		<div class="flex-status-cadastro">
			<span class="icon-checklist1"></span>
			<p class="titulo-car">cadastro</p>
		</div>
		<div class="flex-status-confirmacao">
			<span class="icon-checkmark2"></span>
			<p class="titulo-car">confirmação</p>
		</div>
		<div class="flex-status-pagamento">	
			<span class="icon-credit-card3"></span>
			<p class="titulo-car">pagamentos</p>
		</div>	
			
	</div>
	<main class="container">
		<div class="login">
			
			<div class="login-titulo">
				<h1>Identifique-se</h1>
			</div>
			<div class="both-login">
				<div class="login-cadastrado">
					<form action="/rprvidros/login" method="POST">
						<h2>Email</h2>
						<div class="email">
							<span class="icon-user"></span> 
							 <label>
							 	<input class="nome-email" pattern="[^ @]*@[^ @]*" type="email" name="username" placeholder="email@email.com" autofocus required="Insira seu Email">
							</label>
						</div>
						<h2>Senha</h2>
						<div class="email">
							<span class="icon-key3"></span> <label> <input
								class="nome-email" type="password" name="password"
								placeholder="*******" autofocus required="Insira sua senha">
							</label>
						</div>
						<div class="login-botao">
							<button class="botao-login" type="submit">Entrar</button>
							<input type="hidden" name="${_csrf.parameterName }"
								value="${_csrf.token }" />
						</div>
					</form>
				</div>

				<div class="login-cadastrece">
					<p>Primeira compra?</p>
					<button class="botao-login-cadastrece" type="submit">
						<span class="icon-user277"></span>Cadastre-se agora
					</button>
				</div>
			</div>
		</div>
	</main>
</tags:pageTemplate>