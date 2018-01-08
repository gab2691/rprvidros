<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Produtos rprVidros</title>
</head>
<body>
	<h1>Lista de produtos</h1>
	
	<table>
		<tr>
			<td>Descrição</td>	
			<td>Cor</td>
			<td>Imagem</td>
		</tr>
		
		<c:forEach items="${produto}" var="produtos">
			<tr>
				<td>${produtos.descricao }</td>			
				<td>${produtos.cor }</td>
				<td><img src= "${produtos.path }" height= "50px" width="50px"></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>