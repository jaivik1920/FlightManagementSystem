package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.ConnectionProvider;
import models.Flight;

public class FlightDao {
	
	private Connection connection;
	
	public FlightDao()
	{
		connection = ConnectionProvider.getConnection();
	}
	
	public List<Flight> getFlights(String from, String to, Date departureDate)
	{
		String getFlightQuery = "SELECT * FROM flights WHERE from_location = ? " +
                "AND to_location = ? AND departure_date = ? AND (status = 'Scheduled' OR status = 'Available')";
		
		List<Flight> flights = new ArrayList<Flight>();

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(getFlightQuery);
			preparedStatement.setString(1, from);
			preparedStatement.setString(2, to);
			preparedStatement.setDate(3, departureDate);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
		    while (resultSet.next()) {
		        Flight flight = new Flight();
		        flight.setFlightID(resultSet.getInt("id"));
		        flight.setFlightNumber(resultSet.getString("flight_number"));
		        flight.setFromLocation(resultSet.getString("from_location"));
		        flight.setToLocation(resultSet.getString("to_location"));
		        flight.setDepartureDate(resultSet.getDate("departure_date"));
		        flight.setDepartureTime(resultSet.getString("departure_time"));
		        flight.setArrivalDate(resultSet.getDate("arrival_date"));
		        flight.setArrivalTime(resultSet.getString("arrival_time"));
		        flight.setAirline(resultSet.getString("airline"));
		        flight.setEconomyPrice(resultSet.getDouble("economy_price"));
		        flight.setBusinessPrice(resultSet.getDouble("business_price"));
		        flight.setFirstClassPrice(resultSet.getDouble("firstclass_price"));
		        flight.setEconomySeatsAvailable(resultSet.getInt("economy_seats_available"));
		        flight.setBusinessSeatsAvailable(resultSet.getInt("business_seats_available"));
		        flight.setFirstSeatsAvailable(resultSet.getInt("first_seats_available"));
		        flight.setStatus(resultSet.getString("status"));
		        flights.add(flight);
		    }
			
		    return flights;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		return flights;
	}
}
