package service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.FlightDao;
import dao.UserDao;
import models.Flight;
import models.User;

public class LoginLogoutService {
	
	private static UserDao userDao = new UserDao();
	private static FlightDao flightDao = new FlightDao();

	public static boolean signup(HttpServletRequest request)
	{
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String nationality_code = request.getParameter("nationality_code");
		String date_of_birth = request.getParameter("date_of_birth");
		String emailid = request.getParameter("emailid");
		String password = request.getParameter("password");
		String mobile_number = request.getParameter("mobile_number");
		
		User user = new User(firstname, lastname, emailid, password, nationality_code, Date.valueOf(date_of_birth), mobile_number);
		return userDao.insertUser(user);
	}
	
	public static User signin(HttpServletRequest request) throws Exception
	{
		String emailid = request.getParameter("emailid");
		String password = request.getParameter("password");		
		
		return userDao.verifyUserCredentials(emailid, password);
	}
	
	public static List<Flight> getAllFlights(HttpServletRequest request)
	{
//		String travelClass = request.getParameter("travelClass"); 
//        String passengerType = request.getParameter("passengerType"); 
//        int numPassenger = Integer.parseInt(request.getParameter("numPassenger")); 
        String fromLocation = request.getParameter("fromLocation"); 
        String toLocation = request.getParameter("toLocation"); 
        Date departureDate = Date.valueOf(request.getParameter("departureDate"));

        
        request.setAttribute("fromLocation", fromLocation);
        request.setAttribute("toLocation", toLocation);
        request.setAttribute("departureDate", departureDate.toString());
        
        List<Flight> flights= flightDao.getFlights(fromLocation, toLocation, departureDate);
        
//       
//        
        return flights;
	}
	
}
