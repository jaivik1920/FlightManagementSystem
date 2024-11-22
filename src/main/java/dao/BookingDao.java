package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.ConnectionProvider;
import models.Booking;

public class BookingDao {
	
	private Connection connection;
	
	public BookingDao()
	{
		connection = ConnectionProvider.getConnection();
	}
	
	public boolean insertBooking(Booking booking)
	{
		String insertQuery = "INSERT INTO Bookings (user_id, flight_id, full_name, age, passport_number, contact_details,travel_class, booking_date) " +
                "VALUES (?, ?, ?, ?, ?, ?,?, CURRENT_TIMESTAMP)";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
			preparedStatement.setInt(1, booking.getUserId());
			preparedStatement.setInt(2, booking.getFlightId());
			preparedStatement.setString(3, booking.getFullName());
			preparedStatement.setInt(4, booking.getAge());
			preparedStatement.setString(5, booking.getPassportNumber());
			preparedStatement.setString(6, booking.getContactDetails());
			preparedStatement.setString(7, booking.getTravelClass());
			int result = preparedStatement.executeUpdate();
			if(result > 0)
			{
				String parameter = "";
				if(booking.getTravelClass().equals("BC"))
				{
					parameter = "business_seats_available";
				}
				else if(booking.getTravelClass().equals("EC"))
				{
					parameter = "economy_seats_available";
				}
				else {
					parameter = "first_seats_available";
				}
				String updateSeatCountQuery = "UPDATE flights SET " + parameter + " = " + parameter + " - 1 WHERE id = ?";
				
				preparedStatement = connection.prepareStatement(updateSeatCountQuery);
				preparedStatement.setInt(1, booking.getFlightId());
				result = preparedStatement.executeUpdate();
				
				return result > 0;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		
		return true;
		
	}
	
	public List<Booking> getAllBookingsByUser(int userId)
	{
		List<Booking> bookings = new ArrayList<Booking>();
		
		String query = "SELECT * from bookings where user_id = ? order by booking_date desc";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, userId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next())
			{
				Booking booking = new Booking(userId, resultSet.getInt("flight_id"), resultSet.getString("full_name"), resultSet.getInt("age"), 
						resultSet.getString("passport_number"), resultSet.getString("contact_details"),resultSet.getString("travel_class"));
				booking.setBookingDate(resultSet.getTimestamp("booking_date"));
				
				bookings.add(booking);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return bookings;
	}
	
}
