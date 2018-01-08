$(document).ready(function() {
	$(".telefone-form").mask("(99)99999-9999");
	$(".tel-user").mask("(99)99999-9999");
	$(".cep-form").mask("99999-999");
	$(".input-cep1").mask("99999-999");
	$(".cep-user10").mask("99999-999");
	
	if($(".quant-request").text() == 0){
		$(".drop-page").fadeOut();
		$(".empty-car-user").css("display","flex");
	}
	
	if($(".id-pedido").length == 0){
		$(".empty-request").remove();
		$(".account-request").html("<p class=empty-ped>Voce ainda não possui pedido conosco :(</p>");
	}
});

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");

var show = function() {
	$(".car-user").removeClass("car-fix1");
	$(".car-user").addClass("car-fix");
}

var remove = function() {
	$(".car-user").addClass("car-fix1");
}

$(".carrinho").on('mouseenter', show).on('mouseleave', remove);

var showProducts = function() {
	$(".products-list").removeClass("car-fix1");
	$(".products-list").addClass("car-fix");
}

var removeProducts = function() {
	$(".products-list").addClass("car-fix1");
}

$(".procuts-hover").on('mouseenter', showProducts).on('mouseleave',
		removeProducts);
$(".products-list").on('mouseenter', showProducts).on('mouseleave',
		removeProducts);

var showAccount = function() {
	$(".drop-user").removeClass("car-fix1");
	$(".drop-user").addClass("car-fix");
}

var removeAccount = function() {
	$(".drop-user").addClass("car-fix1");
}

$(".acesso-principal").on('mouseenter', showAccount).on('mouseleave',removeAccount);
$(".drop-user").on('mouseenter', showAccount).on('mouseleave', removeAccount);

var showShadowhome = function() {
	$(".links-nav-home").addClass("divs-shadowws");
}

var removeShadowhome = function() {
	$(".links-nav-home").removeClass("divs-shadowws");
}

$(".links-nav-home").on('mouseenter', showShadowhome).on('mouseleave',
		removeShadowhome);

var showShadowcli = function() {
	$(".links-nav-clientes").addClass("divs-shadowws");
}

var removeShadowcli = function() {
	$(".links-nav-clientes").removeClass("divs-shadowws");
}

$(".links-nav-clientes").on('mouseenter', showShadowcli).on('mouseleave',
		removeShadowcli);

var showShadowloja = function() {
	$(".links-nav-loja").addClass("divs-shadowws");
}

var removeShadowloja = function() {
	$(".links-nav-loja").removeClass("divs-shadowws");
}

$(".links-nav-loja").on('mouseenter', showShadowloja).on('mouseleave',
		removeShadowloja);

var showShadowpro = function() {
	$(".procuts-hover").addClass("divs-shadowws");
}

var removeShadowpro = function() {
	$(".procuts-hover").removeClass("divs-shadowws");
}

$(".procuts-hover").on('mouseenter', showShadowpro).on('mouseleave',
		removeShadowpro);

var addButtonCollor = function() {
	$(this).addClass("collor-buttom-change");
}

var removeButtonCollor = function() {
	$(this).css({"transition" : ".3s"}).removeClass("collor-buttom-change");
}

$(".button-login").on('mouseenter', addButtonCollor).on('mouseleave',removeButtonCollor);
$(".login-botao").on('mouseenter', addButtonCollor).on('mouseleave',removeButtonCollor);
$(".botao-login").on('mouseenter', addButtonCollor).on('mouseleave',removeButtonCollor);
$(".botao-login-cadastrece").on('mouseenter', addButtonCollor).on('mouseleave',removeButtonCollor);

var showLogin = function() {
	$(".drop-user").removeClass("car-fix");
	$(".login").addClass("show-login");
	$(".block-page").addClass("show-login");
}

$(".button-login").click(showLogin);

var removeLogin = function() {
	$(".login").removeClass("show-login");
	$(".block-page").removeClass("show-login");
	$(".full-div").removeClass("show-login");
	$(".message-success").addClass("car-fix1");
}

$(".block-page").click(removeLogin);

var showCada = function() {
	$(".login").removeClass("show-login");
	$(".full-div").addClass("show-login");
}

$(".botao-login-cadastrece").click(showCada);

var buttoncateg = function() {
	$(this).css({
		"transition" : ".3s"
	}).addClass("color-categoria");
}

var removecate = function() {
	$(this).css({
		"transition" : ".3s"
	}).removeClass("color-categoria");
}

$(".botao-categoria").on('mouseenter', buttoncateg)
		.on('mouseleave', removecate);

$(".botao-orcamento").on('mouseenter', buttoncateg)
		.on('mouseleave', removecate);


$(".cep-ok").click(function() {
	$.ajax({
		type : "GET",
		url : "/rprvidros/frete",
		data : "cep=" + $(".input-cep1").val(),
		success : function(resultado) {
			$(".response-ajax-frete").html(resultado).fadeIn();
			$(".table-frete").addClass("car-fix");
		}
	}).done(function() {

	}).fail(function() {
		console.log("erro");
	})
})

$(".edit-adress").click(function() {
	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	var log = $(".end-log").val();
	var num = $(".end-num").val();
	var com = $(".end-com").val();
	var cep = $(".end-cep").val();
	var cid = $(".end-cid").val();
	var uf = $(".end-uf").val();
	var id = $(".end-id").val();
	
	$.ajax({
		type: "POST",
		url: "/rprvidros/alterarDadosEndereco",
		data: {
			"logradouro" : log,
			"numero" : num, 
			"complemento" : com, 
			"cep" : cep, 
			"cidade" : cid,
			"uf" : uf,
			 "id" : id
		},
		
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		
		success : function() {
			$(".block-page").addClass("show-login");
			$(".message-success").addClass("car-fix");
			
		}
	})
})

$(".edit-account-user").click(function() {
	
	
	var name = $(".name-alter").val();
	var email = $(".email-alter").val();
	var telefone = $(".tel-user").val();

	$.ajax({
		type: "POST",
		url: "/rprvidros/alterarDados",
		data: {
			"nome" : name,
			"email" : email,
			"telefone" : telefone
		},
		
		beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		
		success : function() {
			$(".block-page").addClass("show-login");
			$(".message-success").addClass("car-fix");
			
		}
	})
})


$(".carrinho").on("mouseenter", function() {
	var $this = $(this);
	$.ajax({
		type: "GET",
		url: "/rprvidros/carUserListener",
		data: "",
		success: function(resultado) {
			$(".car-user").html(resultado);
			
			var totalCar = parseFloat($(".check-car").text());
			
			if(totalCar == 0){
				var divCar = $(".car-user").find(".remove-car").remove();
				$(".car-user").css("height", "4em");
				$(".car-user").html("<p class=empty-car>Seu carrinho está vazio</p>");
			}
		}
	})
})

$(".login-botao").click(function() {

	var username = $(".username").val();
	var password = $(".password").val();
	
	$.ajax({
		type: "POST",
		url: "/rprvidros/login",
		data : {
		"username" : username,
		"password" : password,
	},
	beforeSend: function (xhr) {
        xhr.setRequestHeader("login-ajax", "true");
        xhr.setRequestHeader(header, token);
    },
		success: function(resultado) {
			if(resultado == "ok"){
				$(location).attr('href', "/rprvidros/MinhaConta");
				
			}		
		},
		
		error: function (data,xhr) {
			$(".error-login").addClass("car-fix");
			console.log(xhr.status);
			setTimeout(
					function() {
						$(".error-login").addClass("car-fix1");
					}, 1500)
        }
	})
});

$(".procuts-hover").on("mouseenter", function() {
	$.ajax({
		type: "GET",
		url: "/rprvidros/categoriaAjax",
		data: "",
		success: function(resultado) {
			$(".products-list").html(resultado);
		}
	})
})

$(".button-trash").click(function(ev) {
			var $this = $(this);

			var target = $(ev.target);
			var id = target.siblings(".produtoId").text();

			var quantTrash = $this.parent().find(".quant-trash").val();

			var finalQuant = $this.parent().find(".null-quantidade").text();
			var precoItem = $this.parent().parent().find(".preco-item").text();

			$.ajax({
				type : "GET",
				url : "/rprvidros/carrinho/remover",
				data : {
					"produtoId" : id,
					"quantidade" : quantTrash
				},
				success : function(resultado) {

					var f = finalQuant - quantTrash;
					var precoItemFloat = parseFloat(precoItem) * f;
					
					$this.parent().find(".quant-trash").fadeOut(500);
					$this.parent().find(".quant-trash").val(f).fadeIn(500);
					
					
					$this.parent().find(".null-quantidade").text(f);
					
					
					var totalItem = $this.parent().parent().parent().find(".total-pedido-3");
					totalItem.fadeOut(500);
					totalItem.text(precoItemFloat.toFixed(2)).fadeIn(500);

					if ($this.parent().find(".quant-trash").val() == 0) {
						setTimeout(
								function() {
									$this.parent().parent().parent().fadeOut()
											.remove();
								}, 1000)
					}
					
					$(".quant-request").fadeOut(500).text();
					$(".quant-request").fadeIn(500).text($(".quant-request").text() - quantTrash);

					var total = 0;

					$(".total-pedido-3").each(function() {
						var valor = parseFloat($(this).text());
						total += valor;
					})
					$(".total-request").fadeOut(500).text(total.toFixed(2))
					$(".total-request").fadeIn(500).text(total.toFixed(2));
					
					if($(".quant-request").text() == 0){
						$(".drop-page").fadeOut();
						$(".empty-car-user").css("display","flex");
					}
				}
			})

		})

$(".icon-refresh").click(function() {
	var quantidade = $(".quant-trash").val();
})

$(".button-fin").click(function() {
	if ($(".input-cep1").val() < 8) {
		$(".button-fin").attr('disabled', 'disabled');
		$(".warn-cep").addClass("car-fix");
	}

})

$(".cep-ok").click(function() {
	if ($(".input-cep1").val().length >= 8) {
		$(".button-fin").removeAttr("disabled", 'disabled');
		$(".warn-cep").addClass("car-fix1");
		$(".input-cep1").mask("99999-999");
		$(".button-fin").addClass("btn-conti");
	}

	if ($(".input-cep1").val().length <= 8) {
		$(".button-fin").attr('disabled', 'disabled');
		$(".button-fin").css({"transition" : "1s"}).removeClass("btn-conti");
	}
});

$(".button-fin").click(function() {
	if($(".name-user").text() == "" && $(".input-cep1").val().length >= 8){
		$(".drop-user").removeClass("car-fix");
		$(".login").addClass("show-login");
		$(".block-page").addClass("show-login");
		$('html,body').animate({scrollTop: 0},'slow');
	}
	
	if($(".name-user").length > 0 && $(".input-cep1").val().length >=8) {
		$(location).attr('href', "/rprvidros/confirmacao");
	}
})


$(".account-user").click(function() {
	if($(".name-user").text() == "") {
		$(".login").addClass("show-login");
		$(".block-page").addClass("show-login");
	}
	
	else{
		$(location).attr('href', "/rprvidros/MinhaConta");
	}
})

$(".request-user-link").click(function() {
	if($(".name-user").text() == "") {
		$(".login").addClass("show-login");
		$(".block-page").addClass("show-login");
	}
	
	else{
		$(location).attr('href', "/rprvidros/meusPedidos");
	}
})

$(".compar-password").on("input",function() {
	var novaSenha = $(".new-password").val();
	var confimaSenha = $(".compar-password").val();
	var comparavel = novaSenha.substr(0,confimaSenha.length);
	if(confimaSenha == comparavel){
		$(".compar-password").addClass("writhe-password");
		$(".compar-password").removeClass("wrong-password");
		$(".edit-account-password").prop('disabled', false);
	}
	else{
		$(".compar-password").addClass("wrong-password");
		$(".compar-password").removeClass("writhe-password");
		$(".edit-account-password").prop('disabled', true);
	}
})

$(".style-button-request").on("click", function() {
	$(this).parent().parent().parent().toggleClass("height-toggle").css({"transition" : ".2s"}).find($(".container-img-status")).toggleClass("img-status-toggle");
	$(this).parent().parent().parent().toggleClass("img-status-toggle").css({"transition" : ".2s"});
	
	if($(this).text() == "Pedido gerado"){
		$(this).parent().parent().parent().find($(".img-status")).attr("src", "/rprvidros/resources/imagens/imagensStatus/PedidoGerado.png");
	}
	
	if($(this).text() == "Pagamento Autorizado"){
		$(this).parent().parent().parent().find($(".img-status")).attr("src", "/rprvidros/resources/imagens/imagensStatus/PagamentoAutorizado.png");
	}
	
	if($(this).text() == "Separacao"){
		$(this).parent().parent().parent().find($(".img-status")).attr("src", "/rprvidros/resources/imagens/imagensStatus/Separacao.png");
	}
	
	if($(this).text() == "Transporte"){
		$(this).parent().parent().parent().find($(".img-status")).attr("src", "/rprvidros/resources/imagens/imagensStatus/transporte.png");
	}
	
	if($(this).text() == "Entregue"){
		$(this).parent().parent().parent().find($(".img-status")).attr("src", "/rprvidros/resources/imagens/imagensStatus/entregue.png");
	}
});	