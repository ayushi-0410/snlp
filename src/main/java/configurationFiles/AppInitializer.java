package configurationFiles;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRegistration;

import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.servlet.DispatcherServlet;

import jakarta.servlet.FilterRegistration;
import jakarta.servlet.MultipartConfigElement;

import org.springframework.orm.hibernate5.support.OpenSessionInViewFilter;
import org.springframework.web.filter.DelegatingFilterProxy;

public class AppInitializer implements WebApplicationInitializer {

	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		// TODO Auto-generated method stub
		AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
		rootContext.register(AppConfig.class, SecurityConfig.class);

		servletContext.addListener(new ContextLoaderListener(rootContext));

		// Dispatcher servlet
		AnnotationConfigWebApplicationContext dispatcherContext = new AnnotationConfigWebApplicationContext();
		dispatcherContext.register(WebMvcConfig.class);

		ServletRegistration.Dynamic dispatcher = servletContext.addServlet("dispatcher",
				new DispatcherServlet(dispatcherContext));
		dispatcher.setLoadOnStartup(1);
		dispatcher.addMapping("/");

		// Multipart config
		dispatcher.setMultipartConfig(new MultipartConfigElement(null, 834422000, 834422000, 1048576));

		// Hibernate filter
		FilterRegistration.Dynamic hibernateFilter = servletContext.addFilter("hibernateFilter",
				new OpenSessionInViewFilter());
		hibernateFilter.setInitParameter("sessionFactoryBeanName", "sessionFactory");
		hibernateFilter.addMappingForUrlPatterns(null, false, "/*");

		// Spring Security filter
		FilterRegistration.Dynamic securityFilter = servletContext.addFilter("springSecurityFilterChain",
				new DelegatingFilterProxy());
		securityFilter.addMappingForUrlPatterns(null, false, "/*");

	}

}
