<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate>

	
	<main class="entre-em-contato">
		<div class="container-cadastro">
			
			<form action="/rprvidros/adicionaUsuario/add" method="post">
				<div class="full-div">
					<h1 class="titulo-cadastro">Cadastre-se</h1>
					<div class="form-cadastro">
						
						<div class="cadastro-divs">
							<span class="icon-cadastro"></span> 
							 <label>
							 	<input class="inputs" type="text" name="nome" placeholder="Nome Completo" autofocus required>
						 	</label>
						</div>
		
						<div class="cadastro-divs">
							<span class="icon-key3"></span>
							 <label>
							 	<input class="inputs" type="password" name="senha"	placeholder="Senha" required>
						 	</label>
						</div>
		
						<div class="cadastro-divs">
							<span class="icon-envelope22"></span>
							<label>
								<input class="inputs" type="email" name="email" placeholder="Email" required />
							</label>
						</div>
		
						<div class="cadastro-divs">
							<span class="icon-envelope22"></span>
							<label>
								<input class="inputs" type="email" name="emailAlternativo" placeholder="Email-Alternativo" required />
							</label>
						</div>
		
						<div class="cadastro-divs">
							<span class="icon-phone"></span>
							<label>
								<input class="inputs" type="text" name="telefone" placeholder="Telefone com DDD" required />
							</label>
		
						</div>
						<div class="cadastro-divs">
							<span class="icon-milestone2"></span>
							<label>
								<input class="inputs" type="text" name="uf"	placeholder="UF - exemplo(SP)" required maxlength="2"/>
							</label>
						</div>
		
						<div class="cadastro-divs">
							<span class="icon-building-o"></span>
							<label>
								<input class="inputs" type="text" name="cidade"	placeholder="Cidade" required />
							</label>
						</div>
		
						<div class="cadastro-divs">
							<span class="icon-location22"></span>
							<label>
								<input class="inputs" type="text" name="cep" placeholder="Cep" required />
							</label>
						</div>
		
		
						<div class="cadastro-divs">
							<span class="icon-street-view1"></span>
							<label>
								<input class="inputs" type="text" name="logradouro"	placeholder="Logradouro" required />
							</label>
						</div>
		
		
						<div class="cadastro-divs">
							<span class="icon-bell-o"></span>
							<label>
								<input class="inputs" type="text" name="numero" placeholder="Número" required />
							</label>
						</div>
					</div>
					<div class="cadastrar">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						<button class="botao-cadastro" type="submit">cadastrar <span class="icon-arrow-right"></span></button>
					</div>
				</div>
			</form>
		</div>
	</main>

</tags:pageTemplate>
