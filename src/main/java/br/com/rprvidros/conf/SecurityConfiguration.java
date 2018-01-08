package br.com.rprvidros.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import br.com.rprvidros.daos.UsuarioDao;

@EnableWebMvcSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{
	
	@Autowired
	private UsuarioDao dao;
	
	@Autowired
	CustomAuthenticationSuccessHandler customAuthenticationSuccessHandler;
	
	@Autowired
	CustomAuthenticationFailureHandler customAuthenticationFailureHandler; 
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
	    http.authorizeRequests()
	    .antMatchers("/").permitAll()
	    .antMatchers("/cadastro**").permitAll()
	    .antMatchers("/add/**").permitAll()
	    .antMatchers("/listaProdutos**").permitAll()
	    .antMatchers("/listaProdutos/**").permitAll()
	    .antMatchers("/categoriaAjax/**").permitAll()
	    .antMatchers("/busca").permitAll()
	    .antMatchers("/infor-frete/**").permitAll()
	    .antMatchers("/carr-details/**").permitAll()
	    .antMatchers("/carUserListener/**").permitAll()
	    .antMatchers("/carUserListener**").permitAll()
		.antMatchers("/categoria/**").permitAll()
		.antMatchers("/product/**").permitAll()
		.antMatchers("/nossaLoja").permitAll()
		.antMatchers("/clientes").permitAll()
		.antMatchers("/pagSeguro").permitAll()
		.antMatchers("/Ferramentas").permitAll()
		.antMatchers("/pagamento").permitAll()
		.antMatchers("/finaliza").permitAll()
		.antMatchers("/detalhe**").permitAll()
		.antMatchers("/frete**").permitAll()
		.antMatchers("/carrinho/add").permitAll()
		.antMatchers("/adicionaUsuario/add**").permitAll()
		.antMatchers("/carrinho/detalhe**").permitAll()
		.antMatchers("/carrinho/remover**").permitAll()
		.antMatchers("/carrinho/atualizaQuantidade**").permitAll()
		.antMatchers("/orcamentos/**").permitAll()
		.antMatchers("/rprvidros/**").permitAll()
		.antMatchers("/erro/**").permitAll()
		.antMatchers("/login").permitAll()
	    .anyRequest().authenticated()
	    .and().formLogin().loginPage("/login").successHandler(customAuthenticationSuccessHandler)
	    .failureHandler(customAuthenticationFailureHandler);
	    
	}
	
	@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/resources/**");
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(dao).passwordEncoder(new BCryptPasswordEncoder());
		
	}

	
}
