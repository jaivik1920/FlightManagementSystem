package models;

import java.sql.Timestamp;

public class Booking {
	private int bookingId;
    private int userId;
    private int flightId;
    private String fullName;
    private int age;
    private String passportNumber;
    private String contactDetails;
    private String travelClass;
    private Timestamp bookingDate;
    
    
    
	public Booking(int userId, int flightId, String fullName, int age, String passportNumber, String contactDetails, String travelClass) {
		super();
		this.userId = userId;
		this.flightId = flightId;
		this.fullName = fullName;
		this.age = age;
		this.passportNumber = passportNumber;
		this.contactDetails = contactDetails;
		this.travelClass = travelClass;
	}
	
	public int getBookingId() {
		return bookingId;
	}
	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getFlightId() {
		return flightId;
	}
	public void setFlightId(int flightId) {
		this.flightId = flightId;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPassportNumber() {
		return passportNumber;
	}
	public void setPassportNumber(String passportNumber) {
		this.passportNumber = passportNumber;
	}
	public String getContactDetails() {
		return contactDetails;
	}
	public void setContactDetails(String contactDetails) {
		this.contactDetails = contactDetails;
	}
	
	public Timestamp getBookingDate() {
		return bookingDate;
	}
	public void setBookingDate(Timestamp bookingDate) {
		this.bookingDate = bookingDate;
	}
	
	public String getTravelClass() {
		return travelClass;
	}

	public void setTravelClass(String travelClass) {
		this.travelClass = travelClass;
	}

	@Override
	public String toString() {
		return "Booking [bookingId=" + bookingId + ", userId=" + userId + ", flightId=" + flightId + ", fullName="
				+ fullName + ", age=" + age + ", passportNumber=" + passportNumber + ", contactDetails="
				+ contactDetails + ", bookingDate=" + bookingDate + "]";
	}
    
    
}
