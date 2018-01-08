package br.com.rprvidros.controllers;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
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
@Cacheable(value="Home")
public class HomeController {
	
	@Autowired
	private CategoriaDao cDao;
	
	@Autowired
	private Pedido pedido;

	@RequestMapping("/")
	public ModelAndView index(){
		List<Categoria> listCategoria = cDao.ListCategoria();
		ModelAndView modelAndView = new ModelAndView("/rprvidros");
		modelAndView.addObject("categoria",listCategoria);
		Collection<PedidoItem> itens = pedido.getItens();
		modelAndView.addObject("pedidoItem", itens);
		return modelAndView;
	}
	
}
