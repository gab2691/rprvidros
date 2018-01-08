<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
	<title>rprvidros</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="_csrf" content="${_csrf.token}"/>
	<meta name="_csrf_header" content="${_csrf.headerName}"/>	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\reset.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\cadastro.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/rprvidros.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\categoria.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/detalhe.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\login.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\pagamentos.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\confirmacao.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\clientes.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\nossaLoja.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\minhaConta.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\editarDados.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\meusPedidos.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\detalhePedido.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\editarEndereco.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\alteraSenha.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\alterarEmail.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\product.css"/>">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css\transicoes.css"/>">
	<link href="https://fonts.googleapis.com/css?family=Permanent+Marker" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css?family=Khand" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Cabin" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css?family=Oswald" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet"> 
	<link href="https://fonts.googleapis.com/css?family=Playfair+Display" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=PT+Sans" rel="stylesheet">
	 
</head>
<body class="body">

<%@ include file="/WEB-INF/views/cabecalho.jsp" %>

<jsp:doBody />

<%@ include file="/WEB-INF/views/rodape.jsp" %>
	<script src="<c:url value="/resources/jquery\jquery.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/jquery\rprvidros.js"/>" charset="utf-8"></script> 		
	<script src="<c:url value="/resources/jquery\jquery.mask.js"/>"></script> 		
	<script src="<c:url value="/resources/jquery\jquery.validate.js"/>"></script>
</body>
</html>