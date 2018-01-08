<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<div class="products-list">
		
</div>

<div class="user-check">	
		<security:authorize access="isAuthenticated()">
	    	<security:authentication property="principal" var="usuario"/>
    		<spam class="name-user">${usuario.nome}</spam>
		</security:authorize>
</div>
<header class="cabecalho-principal">
	<div class="container">
		<h1 class="titulo-principal">Rpr Vidros</h1>
		<h3 class="subtitulo-principal">Kits e Ferragens</h3>


		<form action="/rprvidros/busca" method="post">
			<div class="pesquisa">
				<fieldset>
					<label class="search"> <input type="text" name="busca"
						placeholder="faça sua pesquisa" cols="90" rows="30" autofocus>
						<button class="busca">
							<span class="icon-search4"></span>
						</button> <input type="hidden" name="${_csrf.parameterName }"
						value="${_csrf.token }" />
					</label>
				</fieldset>
			</div>
		</form>

		<div class="navegacao-usuario">
			<div class="carrinho">

				<span class="icon-cart2"></span>
				<h2 class="titulo-carrinho">meu carrinho(<span class="quant-request">${pedido.quantidade}</span>)</h2>

				<div class="car-user">
					
				</div>
			</div>

			<div class="acesso-principal">
				<span class="icon-user-circle-o"></span>
				<h3 class="opcao-acesso">minha conta</h3>
			</div>

			<!--  <div class="fale-conosco">
				<span class="icon-volume-control-phone"></span>
				<h3 class="nav-fale">fale concosco</h3>
			</div>-->
		</div>

		


		<div class="drop-user">
			<div class="line-bottom-login">
				<button class="button-login">Entrar</button>
			</div>

			<div class="user-inform">
				<spam class="account-user" ><p>Minha conta</p></spam>
			</div>

			<div class="user-inform">
				<spam class="request-user-link"><p>Meus pedidos</p></spam>
			</div>
		</div>
		<div class="block-page"></div>
		<div class="login">
			
			<div class="error-login">
				<p>Email ou senha incorretos.</p>
				<p>Tente novamente.</p>
			</div>
			<div class="login-titulo">
				<h1>Identifique-se</h1>
			</div>
			<div class="both-login">
				<div class="login-cadastrado">
						<h2>Email</h2>
						<div class="email">
							<span class="icon-user"></span> 
							 <label>
							 	<input class="nome-email username" pattern="[^ @]*@[^ @]*" type="email" name="username" placeholder="email@email.com" autofocus required="Insira seu Email">
							</label>
						</div>
						<h2>Senha</h2>
						<div class="email">
							<span class="icon-key3"></span> 
							<label>
								 <input	class="nome-email password" type="password" name="password"	placeholder="*******" autofocus required="Insira sua senha">
							</label>
						</div>
						<div class="login-botao">
							<button class="botao-login" type="submit">Entrar</button>
							<input type="hidden" name="${_csrf.parameterName }"
								value="${_csrf.token }" />
						</div>
				</div>

				<div class="login-cadastrece">
					<p>Primeira compra?</p>
					<button class="botao-login-cadastrece" type="submit">
						<span class="icon-user277"></span>Cadastre-se agora
					</button>
				</div>
			</div>
		</div>

		<main class="entre-em-contato">
		<div class="container-cadastro">

			<form action="/rprvidros/adicionaUsuario/add" method="post">
				<div class="full-div">
					<h1 class="titulo-cadastro">Cadastre-se</h1>
					<div class="form-cadastro">

						<div class="cadastro-divs">
							<span class="icon-cadastro"></span> <label> <input
								class="inputs" type="text" name="nome"
								placeholder="Nome Completo" autofocus required>
							</label>
						</div>

						<div class="cadastro-divs">
							<span class="icon-key3"></span> <label> <input
								class="inputs" type="password" name="senha" placeholder="Senha"
								required>
							</label>
						</div>

						<div class="cadastro-divs">
							<span class="icon-envelope22"></span> <label> <input
								class="inputs" type="email" name="email" placeholder="Email"
								required />
							</label>
						</div>

						<div class="cadastro-divs">
							<span class="icon-envelope22"></span> <label> <input
								class="inputs" type="email" name="emailAlternativo"
								placeholder="Email-Alternativo" required />
							</label>
						</div>

						<div class="cadastro-divs">
							<span class="icon-phone"></span> <label> <input
								class="inputs telefone-form" type="text" name="telefone"
								placeholder="Telefone com DDD" required />
							</label>

						</div>
						<div class="cadastro-divs">
							<span class="icon-milestone2"></span> <label> <input
								class="inputs" type="text" name="uf"
								placeholder="UF - exemplo(SP)" required maxlength="2" />
							</label>
						</div>

						<div class="cadastro-divs">
							<span class="icon-building-o"></span> <label> <input
								class="inputs" type="text" name="cidade" placeholder="Cidade"
								required />
							</label>
						</div>

						<div class="cadastro-divs">
							<span class="icon-location22"></span> <label> <input
								class="inputs cep-form" type="text" name="cep" placeholder="Cep" required />
							</label>
						</div>


						<div class="cadastro-divs">
							<span class="icon-street-view1"></span> <label> <input
								class="inputs" type="text" name="logradouro"
								placeholder="Logradouro" required />
							</label>
						</div>


						<div class="cadastro-divs">
							<span class="icon-bell-o"></span> <label> <input
								class="inputs" type="text" name="numero" placeholder="Número"
								required />
							</label>
						</div>
					</div>
					<div class="cadastrar">
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token }" />
						<button class="botao-cadastro" type="submit">
							cadastrar <span class="icon-arrow-right"></span>
						</button>
					</div>
				</div>
			</form>
		</div>
		</main>
		<div class="nav-intens">
			<a href="/rprvidros">
				<div class="links-nav-home">
					<span class="icon-home"></span> Home
				</div>
			</a> <a href="/rprvidros/clientes">
				<div class="links-nav-clientes">
					<span class="icon-users2"></span> Clientes
				</div>
			</a>
			<div class="procuts-hover">
				<span class="icon-box"></span> Produtos

			</div>
			<a href="/rprvidros/nossaLoja">
				<div class="links-nav-loja">
					<span class="icon-store"></span> Nossa Loja
				</div>
			</a>

		</div>


	</div>




</header>
