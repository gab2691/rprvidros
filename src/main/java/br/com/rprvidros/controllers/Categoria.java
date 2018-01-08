package br.com.rprvidros.controllers;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.rprvidros.daos.ProdutoDao;
import br.com.rprvidros.models.Pedido;
import br.com.rprvidros.models.PedidoItem;
import br.com.rprvidros.models.Produtos;

@Controller
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class Categoria {

	@Autowired
	private ProdutoDao dao;	
	
	@Autowired
	private Pedido pedido;
	
	@RequestMapping("/categoria")
	public ModelAndView categoria(String categoria){
		ModelAndView modelAndView = new ModelAndView("/categoria");
		List<Produtos> produtos = dao.produtosCategoria(categoria);
		Collection<PedidoItem> itens = pedido.getItens();
		modelAndView.addObject("pedidoItem", itens);
		return modelAndView.addObject("produto", produtos);
	}

	@RequestMapping("/product")
	public ModelAndView produtos(Integer id){
		ModelAndView modelAndView = new ModelAndView("/produto");
		Produtos produto = dao.find(id);
		modelAndView.addObject("produto", produto);
		
		return modelAndView;
		
	}
	
}
