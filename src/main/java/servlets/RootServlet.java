package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Flight;
import models.User;
import service.LoginLogoutService;

/**
 * Servlet implementation class CreateUser
 */
@WebServlet("/RootServlet")
public class RootServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RootServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equals("flightsearch"))
		{
	        String sortOption = request.getParameter("sortOption");

			List<Flight> flights= LoginLogoutService.getAllFlights(request);
			 switch (sortOption) {
	        case "cheapest":
	            flights.sort(Comparator.comparingDouble(Flight::getEconomyPrice));
	            break;
	        case "shortest":
	            flights.sort(Comparator.comparingInt(Flight::getDuration)); 
	            break;
	        case "departureTime":
	            flights.sort(Comparator.comparing(Flight::getDepartureTime));
	            break;
	        case "priceHighToLow":
	            flights.sort((f1, f2) -> Double.compare(f2.getEconomyPrice(), f1.getEconomyPrice()));
	            break;
	        default:
	            // Default sorting, maybe by departure time
	            flights.sort(Comparator.comparing(Flight::getDepartureTime));
	    }
			request.setAttribute("flights", flights);
			RequestDispatcher rd = request.getRequestDispatcher("views/flightslist.jsp");
			rd.forward(request, response);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action.equals("flightsearch"))
		{
			List<Flight> flights= LoginLogoutService.getAllFlights(request);
			request.setAttribute("flights", flights);
			RequestDispatcher rd = request.getRequestDispatcher("views/flightslist.jsp");
			rd.forward(request, response);
			
		}
		else if(action.equals("signup"))
		{
			LoginLogoutService.signup(request);
		}
		else if(action.equals("signin"))
		{
			try {
				User user = LoginLogoutService.signin(request);
				if(user != null)
				{
					HttpSession session = request.getSession(false);
					session.setAttribute("user", user);
					Map<String, String[]> tempBookingDetails = (Map) session.getAttribute("tempBookingDetails");
		            if (tempBookingDetails != null) 
		            {
		                    session.removeAttribute("tempBookingDetails"); // Clean up session
		                    request.setAttribute("tempBookingDetails", tempBookingDetails);
		                    request.getRequestDispatcher("BookingServlet").forward(request, response);
		                    return;
		            }
					response.sendRedirect("UserHomePage");
				}
				else {
				    throw new Exception("Invalid Username or Password!!");	
				}
			} catch (Exception e) {
				e.printStackTrace();
				String error = e.getMessage();
				response.setContentType("text/html");  
				PrintWriter printWriter = response.getWriter();
				printWriter.write(error);
				RequestDispatcher rDispatcher = request.getRequestDispatcher("views/signin.jsp");
				rDispatcher.include(request, response);
			    
			}
		}
	}

}
