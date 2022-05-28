package com.GetDB;
import javax.persistence.EntityManager;
import javax.persistence.Persistence;
import javax.persistence.EntityManagerFactory;
/*
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import java.util.Properties;


import org.hibernate.cfg.Environment;
import org.hibernate.service.ServiceRegistry;

import com.Model.Food;
import com.Model.User;
*/

public class MyDB {
	private static EntityManagerFactory factory = Persistence.createEntityManagerFactory("FinalProject");
	
	public MyDB() {
		
	}
	public static EntityManager getEntityManager() {
		/*Configuration configuration = new Configuration();
		Properties settings = new Properties();
		settings.put(Environment.DRIVER, "org.postgresql.Driver");
		settings.put(Environment.URL, "jdbc:postgresql://ec2-44-198-204-136.compute-1.amazonaws.com:5432/d2kf7fpg87gei9");
		settings.put(Environment.USER, "bozquxzncwuswc");
		settings.put(Environment.PASS, "ffc4c19fb435b52948a899310facb4c045a854e9147d93a340eb4226b07ee9d9");
		settings.put(Environment.DIALECT, "org.hibernate.dialect.PostgreSQLDialect");
		settings.put(Environment.SHOW_SQL, "true");
		settings.put(Environment.CURRENT_SESSION_CONTEXT_CLASS, "thread");
		settings.put(Environment.HBM2DDL_AUTO, "update");
		configuration.setProperties(settings);
		configuration.addAnnotatedClass(User.class);
		configuration.addAnnotatedClass(Food.class);
		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
				.applySettings(configuration.getProperties()).build();
		System.out.println("Hibernate Java Config serviceRegistry created");
		SessionFactory sessionFactory = configuration.buildSessionFactory(serviceRegistry);
		return sessionFactory.createEntityManager();*/
		return factory.createEntityManager();
	}
}
