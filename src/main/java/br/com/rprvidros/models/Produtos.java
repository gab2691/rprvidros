package br.com.rprvidros.models;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Produtos {
	
	
	@Id @GeneratedValue(strategy=GenerationType.AUTO)
	private Integer id;
	private String descricao;
	private String cor;
	private String codigo_alternativo;
	private Integer estoque_minimo;
	private Integer estoque_maximo;
	private String path;
	private BigDecimal preco;
	
	@Override
	public String toString() {
		return "Produtos [id=" + id + ", descricao=" + descricao + ", cor=" + cor + ", codigo_alternativo="
				+ codigo_alternativo + ", estoque_minimo=" + estoque_minimo + ", estoque_maximo=" + estoque_maximo
				+ ", path=" + path + ", preco=" + preco + ", categoria=" + categoria + "]";
	}
	@ManyToOne
	private Categoria categoria;
	
	
	
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getCor() {
		return cor;
	}
	public void setCor(String cor) {
		this.cor = cor;
	}
	public String getCodigo_alternativo() {
		return codigo_alternativo;
	}
	public void setCodigo_alternativo(String codigo_alternativo) {
		this.codigo_alternativo = codigo_alternativo;
	}
	public Integer getEstoque_minimo() {
		return estoque_minimo;
	}
	public void setEstoque_minimo(Integer estoque_minimo) {
		this.estoque_minimo = estoque_minimo;
	}
	public Integer getEstoque_maximo() {
		return estoque_maximo;
	}
	public void setEstoque_maximo(Integer estoque_maximo) {
		this.estoque_maximo = estoque_maximo;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public BigDecimal getPreco() {
		return preco;
	}
	public void setPreco(BigDecimal preco) {
		this.preco = preco;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Produtos other = (Produtos) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
	
	
	
	
	
}
