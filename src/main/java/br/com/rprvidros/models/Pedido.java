package br.com.rprvidros.models;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Entity
@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION)
public class Pedido {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Temporal(TemporalType.DATE)
	private Date data_pedido;
	private String status;
	private String pagamento;
	private BigDecimal frete;

	@ManyToOne
	@JoinColumn(name = "usuario_id")
	private Usuario usuario;

	@OneToMany(fetch = FetchType.EAGER, mappedBy = "pedido", targetEntity = PedidoItem.class)
	private List<PedidoItem> itens = new ArrayList<PedidoItem>();

	@Override
	public String toString() {
		return "Pedido [id=" + id + ", data_pedido=" + data_pedido + ", status=" + status + ", pagamento=" + pagamento
				+ ", usuario=" + getUsuario() + ", itens=" + itens + "]";
	}

	public PedidoItem add(PedidoItem item) {
		for (PedidoItem pedidoItem : itens) {
			if (pedidoItem.equals(item)) {
				pedidoItem.setQuantidade(pedidoItem.getQuantidade() + item.getQuantidade());
				return item;
			}
		}
		itens.add(item);
		return item;
	}

	public Integer getQuantidade(PedidoItem item) {
		for (PedidoItem pedidoItem : itens) {
			if (item.equals(itens)) {
				return item.getQuantidade();
			}
		}
		return item.getQuantidade();
	}

	public BigDecimal getTotalItem(PedidoItem item) {
		Integer quantidade = this.getQuantidade(item);
		BigDecimal quantidadeTotal = new BigDecimal(quantidade);
		BigDecimal preco = item.getProduto().getPreco();
		return quantidadeTotal.multiply(preco);

	}

	public BigDecimal getTotal() {
		BigDecimal total = BigDecimal.ZERO;
		for (PedidoItem item : itens) {
			total = total.add(getTotalItem(item));
		}

		return total;
	}

	public BigDecimal getTotalFrete() {
		BigDecimal total = this.getTotal();
		total = total.add(this.getFrete());
		System.out.println();
		return total;

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getPagamento() {
		return pagamento;
	}

	public void setPagamento(String pagamento) {
		this.pagamento = pagamento;
	}

	public Date getData_pedido() {
		return data_pedido;
	}

	public void setData_pedido(Date time) {
		this.data_pedido = time;
	}

	public Collection<PedidoItem> getItens() {
		return itens;
	}

	public int getQuantidade() {
		Integer quantidadeTotal = 0;
		for (PedidoItem pedidoItem : itens) {

			Integer quantidade2 = pedidoItem.getQuantidade();
			quantidadeTotal = quantidadeTotal + quantidade2;
		}
		return quantidadeTotal;

	}

	public void remover(PedidoItem item) {
		for (Iterator<PedidoItem> i = itens.iterator(); i.hasNext();) {
			PedidoItem pedidoItem = i.next();

			if (item.getProduto().getId().equals(pedidoItem.getProduto().getId()) && item.getQuantidade().equals(pedidoItem.getQuantidade())) {
				i.remove();
			}
			
			if (item.getProduto().getId().equals(pedidoItem.getProduto().getId()) && item.getQuantidade() > (pedidoItem.getQuantidade())) {
				i.remove();
			}

			if (item.getProduto().getId().equals(pedidoItem.getProduto().getId()) && item.getQuantidade() < pedidoItem.getQuantidade()) {
				int quantidadeTotal = pedidoItem.getQuantidade() - item.getQuantidade();
				pedidoItem.setQuantidade(quantidadeTotal);
			}

		}
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public BigDecimal getFrete() {
		return frete;
	}

	public void setFrete(BigDecimal frete) {
		this.frete = frete;
	}
}
