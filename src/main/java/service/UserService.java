package service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import at.favre.lib.crypto.bcrypt.BCrypt;
import at.favre.lib.crypto.bcrypt.BCryptFormatter;
import dao.UserDao;
import models.User;

public class UserService {

	private static UserDao userDao = new UserDao();
	
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
	
	public static User updateUser(HttpServletRequest request)
	{
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		user.setFirstname(request.getParameter("firstname"));
		user.setLastname(request.getParameter("lastname"));
		user.setEmailid(request.getParameter("emailid"));
		user.setMobile_number(request.getParameter("mobile_number"));
		return userDao.updateUser(user);
	}
	
	public static boolean updatePassword(HttpServletRequest request) throws Exception
	{
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		String curPassword = request.getParameter("current_password");
		String newPassword = request.getParameter("new_password");
		String confirmPassword = request.getParameter("confirm_password");
		
		if(newPassword.equals(confirmPassword))
		{
			return userDao.updatePassword(user.getUserID(), curPassword, newPassword);
		}
		return false;
	}
}
