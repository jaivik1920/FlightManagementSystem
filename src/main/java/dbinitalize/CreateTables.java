package dbinitalize;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import config.ConnectionProvider;

public class CreateTables {
	private static final String createUserTableQuery = "CREATE TABLE IF NOT EXISTS users ("  +
            "id INT AUTO_INCREMENT PRIMARY KEY,"  +
            "firstname VARCHAR(100) NOT NULL,"  +
            "lastname VARCHAR(100) NOT NULL,"  +
            "emailid VARCHAR(255) NOT NULL UNIQUE,"  + 
            "password VARCHAR(255) NOT NULL,"  +
            "nationality_code CHAR(2) NOT NULL,"  +      
            "mobile_number VARCHAR(15) NOT NULL ,"  + 
            "date_of_birth DATE NOT NULL," +
            "date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP" + 
            ");";
	
	
	private static final String createFlightsTableQuery = "CREATE TABLE IF NOT EXISTS flights (" +
            "id INT AUTO_INCREMENT PRIMARY KEY," +                    
            "flight_number VARCHAR(10) NOT NULL," +                    
            "from_location VARCHAR(100) NOT NULL," +                    
            "to_location VARCHAR(100) NOT NULL," +                      
            "departure_date DATE NOT NULL," +                            
            "departure_time TIME NOT NULL," + 
            "arrival_date DATE NOT NULL," +                            
            "arrival_time TIME NOT NULL," +                              
            "airline VARCHAR(100) NOT NULL," +                            
            "economy_price DECIMAL(10, 2) NOT NULL," +  
            "business_price DECIMAL(10, 2) NOT NULL," +                            
            "firstclass_price DECIMAL(10, 2) NOT NULL," +                            
            "economy_seats_available INT NOT NULL," +
            "business_seats_available INT NOT NULL," +
            "first_seats_available INT NOT NULL," +                           
            "status VARCHAR(50) DEFAULT 'Scheduled'," +                  
            "date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP" +         
            ");";

	private static final String createBookingsTableQuery = "CREATE TABLE IF NOT EXISTS bookings (" +
	        "booking_id INT AUTO_INCREMENT PRIMARY KEY," +
	        "user_id INT NOT NULL," +
	        "flight_id INT NOT NULL," +
	        "full_name VARCHAR(100) NOT NULL," +
	        "age INT NOT NULL," +
	        "passport_number VARCHAR(50) NOT NULL," +
	        "contact_details VARCHAR(100) NOT NULL," +
	        "booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP," +
	        "travel_class VARCHAR(2) NOT NULL," +
	        "FOREIGN KEY (user_id) REFERENCES Users(id)," +
	        "FOREIGN KEY (flight_id) REFERENCES Flights(id)" +
	        ");";


	public static void initializeDBTables() {
			try {
				Connection connection = ConnectionProvider.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(createUserTableQuery);
				preparedStatement.execute();
				preparedStatement = connection.prepareStatement(createFlightsTableQuery);
				preparedStatement.execute();
				preparedStatement = connection.prepareStatement(createBookingsTableQuery);
				preparedStatement.execute();
				
				System.out.println("DB Tables initialize successfully!");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("Something went wrong. Table Creation failed");
			}
	}
}
