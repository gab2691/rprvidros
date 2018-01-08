package br.com.rprvidros.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.rprvidros.models.Pedido;

@Repository
public class PedidoDao {

	@PersistenceContext
	private EntityManager manager;
	
	
	public Pedido pedidoAdd(Pedido pedido){
		 manager.persist(pedido);
		 
		 return pedido;
	}
	
	public List<Pedido> userPedido(Integer id){
		 List <Pedido> pedidos = manager.createQuery("select p from Pedido p where p.usuario.id = :id").setParameter("id", id).getResultList();
		
		 return pedidos;
	}
	
	public Pedido pedidoId(Integer id){
		return (Pedido) manager.createQuery("select p from Pedido p where p.id = :id").setParameter("id", id).getSingleResult();
		
	}
}
