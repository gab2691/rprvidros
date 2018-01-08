package br.com.rprvidros.models;

public class AtualizaSenha {
	
	@Override
	public String toString() {
		return "AtualizaSenha [senha=" + senha + ", senhaNova=" + senhaNova + ", confirmSenha=" + confirmSenha + "]";
	}

	private String senha;
	private String senhaNova;
	private String confirmSenha;

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getSenhaNova() {
		return senhaNova;
	}

	public void setSenhaNova(String senhaNova) {
		this.senhaNova = senhaNova;
	}

	public String getConfirmSenha() {
		return confirmSenha;
	}

	public void setConfirmSenha(String confirmSenha) {
		this.confirmSenha = confirmSenha;
	}
	
}
