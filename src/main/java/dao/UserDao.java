package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import config.ConnectionProvider;
import models.User;

public class UserDao {
	
	private Connection connection;
	public UserDao()
	{
		connection = ConnectionProvider.getConnection();
	}
	
	public boolean insertUser(User user)
	{
		String insertQuery = "INSERT INTO users (firstname, lastname, emailid, password, nationality_code, date_of_birth, mobile_number) VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			Encoder encoder = Base64.getEncoder();
			PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
			preparedStatement.setString(1, user.getFirstname());
			preparedStatement.setString(2, user.getLastname());
			preparedStatement.setString(3, user.getEmailid());
			preparedStatement.setString(4, encoder.encodeToString(user.getPassword().getBytes()));
			preparedStatement.setString(5, user.getNationality_code());
			preparedStatement.setDate(6, user.getDate_of_birth());
			preparedStatement.setString(7, user.getMobile_number());
			int results = preparedStatement.executeUpdate();
			if(results > 0)
			{
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public User verifyUserCredentials(String username, String userPassword) throws Exception
	{
		try {
			PreparedStatement preparedStatement = connection.prepareStatement("select id,firstname,lastname,nationality_code,"
					+ "mobile_number,date_of_birth,emailid,password from users where emailid = ?");
			preparedStatement.setString(1, username);
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next())
			{
				String  emailId = resultSet.getString("emailid");
				String password = resultSet.getString("password");
				Decoder decoder = Base64.getDecoder();
				String decryptedPassword = new String(decoder.decode(password));
				
				if(emailId.equalsIgnoreCase(username) && decryptedPassword.equals(userPassword))
				{
					User user = new User(resultSet.getString("firstname"), resultSet.getString("lastname"), emailId, null, 
							resultSet.getString("nationality_code"), Date.valueOf(resultSet.getString("date_of_birth")), resultSet.getString("mobile_number"));
					user.setUserID(resultSet.getInt("id"));
					return user;
				}
				else if(!emailId.equalsIgnoreCase(emailId))
				{
					throw new Exception("User does not exist!");
				}
				else {
					throw new Exception("Invalid Password");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	
	public User updateUser(User user)
	{
		String query = "update users set firstname = ?, lastname = ?, emailid = ?, mobile_number= ? where id = ?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, user.getFirstname());
			preparedStatement.setString(2, user.getLastname());
			preparedStatement.setString(3, user.getEmailid());
			preparedStatement.setString(4, user.getMobile_number());
			preparedStatement.setInt(5, user.getUserID());
			int result = preparedStatement.executeUpdate();
			if(result > 0)
			{
				return user;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return null;
		
	}
	
	public boolean updatePassword(int userid, String password, String newPassword) throws Exception
	{
		String query = "select password from users where id = ?";
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(query);
			preparedStatement.setInt(1, userid);
			
			ResultSet resultSet = preparedStatement.executeQuery();
			while(resultSet.next())
			{
				String originalPassword = resultSet.getString("password");
				Decoder decoder = Base64.getDecoder();
				String decryptedPassword = new String(decoder.decode(originalPassword));
				if(!decryptedPassword.equals(password))
				{
					throw new Exception("Invalid Current Password!!");
				}
				query = "Update users set password  = ? where id = ?";
				preparedStatement = connection.prepareStatement(query);
				Encoder encoder = Base64.getEncoder();
				preparedStatement.setString(1,encoder.encodeToString(newPassword.getBytes()));
				preparedStatement.setInt(2, userid);
				
				int result = preparedStatement.executeUpdate();
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
