package br.com.rprvidros.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.rprvidros.models.Endereco;
import br.com.rprvidros.models.Usuario;

@Repository
public class EnderecoDao {
	
	@PersistenceContext
	private EntityManager manager;
	
	
	
	public void addEndereco(Endereco endereco){
		manager.persist(endereco);
		
	}
	
	public Endereco buscaEnderecoPorId(Usuario usuario){
		return  (Endereco) manager.createQuery("select e from Endereco e where e.usuario.id = :id").setParameter("id", usuario.getId()).getSingleResult();
		
	}
	
	public Endereco updateEndereco(Endereco endereco){
		Endereco endereco2 = (Endereco) manager.createQuery("select e from Endereco e where e.id = :id").setParameter("id", endereco.getId()).getSingleResult();
		
		endereco2.setCep(endereco.getCep());
		endereco2.setCidade(endereco.getCidade());
		endereco2.setComplemento(endereco.getComplemento());
		endereco2.setLogradouro(endereco.getLogradouro());
		endereco2.setNumero(endereco.getNumero());
		endereco2.setUf(endereco.getUf());
		
		Endereco merge = manager.merge(endereco2);
		
		return merge;
		
	}
}
