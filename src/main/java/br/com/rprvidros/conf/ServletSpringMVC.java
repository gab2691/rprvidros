package br.com.rprvidros.conf;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class ServletSpringMVC  extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] {AppWebConfiguration.class,JPAConfiguration.class,SecurityConfiguration.class,CustomAuthenticationSuccessHandler.class,CustomAuthenticationFailureHandler.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] {} ;
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] {"/"};
	}

}
