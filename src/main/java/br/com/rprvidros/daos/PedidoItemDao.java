package br.com.rprvidros.daos;

import java.util.List;

import javax.persistence.EntityManager;

import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.rprvidros.models.PedidoItem;

@Repository
public class PedidoItemDao {
	
	@PersistenceContext
	private EntityManager manager;
	
	
	public PedidoItem addPI(PedidoItem item){
		manager.persist(item);
		return item;
	}
	
	public List<PedidoItem> pedidoItemId(Integer id){
		List<PedidoItem> pedidoItens = manager.createQuery("select p from PedidoItem p where p.pedido.id = :id ").setParameter("id", id).getResultList();
		
		return pedidoItens;
		
	}
	
}
