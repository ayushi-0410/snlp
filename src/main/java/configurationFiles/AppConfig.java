package configurationFiles;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.client.RestTemplate;

import dao.HomeDAOImpl;
import dao.UserDAOImpl;
import service.HomeServiceImpl;
import service.UserServiceImpl;

@Configuration
@EnableTransactionManagement
@PropertySource("classpath:application.properties")
@ComponentScan(basePackages = { "controller", "dao", "service" })
public class AppConfig {
	@Value("${jdbc.url}")
	private String dbUrl;

	@Value("${jdbc.username}")
	private String dbUsername;

	@Value("${jdbc.password}")
	private String dbPassword;

	@Bean
	public HomeDAOImpl homeDao() {
		return new HomeDAOImpl();
	}

	@Bean
	public HomeServiceImpl homeService() {
		return new HomeServiceImpl();
	}

	@Bean
	public UserDAOImpl userDao() {
		return new UserDAOImpl();
	}

	@Bean
	public UserServiceImpl userService() {
		return new UserServiceImpl();
	}

	@Bean
	public RestTemplate restTemplate() {
		return new RestTemplate();
	}

	@Bean
	public DataSource dataSource() {
		BasicDataSource ds = new BasicDataSource();
		ds.setDriverClassName("org.postgresql.Driver");
		ds.setUrl(dbUrl);
		ds.setUsername(dbUsername);
		ds.setPassword(dbPassword);
		ds.setValidationQuery("SELECT 1");
		return ds;
	}

	@Bean
	public LocalSessionFactoryBean sessionFactory() {
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(dataSource());
		sessionFactory.setPackagesToScan("modal");
		Properties props = new Properties();
		props.put("hibernate.dialect", "org.hibernate.dialect.PostgreSQLDialect");
		props.put("hibernate.show_sql", "true");
		props.put("hibernate.format_sql", "true");
		props.put("hibernate.hbm2ddl.auto", "update");
		props.put("hibernate.jdbc.batch_size", "10");
		props.put("hibernate.order_inserts", "true");
		props.put("hibernate.order_updates", "true");
		sessionFactory.setHibernateProperties(props);
		return sessionFactory;
	}

	@Bean
	public PlatformTransactionManager transactionManager(@Autowired SessionFactory sessionFactory) {
		return new HibernateTransactionManager(sessionFactory);
	}

	@Bean
	public JavaMailSender mailSender() {
		JavaMailSenderImpl sender = new JavaMailSenderImpl();
		sender.setHost("smtp.gmail.com");
		sender.setPort(587);
		sender.setUsername("lsd3343@gmail.com");
		sender.setPassword("ahzq qiok qjgh trde"); // Replace with env var in production

		Properties props = sender.getJavaMailProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		props.put("mail.debug", "true");

		return sender;
	}

}
