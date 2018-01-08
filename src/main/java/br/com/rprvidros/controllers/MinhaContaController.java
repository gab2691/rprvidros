package br.com.rprvidros.controllers;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.rprvidros.daos.EnderecoDao;
import br.com.rprvidros.daos.PedidoDao;
import br.com.rprvidros.daos.UsuarioDao;
import br.com.rprvidros.models.AtualizaSenha;
import br.com.rprvidros.models.Endereco;
import br.com.rprvidros.models.Pedido;
import br.com.rprvidros.models.PedidoItem;
import br.com.rprvidros.models.Usuario;

@Controller
@Transactional
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class MinhaContaController {
	
	
	@Autowired
	private UsuarioDao dao;
	
	@Autowired
	private PedidoDao pDao;
	
	@Autowired
	private EnderecoDao eDao;
	
	@RequestMapping("/MinhaConta")
	public ModelAndView minhaConta(@AuthenticationPrincipal Usuario usuario){
		
		ModelAndView modelAndView = new ModelAndView("/MinhaConta");
		Usuario buscaUsuario = dao.buscaUsuario(usuario.getId());
		modelAndView.addObject("usuario", buscaUsuario);
		return modelAndView;
	}
	
	@RequestMapping("/editarDados")
	public ModelAndView editarDados(@AuthenticationPrincipal Usuario usuario){
		
		ModelAndView modelAndView = new ModelAndView("/editarDados");
		Usuario buscaUsuario = dao.buscaUsuario(usuario.getId());
		modelAndView.addObject("usuario", buscaUsuario);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/alterarDados", method = RequestMethod.POST)
	public ModelAndView alteraDados(@AuthenticationPrincipal Usuario usuario1, Usuario usuario ){
		ModelAndView modelAndView = new ModelAndView("/rprvidros");
		
		
		Usuario alteraUsuario = dao.alteraUsuario(usuario1.getId(), usuario);
		
		modelAndView.addObject("usuario", alteraUsuario);
		return modelAndView;
		
	}
	
	@RequestMapping("/meusPedidos")
	public ModelAndView meusPedidos(@AuthenticationPrincipal Usuario usuario){
		ModelAndView modelAndView = new ModelAndView("/meusPedidos");
		List<Pedido> pedidos = pDao.userPedido(usuario.getId());
		modelAndView.addObject("pedidos", pedidos);
		return modelAndView;
				
	}
	
	
	@RequestMapping("/detalhesPedido")
	public ModelAndView detalhesPedido(Integer pedidoId){
		ModelAndView modelAndView = new ModelAndView("/detalhePedido");
		Pedido pedido = pDao.pedidoId(pedidoId);
		modelAndView.addObject("pedidos", pedido);
		
		Usuario usuario = dao.buscaUsuario(pedido.getUsuario().getId());
		modelAndView.addObject("usuario", usuario);
		
		Endereco endereco = eDao.buscaEnderecoPorId(usuario);
		modelAndView.addObject("endereco", endereco);
		
		Collection<PedidoItem> itens = pedido.getItens();
		modelAndView.addObject("pedidoitem", itens);
		
		return modelAndView;
		
	}
	
	@RequestMapping("/meuEndereco")
	public ModelAndView meuEndereco(@AuthenticationPrincipal Usuario usuario){
		ModelAndView modelAndView = new ModelAndView("/meuEndereco");
		Endereco endereco = eDao.buscaEnderecoPorId(usuario);
		modelAndView.addObject("endereco", endereco);
		modelAndView.addObject("usuario", usuario);
		return modelAndView;
		
	}
	
	@RequestMapping("/editarEndereco")
	public ModelAndView editarEndereco(@AuthenticationPrincipal Usuario usuario){
		ModelAndView modelAndView = new ModelAndView("/editarEndereco");
		Endereco endereco = eDao.buscaEnderecoPorId(usuario);
		modelAndView.addObject("endereco", endereco);
		modelAndView.addObject("usuario", usuario);
		return modelAndView;
		
	}
	
	
	@RequestMapping("/alterarDadosEndereco")
	public ModelAndView alterarDadosEndereco(@AuthenticationPrincipal Usuario usuario, Endereco endereco){
		ModelAndView modelAndView = new ModelAndView("/rprvidros");
		Endereco updateEndereco = eDao.updateEndereco(endereco);
		modelAndView.addObject("endereco", updateEndereco);
		return modelAndView;
		
	}
	
	@RequestMapping("/alteraSenha")
	public ModelAndView alertaSenha(){
		
		ModelAndView modelAndView = new ModelAndView("/alteraSenha");
		
		return modelAndView;
		
	}
	
	@RequestMapping("/editarSenha")
	public ModelAndView editarSenha(@AuthenticationPrincipal Usuario usuario, AtualizaSenha atualizaSenha){
		ModelAndView modelAndView = new ModelAndView("/alteraSenha");
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		boolean matches = encoder.matches(atualizaSenha.getSenha(), usuario.getSenha());
		
		if (matches == true && atualizaSenha.getSenhaNova().equals(atualizaSenha.getConfirmSenha())){
			String senha = encoder.encode(atualizaSenha.getConfirmSenha());
			dao.atualizaSenha(usuario.getId(), senha);
		}
		
		if (matches == true && atualizaSenha.getSenhaNova() != (atualizaSenha.getConfirmSenha())){
			
		}
			
		
			
		return modelAndView;
	}
	
}
