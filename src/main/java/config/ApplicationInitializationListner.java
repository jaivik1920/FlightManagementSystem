package config;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import dbinitalize.CreateTables;

@WebListener
public class ApplicationInitializationListner implements ServletContextListener {

	@Override
    public void contextInitialized(ServletContextEvent sce) {
		CreateTables.initializeDBTables();
	}
}
