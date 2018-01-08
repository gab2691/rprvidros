<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags" %>

<tags:pageTemplate>
	
	<main class= "conteudo-produto">
		
			<form action='<c:url value="/carrinho/add" />' method="POST">
	            <div class="container">
	                <c:forEach items="${produto}" var="produto">
						<a href="/rprvidros/product/?id=${produto.id}" class="link-product">
		                    <div class="produtos-categoria">
		                        <img src="<c:url value="/${produto.path}"/>">
		                </a>        
		                        <p class="produto-titulo">${produto.descricao}</p>
		                        <p class="preco-produto">R$ ${produto.preco }</p>
		                        <p class="produto-carrinho">
		                        <button type="submit" class="botao-carrinho">
		                        <span class="icon-shopping-cart"> </span>
		                        Adicionar ao Carrinho </button></p>
		                        <input type="hidden" name="produtoId" value="${produto.id}" />
		                        <input type="hidden" name="quantidade" value="1" />
		                        <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
		                    </div>
		                    
	                </c:forEach>
	            </div>
	        </form>
       			
	</main>	
</tags:pageTemplate>	