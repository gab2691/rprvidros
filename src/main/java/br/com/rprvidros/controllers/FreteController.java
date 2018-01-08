package br.com.rprvidros.controllers;

import java.math.BigDecimal;
import java.rmi.RemoteException;
import java.util.Collection;

import javax.xml.rpc.ServiceException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.tempuri.CResultado;
import org.tempuri.CServico;
import org.tempuri.CalcPrecoPrazoWSLocator;
import org.tempuri.CalcPrecoPrazoWSSoap;

import br.com.rprvidros.models.Pedido;
import br.com.rprvidros.models.PedidoItem;


@Controller
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class FreteController {

	@Autowired
	private Pedido pedido;
	
	@RequestMapping("/frete")
	public ModelAndView CalculaFrete(String cep) throws RemoteException, ServiceException{
		
		String servico = "40010";
		
		CResultado sedex = this.sedex(cep, servico);
		CResultado pac = this.pac(cep, servico);
		
		CServico[] servicos = sedex.getServicos();
		ModelAndView modelAndView = new ModelAndView("/infor-frete");
		Collection<PedidoItem> itens = pedido.getItens();
		modelAndView.addObject("pedidoItem", itens);
		modelAndView.addObject("frete", servicos);
		
		CServico[] servicosPac = pac.getServicos();
		for (CServico cServico : servicosPac) {
			String valor = cServico.getValor();
			String replace = valor.replace(",", ".");
			BigDecimal frete = new BigDecimal(replace);
			pedido.setFrete(frete);
		}
		modelAndView.addObject("pac", servicosPac);
		
		return modelAndView;
		
	}
	
	public CResultado sedex(String cep, String servico) throws ServiceException, RemoteException{
		CalcPrecoPrazoWSSoap soap =  new CalcPrecoPrazoWSLocator().getCalcPrecoPrazoWSSoap();
		int quantidade = pedido.getQuantidade();
		int peso = (int) (quantidade * 0.07);
		String string = Integer.toString(peso);
		CResultado calcPrecoPrazo = soap.calcPrecoPrazo("09146920", "123456", "40010", "02546-000", cep, string, 1, new BigDecimal(18), new BigDecimal(14), new BigDecimal(11), new BigDecimal(0), "n", new BigDecimal(0), "n");
		return calcPrecoPrazo;
	}
	
	public CResultado pac(String cep, String servico) throws RemoteException, ServiceException {
		CalcPrecoPrazoWSSoap soap =  new CalcPrecoPrazoWSLocator().getCalcPrecoPrazoWSSoap();
		int quantidade = pedido.getQuantidade();
		int peso = (int) (quantidade * 0.07);
		String string = Integer.toString(peso);
		CResultado calcPrecoPrazo = soap.calcPrecoPrazo("09146920", "123456", "41106", "02546-000", cep, string, 1, new BigDecimal(18), new BigDecimal(14), new BigDecimal(11), new BigDecimal(0), "n", new BigDecimal(0), "n");
		
		return calcPrecoPrazo;
	}

	@RequestMapping("/infor-frete")
	public ModelAndView teste(String cep) throws RemoteException, ServiceException{
		CResultado sedex = this.sedex(cep, "40010");
		
		CServico[] servicos = sedex.getServicos();
		ModelAndView modelAndView = new ModelAndView("infor-frete");
		Collection<PedidoItem> itens = pedido.getItens();
		modelAndView.addObject("pedidoItem", itens);
		modelAndView.addObject("frete", servicos);
		
		
		return modelAndView;
		
	}
	
}
