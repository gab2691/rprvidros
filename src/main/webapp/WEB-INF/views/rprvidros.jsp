<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate>

	<div class="banner-header">
			<img class="" src="<c:url value="/resources/imagens\imagensCapa/banner.png"/>">
			 
	</div>
	<main class="conteudo-principal">



		<div class="container">
			<div class="nav-produtos">
			
			
				
				<form action="/rprvidros/categoria" method="get">
					<button type="submit" class="botao-categoria">
						<span class="icon-tools"></span>
						<h2>Ferramentas</h2>
					</button>
					<input type="hidden" name="categoria" value="'Ferramentas'"/>
				</form>	
				
				
				<form action="/rprvidros/categoria" method="get">	
					<button type="submit" class="botao-categoria">
						<span class="icon-mirror"></span>
						<h2>Acessorios para espelhos</h2>
						<input type="hidden" name="categoria" value="'Acessorios para espelho'"/>
					</button>	
				</form>	
				
				
				
				<form action="/rprvidros/categoria" method="get">	
					<button type="submit" class="botao-categoria">
						<span class="icon-package"></span>
						<h2>Embalagens</h2>
						<input type="hidden" name="categoria" value="'Embalagens'"/>
					</button>	
				</form>
				
				
				<form action="/rprvidros/categoria" method="get">	
					<button type="submit" class="botao-categoria">
						<span class="icon-key"></span>
						<h2>Fechaduras</h2>
						<input type="hidden" name="categoria" value="'Fechaduras'"/>
					</button>	
				</form>
				
				
				<form action="/rprvidros/categoria" method="get">	
					<button type="submit" class="botao-categoria">
						<span class="icon-hand-peace-o"></span>
						<h2>Mão de Amigo</h2>
						<input type="hidden" name="categoria" value="'MaoDeAmigo'"/>
					</button>	
				</form>
					
					
				<form action="/rprvidros/categoria" method="get">	
					<button type="submit" class="botao-categoria">
						<span class="icon-support2"></span>
						<h2>Suportes</h2>
						<input type="hidden" name="categoria" value="'Suportes'"/>
					</button>	
				</form>
			</div>

			<div class="orcamento">
				<div class="citacao-superior">
					<h1 class="citacao-kit">kits box</h1>
					<h2 class="citacao-ferramentas">Ferramentas</h2>
				</div>
				<img class="imagem-orcamento" src="<c:url value="/resources/imagens\imagensCapa/ferramentas-juntas.jpg"/>">
				

				<div class="citacao-meio">
					<h1 class="citacao-kit">Trincos</h1>
					<h2 class="citacao-ferramentas">Qualidade Superior</h2>					
				</div>

				<div class="citacao-baixo">
					<h1 class="citacao-kit">Perfils</h1>
					<h2 class="citacao-ferramentas">Kits de ferragens</h2>					
				</div>	
				<div class="citacao-superior-direita">
					<h1 class="citacao-kit">Vedação</h1>
					<h2 class="citacao-ferramentas">Lançamentos</h2>					
				</div>
				<div class="citacao-superior-meio">
					<h1 class="citacao-kit">Puxadores</h1>
					<h2 class="citacao-ferramentas">Portas automaticas</h2>					
				</div>

			</div>
			
			
			<div class="entre-em-contato">
				<form action="/rprvidros/orcamentos" method="post">	
					<div class="container">
						<h1 class="titulo-orcamento">Peça um Orçamento!</h1>
							<div class="email-nome">
								<span class="icon-user2"></span>
								<label>
									<input class="nome-orcamento" type="text" name="nome" placeholder="Nome Completo" autofocus required>
								</label>
							</div>
		
							<div class="email-email">	
								<span class="icon-email"></span>
								<label>
									<input class="email-orcamento" type="email" name="email" placeholder="Email" required />
								</label>
								</div>
		
							<div class="email-telefone">
								<span class="icon-phone2"></span>
								<label>
									<input class="telefone-orcamento" type="text" name="telefone" placeholder="Telefone com DDD" required />
								</label>
							</div>	
		
							<div class="email-mensagem">
								<span class="icon-comment2"></span>
								<label>
									<input class="telefone-orcamento" type="text" name="mensagem" placeholder="mensagem" required>
								</label>
							</div>
		
							<div class="enviar-orcamento">
								
								<button class="botao-orcamento" type="submit">
									<span class="icon-email2"></span>
									Enviar
								</button>
							</div>
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
						</div>
					</form>			
				<img src="<c:url value="/resources/imagens\imagensCapa/ferramentas-orcamento.jpg"/>">
			</div>
			
						
	</main>
</tags:pageTemplate>	
	