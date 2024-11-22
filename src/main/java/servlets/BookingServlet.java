package servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookingDao;
import models.Booking;
import models.User;

/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);
    	 if (session == null || session.getAttribute("user") == null) {
		        session = request.getSession(); 
		        session.setAttribute("tempBookingDetails", request.getParameterMap()); 
		        response.sendRedirect("views/signin.jsp");
		        return;
    	 }
    	 
    	 User user = (User)session.getAttribute("user");
    	 Map<String, String[]> tempBookingDetails = (Map<String, String[]>) request.getAttribute("tempBookingDetails");
 	    if(tempBookingDetails != null)
 	    {

 		    int flightId = Integer.parseInt(tempBookingDetails.get("flightId")[0]);
 		    String fullName = tempBookingDetails.get("fullName")[0];
 		    int age = Integer.parseInt(tempBookingDetails.get("age")[0]);
 		    String passportNumber = tempBookingDetails.get("passportNumber")[0];
 		    String contactDetails = tempBookingDetails.get("contactDetails")[0];
 		    String travelClass = tempBookingDetails.get("travelClass")[0];
 	
 		    //Perform booking
 		    Booking booking = new Booking(user.getUserID(), flightId, fullName, age, passportNumber, contactDetails, travelClass);
 		    BookingDao bookingDao = new BookingDao();
 	
 		    if (bookingDao.insertBooking(booking)) {
 		        response.sendRedirect("UserHomePage");
 		        return;
 		    }
 	    }
    	 
		int flightId = Integer.parseInt(request.getParameter("flightId"));
        String fullName = request.getParameter("fullName");
        int age = Integer.parseInt(request.getParameter("age"));
        String passportNumber = request.getParameter("passportNumber");
        String contactDetails = request.getParameter("contactDetails");
        String travelClass = request.getParameter("travelClass");
        
        Booking booking = new Booking(user.getUserID(), flightId, fullName, age, passportNumber, contactDetails,travelClass);
        
        BookingDao bookingDao = new BookingDao();
        if(bookingDao.insertBooking(booking))
        {
        	response.sendRedirect("UserHomePage");
        	return;
        }
		doGet(request, response);
	}

}
