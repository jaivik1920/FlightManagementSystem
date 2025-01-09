package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookingDao;
import models.User;
import models.UserBooking;
import service.UserService;

/**
 * Servlet implementation class UserHomePage
 */
@WebServlet("/UserHomePage")
public class UserHomePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserHomePage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);

		if(session.getAttribute("user") == null)
		{
			response.sendRedirect("views/signin.jsp");
			return;
		}
		User user = (User)session.getAttribute("user");
		BookingDao bookingDao = new BookingDao();
		List<UserBooking> bookings= bookingDao.getAllBookingsByUser(user.getUserID());
		request.setAttribute("bookings", bookings);
        request.setAttribute("userName", user.getFirstname());
		
		request.getRequestDispatcher("views/mybookings.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action") != null ? request.getParameter("action") : "";
		if(action.equals("updateProfile"))
		{
			User user = UserService.updateUser(request);
			if(user != null)
			{
				request.getSession().setAttribute("user", user);
				request.setAttribute("msg", "Profile updated successfully!!");
				RequestDispatcher rDispatcher = request.getRequestDispatcher("views/myprofile.jsp");
				rDispatcher.forward(request, response);
				return;
				
			}
			else {
				request.setAttribute("error", "Something went wrong!! Profile didn't updated Try Again!!");
				RequestDispatcher rDispatcher = request.getRequestDispatcher("views/myprofile.jsp");
				rDispatcher.forward(request, response);
				return;
			}
		}
		else if(action.equals("resetPassword"))
		{
			try {
				if(UserService.updatePassword(request))
				{
					request.setAttribute("msg", "Password updated successfully!!");
					RequestDispatcher rDispatcher = request.getRequestDispatcher("views/myprofile.jsp");
					rDispatcher.forward(request, response);
					return;
				}
				else {
					throw new Exception("Confirm password doesn't match!!");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				request.setAttribute("error", e.getMessage());
				RequestDispatcher rDispatcher = request.getRequestDispatcher("views/myprofile.jsp");
				rDispatcher.forward(request, response);
				return;
			} 
		}
		doGet(request, response);
	}

}
