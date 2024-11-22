package models;

import java.sql.Date;

public class User {
	 	private int userID;                  
	    private String firstname;        
	    private String lastname;         
	    private String emailid;          
	    private String password;         
	    private String nationality_code;  
	    private Date date_of_birth;                
	    private String mobile_number;     
	    private Date date_created;
	    
	    public User()
	    {
	    	
	    }
	    
		public User(String firstname, String lastname, String emailid, String password, String nationality_code,
				Date date_of_birth, String mobile_number) {
			super();
			this.firstname = firstname;
			this.lastname = lastname;
			this.emailid = emailid;
			this.password = password;
			this.nationality_code = nationality_code;
			this.date_of_birth = date_of_birth;
			this.mobile_number = mobile_number;
		}

		public int getUserID() {
			return userID;
		}

		public void setUserID(int userID) {
			this.userID = userID;
		}

		public String getFirstname() {
			return firstname;
		}

		public void setFirstname(String firstname) {
			this.firstname = firstname;
		}

		public String getLastname() {
			return lastname;
		}

		public void setLastname(String lastname) {
			this.lastname = lastname;
		}

		public String getEmailid() {
			return emailid;
		}

		public void setEmailid(String emailid) {
			this.emailid = emailid;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getNationality_code() {
			return nationality_code;
		}

		public void setNationality_code(String nationality_code) {
			this.nationality_code = nationality_code;
		}

		public Date getDate_of_birth() {
			return date_of_birth;
		}

		public void setDate_of_birth(Date date_of_birth) {
			this.date_of_birth = date_of_birth;
		}

		public String getMobile_number() {
			return mobile_number;
		}

		public void setMobile_number(String mobile_number) {
			this.mobile_number = mobile_number;
		}

		public Date getDate_created() {
			return date_created;
		}

		public void setDate_created(Date date_created) {
			this.date_created = date_created;
		}

		@Override
		public String toString() {
			return "User [id=" + userID + ", firstname=" + firstname + ", lastname=" + lastname + ", emailid=" + emailid
					+ ", password=" + password + ", nationality_code=" + nationality_code + ", date_of_birth="
					+ date_of_birth + ", mobile_number=" + mobile_number + ", date_created=" + date_created + "]";
		}  
		
		
	    
	    
}
