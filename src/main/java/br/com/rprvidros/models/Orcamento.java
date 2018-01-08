package br.com.rprvidros.models;

import org.springframework.stereotype.Component;

@Component
public class Orcamento {

	
	private String nome;
	private String email;
	private String telefone;
	private String mensagem;
	
	
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getMensagem() {
		return mensagem;
	}
	public void setMensagem(String mensagem) {
		this.mensagem = mensagem;
	}
	
	@Override
	public String toString() {
		return "Orcamento [nome=" + nome + ", email=" + email + ", telefone=" + telefone + ", mensagem=" + mensagem
				+ "]";
	}
}	