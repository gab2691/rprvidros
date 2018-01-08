package br.com.rprvidros.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.rprvidros.daos.ProdutoDao;
import br.com.rprvidros.models.Produtos;

@Controller
public class Busca {
	
	@Autowired
	private ProdutoDao dao;
	
	@RequestMapping("/busca")
	public ModelAndView buscaProduto(String busca){
		ModelAndView modelAndView = new ModelAndView("busca");
		List<Produtos> produtos = dao.buscaProduto(busca);
		return modelAndView.addObject("produto", produtos);
	}
}
