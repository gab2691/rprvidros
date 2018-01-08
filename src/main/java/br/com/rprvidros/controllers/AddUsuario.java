package br.com.rprvidros.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;

import br.com.rprvidros.daos.EnderecoDao;
import br.com.rprvidros.daos.UsuarioDao;
import br.com.rprvidros.models.Endereco;
import br.com.rprvidros.models.Pedido;
import br.com.rprvidros.models.Usuario;

@Controller
@RequestMapping("/adicionaUsuario")
@Transactional
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class AddUsuario {
	

	@Autowired
	private EnderecoDao eDao;
	
	@Autowired
	private UsuarioDao dao;
	
	@Autowired
	private Pedido pedido;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
    public ModelAndView add(Usuario usuario, Endereco endereco){

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encode = passwordEncoder.encode(usuario.getSenha());
        usuario.setSenha(encode);
        
        usuario.setRoles("ROLE_USUARIO");
        
        String telefone = usuario.getTelefone().replaceAll("[()-]" , "");
        
        usuario.setTelefone(telefone);
        
        System.out.println(telefone);
        Usuario usuarioCadastrado = dao.addUsuario(usuario);

        endereco.setUsuario(usuarioCadastrado);
        String uf = endereco.getUf().toUpperCase();
        endereco.setUf(uf);
        eDao.addEndereco(endereco);
        
        
        if(this.pedido.getItens().isEmpty()){
        	
        	 return new ModelAndView("rprvidros");
        }
        
    	ModelAndView modelAndView = new ModelAndView("/login");
        
        return modelAndView;
    }
}
