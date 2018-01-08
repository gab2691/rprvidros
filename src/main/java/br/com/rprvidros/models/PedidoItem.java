package br.com.rprvidros.models;

import java.math.BigDecimal;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class PedidoItem {

	
	public PedidoItem(Produtos produto) {
		this.produto = produto;
	}
	
	public PedidoItem() {
	}
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;

	private int quantidade;
	
	@Override
	public String toString() {
		return "PedidoItem [id=" + id + ", quantidade=" + quantidade + ", produto=" + produto + ", pedido=" + pedido
				+ "]";
	}

	@OneToOne
	private Produtos produto;

	@ManyToOne
	@JoinColumn(name = "pedido_id")
	private Pedido pedido;

	public Produtos getProduto() {
		return produto;
	}

	public void setProduto(Produtos produto) {
		this.produto = produto;
	}

	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Pedido getPedido() {
		return pedido;
	}

	public void setPedido(Pedido pedido) {
		this.pedido = pedido;
	}
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		result = prime * result + ((pedido == null) ? 0 : pedido.hashCode());
		result = prime * result + ((produto == null) ? 0 : produto.hashCode());
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
		PedidoItem other = (PedidoItem) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		if (pedido == null) {
			if (other.pedido != null)
				return false;
		} else if (!pedido.equals(other.pedido))
			return false;
		if (produto == null) {
			if (other.produto != null)
				return false;
		} else if (!produto.equals(other.produto))
			return false;
		return true;
	}

	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}
	
	public BigDecimal getValorItem(){
		Integer quantItem = this.getQuantidade();
		BigDecimal preco = this.produto.getPreco();
		int i = quantItem.intValue();
		BigDecimal quantItemBigD = new BigDecimal(i);
		preco = preco.multiply(quantItemBigD);
		
		return preco;
	}

}
