package br.com.rprvidros.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.rprvidros.models.Orcamento;

@Controller
public class OrcamentoController {

	
	@Autowired
	private MailSender sender;
	
	
    @RequestMapping("/orcamentos")
    public ModelAndView orcamento(Orcamento orcamento) {
        SimpleMailMessage email = new SimpleMailMessage();
        email.setSubject("Requisição de Orçamento");
        email.setTo("gabriel_bartholo_batista@hotmail.com");
        email.setText(orcamento.getMensagem());
        email.setFrom(orcamento.getEmail());
        
        sender.send(email);
        return new ModelAndView("redirect:/");
    }

}
