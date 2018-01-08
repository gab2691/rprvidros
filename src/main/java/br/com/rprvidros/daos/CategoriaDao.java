package br.com.rprvidros.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.rprvidros.models.Categoria;

@Repository
public class CategoriaDao {

	@PersistenceContext
	private EntityManager manager;
	
	
	public List<Categoria> ListCategoria(){
		
		List<Categoria> categorias = manager.createQuery("select c from Categoria c").getResultList();
		
		return categorias;
		
	}
	
}
