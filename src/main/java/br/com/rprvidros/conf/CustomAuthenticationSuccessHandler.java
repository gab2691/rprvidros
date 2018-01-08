package br.com.rprvidros.conf;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import br.com.rprvidros.models.Pedido;
import br.com.rprvidros.models.PedidoItem;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse resp, Authentication auth)
			throws IOException, ServletException {

		Pedido pedido = (Pedido) req.getSession().getAttribute("pedido");
		Collection<PedidoItem> itens = pedido.getItens();

		if ("true".equals(req.getHeader("login-ajax"))) {
			resp.getWriter().print("ok");
		}
	}

}
