package br.com.rprvidros.controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.rprvidros.daos.EnderecoDao;
import br.com.rprvidros.models.Endereco;
import br.com.rprvidros.models.Pedido;
import br.com.rprvidros.models.PedidoItem;
import br.com.rprvidros.models.Usuario;

@Controller
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class ConfirmacaoController {
	
	@Autowired
	private Pedido pedido;
	
	@Autowired
	private EnderecoDao eDao;
	
	@RequestMapping("/confirmacao")
	public ModelAndView confirmacao(@AuthenticationPrincipal Usuario usuario){
		
		Endereco end = eDao.buscaEnderecoPorId(usuario);
		ModelAndView modelAndView = new ModelAndView("/confirmacao");
		modelAndView.addObject("end", end);
		Collection<PedidoItem> itens = pedido.getItens();
		modelAndView.addObject("itens", itens);
		return modelAndView;
	}
}
