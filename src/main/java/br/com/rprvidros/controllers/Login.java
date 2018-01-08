package br.com.rprvidros.controllers;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.rprvidros.models.Pedido;
import br.com.rprvidros.models.PedidoItem;

@Controller
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class Login {

	@Autowired
	private Pedido pedido;
	
		
	@RequestMapping(value ="/login", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest req){
		req.getSession().setAttribute("pedido", pedido);
		ModelAndView modelAndView = new ModelAndView("/login");
		Collection<PedidoItem> itens = pedido.getItens();
		modelAndView.addObject("pedidoItem", itens);
		
		return modelAndView;
	}
}
