package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import config.ConnectionProvider;
import models.Booking;
import models.UserBooking;

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
	
	public List<UserBooking> getAllBookingsByUser(int userId)
	{
		List<UserBooking> bookings = new ArrayList<UserBooking>();
		
		 String getBookingsQuery = 
			    "SELECT " +
			    "    b.booking_id, " +
			    "    b.full_name, " +
			    "    f.flight_number, " +
			    "    f.from_location, " +
			    "    f.to_location, " +
			    "    f.departure_date, " +
			    "    f.departure_time, " +
			    "    f.arrival_date, " +
			    "    f.arrival_time, " +
			    "    b.travel_class, " +
			    "    CASE " +
			    "        WHEN b.travel_class = 'EC' THEN f.economy_price " +
			    "        WHEN b.travel_class = 'BC' THEN f.business_price " +
			    "        WHEN b.travel_class = 'FC' THEN f.firstclass_price " +
			    "        ELSE 0 " +
			    "    END AS price, " +
			    "    b.booking_date, " +
			    "    f.status " +
			    "FROM " +
			    "    bookings b " +
			    "JOIN " +
			    "    flights f ON b.flight_id = f.id " +
			    "WHERE " +
			    "    b.user_id = ?"; 

		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(getBookingsQuery);
			preparedStatement.setInt(1, userId);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next())
			{
				UserBooking booking = new UserBooking();
				booking.setBookingId(resultSet.getInt("booking_id"));
                booking.setFullName(resultSet.getString("full_name"));
                booking.setFlightNumber(resultSet.getString("flight_number"));
                booking.setFromLocation(resultSet.getString("from_location"));
                booking.setToLocation(resultSet.getString("to_location"));
                booking.setDepartureDate(resultSet.getDate("departure_date"));
                booking.setDepartureTime(resultSet.getString("departure_time"));
                booking.setArrivalDate(resultSet.getDate("arrival_date"));
                booking.setArrivalTime(resultSet.getString("arrival_time"));
                booking.setTravelClass(resultSet.getString("travel_class"));
                booking.setPrice(resultSet.getDouble("price"));
                booking.setBookingDate(resultSet.getDate("booking_date"));
                booking.setStatus(resultSet.getString("status"));
				
				bookings.add(booking);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return bookings;
	}
	
	public boolean cancleBooking(int bookingId)
	{
		String query= "select flight_id,travel_class from bookings where booking_id = ?";
		String deleteQuery = "delete from bookings where booking_id = ?";

		PreparedStatement preparedStatement;
		try {
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, bookingId);
			ResultSet resultSet = preparedStatement.executeQuery();
			String travelClass = "";
			int flightid = -1;
			while(resultSet.next())
			{
				travelClass = resultSet.getString("travel_class");
				flightid = resultSet.getInt("flight_id");
				
			}
			resultSet.close();
			
			preparedStatement = connection.prepareStatement(deleteQuery);
			preparedStatement.setInt(1, bookingId);
			
			int result = preparedStatement.executeUpdate();
			
			if(result > 0)
			{
				String parameter = "";
				if(travelClass.equals("BC"))
				{
					parameter = "business_seats_available";
				}
				else if(travelClass.equals("EC"))
				{
					parameter = "economy_seats_available";
				}
				else {
					parameter = "first_seats_available";
				}
				String updateSeatCountQuery = "UPDATE flights SET " + parameter + " = " + parameter + " + 1 WHERE id = ?";
				
				preparedStatement = connection.prepareStatement(updateSeatCountQuery);
				preparedStatement.setInt(1, flightid);
				
				result = 0;
				result = preparedStatement.executeUpdate();
				if(result > 0)
				{
					return true;	
				}
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	
}
