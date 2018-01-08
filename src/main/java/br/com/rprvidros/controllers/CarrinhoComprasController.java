package br.com.rprvidros.controllers;

import java.rmi.RemoteException;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.rprvidros.daos.CategoriaDao;
import br.com.rprvidros.daos.ProdutoDao;
import br.com.rprvidros.models.Categoria;
import br.com.rprvidros.models.Pedido;
import br.com.rprvidros.models.PedidoItem;
import br.com.rprvidros.models.Produtos;

@Controller
@Transactional
@RequestMapping("/carrinho")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoComprasController {

	@Autowired
	private ProdutoDao dao;
	
	@Autowired
	private CategoriaDao cDao;
	
	@Autowired
	private Pedido pedido;
	
	@RequestMapping("/add")
	public ModelAndView add(Integer produtoId, HttpServletRequest req, Integer quantidade) {
		ModelAndView modelAndView = new ModelAndView("redirect:/carrinho/detalhe");
		PedidoItem criaItem = criaItem(produtoId, quantidade);
		pedido.add(criaItem);
		Collection<PedidoItem> itens = pedido.getItens();
		req.getSession().setAttribute("pedido", pedido);
		return modelAndView.addObject("pedidoItem", itens);
		
	}
	
	@RequestMapping(value="/detalhe", method = RequestMethod.GET)
	public ModelAndView detalhe() throws RemoteException{
		ModelAndView modelAndView = new ModelAndView("detalhe");
		Collection<PedidoItem> itens = pedido.getItens();
		List<Categoria> listCategoria = cDao.ListCategoria();
		modelAndView.addObject("categoria",listCategoria);
		return modelAndView.addObject("pedidoItem", itens);
	}
	
	@RequestMapping(value="/remover", method = RequestMethod.GET)
	public ModelAndView remover(Integer produtoId, Integer quantidade){
		PedidoItem item = criaItem(produtoId, quantidade);
		pedido.remover(item);
		return new ModelAndView("/carr-details");
	}

	
	private PedidoItem criaItem(Integer produtoId, Integer quantidade) {
		Produtos produto = dao.find(produtoId);
		PedidoItem pedidoItem = new PedidoItem(produto);
		pedidoItem.setQuantidade(pedidoItem.getQuantidade() + quantidade);
		return pedidoItem;
	}
	
	
	@RequestMapping(value="/atualizaQuantidade", method = RequestMethod.GET)
	private Integer atualizaQuantidade(){
		ModelAndView modelAndView = new ModelAndView();
		Collection<PedidoItem> itens = pedido.getItens();
		int size = itens.size();
		modelAndView.addObject("quantidade", size);
		return size;
	}
	
}

