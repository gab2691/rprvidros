package br.com.rprvidros.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.com.rprvidros.daos.ProdutoDao;

@Controller
@RequestMapping("/produtos")
public class ProdutoController {

	@Autowired
	private ProdutoDao dao;	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listar(){
		ModelAndView modelAndView = new ModelAndView("listar");
		return modelAndView;
	}
	
	
	
	
}
