package br.com.rprvidros.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;

import br.com.rprvidros.models.Usuario;

@Repository
public class UsuarioDao implements UserDetailsService {

	@PersistenceContext
	private EntityManager manager;

	@Override
	public UserDetails loadUserByUsername(String email) {
        List<Usuario> usuarios = manager.createQuery("select u from Usuario u where u.email = :email", Usuario.class)
                .setParameter("email", email).getResultList();
        if (usuarios.isEmpty()) {
            throw new UsernameNotFoundException("O usuário " + email + " não foi encontrado");
        }

        return usuarios.get(0);
    }

	public Usuario addUsuario(Usuario usuario) {

		manager.persist(usuario);

		return usuario;
	}

	public Usuario alteraUsuario(Integer id,Usuario usuario){
		Usuario usuarios = manager.createQuery("select u from Usuario u where u.id = :id", Usuario.class).setParameter("id", id).getSingleResult();
		usuarios.setNome(usuario.getNome());
		usuarios.setEmail(usuario.getEmail());
		
		
		String telefone = usuario.getTelefone().replaceAll("[()-]" , "");
        usuarios.setTelefone(telefone);
        
		Usuario merge = manager.merge(usuarios);
		
		return merge;
	}
	
	public Usuario buscaUsuario(Integer id){
		return (Usuario) manager.createQuery("select u from Usuario u where u.id = :id").setParameter("id", id).getSingleResult();
	}
	
	public Usuario atualizaSenha(Integer id, String senha){
		Usuario usuario = (Usuario) manager.createQuery("select u from Usuario u where u.id = :id").setParameter("id", id).getSingleResult();
		
		usuario.setSenha(senha);
		
		return usuario;
	}
	
}