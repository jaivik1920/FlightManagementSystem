package service;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dao.FlightDao;
import models.Flight;

public class FlightService {
	
	private static FlightDao flightDao = new FlightDao();
	
	public static List<Flight> getAllFlights(HttpServletRequest request)
	{
        String fromLocation = request.getParameter("fromLocation"); 
        String toLocation = request.getParameter("toLocation"); 
        Date departureDate = Date.valueOf(request.getParameter("departureDate"));
        String passengerType = request.getParameter("passengerType"); 

        
        request.setAttribute("fromLocation", fromLocation);
        request.setAttribute("toLocation", toLocation);
        request.setAttribute("departureDate", departureDate.toString());
        
        List<Flight> flights= flightDao.getFlights(fromLocation, toLocation, departureDate);
        
        if(passengerType.equals("Child"))
        {
        	flights.forEach(flight -> {
        		flight.setEconomyPrice(0.80 * flight.getEconomyPrice());
        		flight.setBusinessPrice(0.80 * flight.getBusinessPrice());
        		flight.setFirstClassPrice(0.80 * flight.getFirstClassPrice());

        	});
        }
        return flights;
	}
}
