package config;

import java.sql.Connection;
import java.sql.DriverManager;

public final class ConnectionProvider {
	static Connection connection = null;
	
	private ConnectionProvider() {
		
	}
	
	public static Connection getConnection()
	{
		if(connection == null)
		{
			try {
				Class.forName(ConnectionDetails.dbDriver);
				connection = DriverManager.getConnection(ConnectionDetails.url, 
						ConnectionDetails.user, ConnectionDetails.pass);
			} catch (Exception e) {
				e.printStackTrace();
				System.err.print(e.getMessage());
			}
		}
		return connection;
	}
}
