package br.com.rprvidros.controllers;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.rprvidros.daos.CategoriaDao;
import br.com.rprvidros.models.Categoria;
import br.com.rprvidros.models.Pedido;
import br.com.rprvidros.models.PedidoItem;

@Controller
@Transactional
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class AjaxRequest {
	
	
	@Autowired
	private CategoriaDao cDao;
	
	@Autowired
	private Pedido pedido;

	@RequestMapping(value="/carUserListener", method = RequestMethod.GET)
	public ModelAndView carUser(){
		List<Categoria> listCategoria = cDao.ListCategoria();
		ModelAndView modelAndView = new ModelAndView("/car-user-event");
		modelAndView.addObject("categoria",listCategoria);
		Collection<PedidoItem> itens = pedido.getItens();
		modelAndView.addObject("pedidoItem", itens);
		return modelAndView;
	}
	
	@RequestMapping(value = "/categoriaAjax", method = RequestMethod.GET)
	public ModelAndView catAjax(){
		List<Categoria> listCategoria = cDao.ListCategoria();
		ModelAndView modelAndView = new ModelAndView("/listaProdutos");
		modelAndView.addObject("categoria",listCategoria);
		return modelAndView;
	}
}
