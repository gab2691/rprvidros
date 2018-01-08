package br.com.rprvidros.controllers;

import java.util.Calendar;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.rprvidros.daos.EnderecoDao;
import br.com.rprvidros.daos.PedidoDao;
import br.com.rprvidros.daos.PedidoItemDao;
import br.com.rprvidros.models.Endereco;
import br.com.rprvidros.models.Pedido;
import br.com.rprvidros.models.PedidoItem;
import br.com.rprvidros.models.Usuario;
import br.com.uol.pagseguro.domain.AccountCredentials;
import br.com.uol.pagseguro.domain.Item;
import br.com.uol.pagseguro.domain.PaymentRequest;
import br.com.uol.pagseguro.enums.Currency;
import br.com.uol.pagseguro.enums.ShippingType;
import br.com.uol.pagseguro.exception.PagSeguroServiceException;

@Controller
@Transactional
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class PagSeguroController {

	@Autowired
	private Pedido pedido;
	
	@Autowired
	private EnderecoDao eDao;
	
	@Autowired
	private PedidoDao pDao;
	
	@Autowired
	private PedidoItemDao itemDao;
	
	@RequestMapping(value = "/pagSeguro")
	public ModelAndView pagSeguro(@AuthenticationPrincipal Usuario usuario, Endereco endereco,HttpServletRequest req) throws PagSeguroServiceException {
			
			AccountCredentials credentials;
			
			credentials = new AccountCredentials("rprridrosc@gmail.com","E9A97618DB25484F8A0EC36F805C3984");
			
			
			PaymentRequest paymentRequest = new PaymentRequest();
			paymentRequest.setReference("RPR01");
			paymentRequest.setCurrency(Currency.BRL);
			paymentRequest.setSender(usuario.getNome(), usuario.getEmail(),null);
			
			List<Item> items = new LinkedList<>();
			Item item = new Item();
			
			Collection<PedidoItem> itens = this.pedido.getItens();
			for (PedidoItem pedidoItem : itens) {
				
				Integer id = pedidoItem.getProduto().getId();
				String stringId = Integer.toString(id);
				item.setId(stringId);
				
				item.setDescription(pedidoItem.getProduto().getDescricao());
				item.setQuantity(pedidoItem.getQuantidade());
				item.setWeight(new Long(3));
				item.setAmount(pedidoItem.getValorItem());
				items.add(item);
			}
			
			paymentRequest.setItems(items);
			
 			Endereco enderecoPorId = eDao.buscaEnderecoPorId(usuario);
			
			paymentRequest.setShipping(ShippingType.SEDEX, "BRASIL", "SP", enderecoPorId.getCidade(), null, enderecoPorId.getCep(), 
					enderecoPorId.getLogradouro(), enderecoPorId.getNumero(), enderecoPorId.getComplemento(),pedido.getTotalFrete());
			
			
			
			//finalização e persistencia do pedido
			pedido.setUsuario(usuario);
			Date time = Calendar.getInstance().getTime();
			pedido.setData_pedido(time);
			pedido.setStatus("Pedido gerado");
			pedido.setPagamento("PAG-SEGURO");
			pedido.setId(null);
			Pedido pedidoAdd = pDao.pedidoAdd(pedido);
			
			for (PedidoItem pedidoItem : itens) {
				pedidoItem.setPedido(pedidoAdd);
				pedidoItem.setProduto(pedidoItem.getProduto());
				pedido.add(pedidoItem);
				itemDao.addPI(pedidoItem);
				
			}
			
			itens.removeAll(itens);
			return new ModelAndView("redirect:" + paymentRequest.register(credentials));
	}

}
