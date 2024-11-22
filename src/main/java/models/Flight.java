package models;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class Flight {
	private int flightID; 
    private String flightNumber;
    private String fromLocation;
    private String toLocation; 
    private Date departureDate; 
    private String departureTime; 
    private Date arrivalDate;
    private String arrivalTime; 
    private String airline; 
    private double economyPrice;
    private double businessPrice; 
    private double firstClassPrice; 
    private int economySeatsAvailable; 
    private int businessSeatsAvailable; 
    private int firstSeatsAvailable; 
    private String status;
    
	public int getFlightID() {
		return flightID;
	}
	public void setFlightID(int flightID) {
		this.flightID = flightID;
	}
	public String getFlightNumber() {
		return flightNumber;
	}
	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}
	public String getFromLocation() {
		return fromLocation;
	}
	public void setFromLocation(String fromLocation) {
		this.fromLocation = fromLocation;
	}
	public String getToLocation() {
		return toLocation;
	}
	public void setToLocation(String toLocation) {
		this.toLocation = toLocation;
	}
	public Date getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(Date departureDate) {
		this.departureDate = departureDate;
	}
	public String getDepartureTime() {
		return departureTime;
	}
	public void setDepartureTime(String departureTime) {
		this.departureTime = departureTime;
	}
	public Date getArrivalDate() {
		return arrivalDate;
	}
	public void setArrivalDate(Date arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
	public String getArrivalTime() {
		return arrivalTime;
	}
	public void setArrivalTime(String arrivalTime) {
		this.arrivalTime = arrivalTime;
	}
	public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}
	public double getEconomyPrice() {
		return economyPrice;
	}
	public void setEconomyPrice(double economyPrice) {
		this.economyPrice = economyPrice;
	}
	public double getBusinessPrice() {
		return businessPrice;
	}
	public void setBusinessPrice(double businessPrice) {
		this.businessPrice = businessPrice;
	}
	public double getFirstClassPrice() {
		return firstClassPrice;
	}
	public void setFirstClassPrice(double firstClassPrice) {
		this.firstClassPrice = firstClassPrice;
	}
	public int getEconomySeatsAvailable() {
		return economySeatsAvailable;
	}
	public void setEconomySeatsAvailable(int economySeatsAvailable) {
		this.economySeatsAvailable = economySeatsAvailable;
	}
	public int getBusinessSeatsAvailable() {
		return businessSeatsAvailable;
	}
	public void setBusinessSeatsAvailable(int businessSeatsAvailable) {
		this.businessSeatsAvailable = businessSeatsAvailable;
	}
	public int getFirstSeatsAvailable() {
		return firstSeatsAvailable;
	}
	public void setFirstSeatsAvailable(int firstSeatsAvailable) {
		this.firstSeatsAvailable = firstSeatsAvailable;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public int getDuration() {
	    // Assuming departureTime and arrivalTime are stored as String in a "HH:mm:ss" format
	    SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
	    try {
	        java.util.Date depTime = format.parse(this.departureTime);
	        java.util.Date arrTime = format.parse(this.arrivalTime);
	        long diff = arrTime.getTime() - depTime.getTime();
	        return (int) (diff / (1000 * 60)); // Duration in minutes
	    } catch (ParseException e) {
	        e.printStackTrace();
	        return 0; // Default in case of error
	    }
	}

	
	@Override
	public String toString() {
		return "Flight [id=" + flightID + ", flightNumber=" + flightNumber + ", fromLocation=" + fromLocation
				+ ", toLocation=" + toLocation + ", departureDate=" + departureDate + ", departureTime=" + departureTime
				+ ", arrivalDate=" + arrivalDate + ", arrivalTime=" + arrivalTime + ", airline=" + airline
				+ ", economyPrice=" + economyPrice + ", businessPrice=" + businessPrice + ", firstClassPrice="
				+ firstClassPrice + ", economySeatsAvailable=" + economySeatsAvailable + ", businessSeatsAvailable="
				+ businessSeatsAvailable + ", firstSeatsAvailable=" + firstSeatsAvailable + ", status=" + status + "]";
	} 
    
    
}
