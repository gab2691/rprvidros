package br.com.rprvidros.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.rprvidros.models.Produtos;

@Repository
public class ProdutoDao {

	@PersistenceContext
	private EntityManager manager;



	public List<Produtos> produtosCategoria(String categoria){
		return manager.createQuery("select p from Produtos p where p.categoria.nome = " + categoria).getResultList();
		
	}

	public List<Produtos> buscaProduto(String busca) {
		return manager.createQuery("select p from Produtos p where p.descricao like " + "'" + "%"+busca+"%" + "'").getResultList();
	}
	
	public Produtos find(Integer id){
		return (Produtos) manager.createQuery("select p from Produtos p where p.id = " + id).getSingleResult();
	}
	
	
}
