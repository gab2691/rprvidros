package br.com.rprvidros.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Pagamento {
	
	@RequestMapping("/pagamento")
	public ModelAndView pagamento(){
		
		return new ModelAndView("/pagamento");
		
		
	}
}
