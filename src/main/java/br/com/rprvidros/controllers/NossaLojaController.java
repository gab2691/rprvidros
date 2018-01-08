package br.com.rprvidros.controllers;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.rprvidros.models.Pedido;
import br.com.rprvidros.models.PedidoItem;

@Controller
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class NossaLojaController {

	@Autowired
	private Pedido pedido;

	
	@RequestMapping("/nossaLoja")
	public ModelAndView nossaLoja(){
		Collection<PedidoItem> itens = pedido.getItens();
		ModelAndView modelAndView = new ModelAndView("/nossaLoja");
		modelAndView.addObject("pedidoItem", itens);
		
		return modelAndView;
		
	}
}
