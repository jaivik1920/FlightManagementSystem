<%@page import="java.util.HashMap"%>
<%@page import="utility.Constants"%>
<%@page import="models.UserBooking"%>
<%@page import="java.util.List"%>
<%@page import="models.Booking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style>
		body{
			height: 100vh;
		}
		.container{
			min-height: 75%;
		}
		
	</style>
</head>
<body>
<% request.setAttribute("navtab", "MyBookings"); %>
<jsp:include page="/views/navbar.jsp" />

<%

if(session.getAttribute("user") == null)
{
	response.sendRedirect(request.getContextPath()+"/views/signin.jsp");
}
%>

<div class="container mt-4">
    <h2>Welcome, <%= request.getAttribute("userName") %>!</h2>
    <p class="lead">Here are your booking details:</p>

    <% 
    List<UserBooking> bookings = (List<UserBooking>) request.getAttribute("bookings");
    if (bookings != null && !bookings.isEmpty()) { 
    %>
        <div class="row">
            <% for (UserBooking booking : bookings) { %>
                <div class="col-md-12 mb-4">
                    <div class="card shadow-sm">
                        <div class="card-body">
                            <h5 class="card-title"><%= booking.getFlightNumber() %> - <%=booking.getFromLocation() %> to <%= booking.getToLocation() %></h5>
                            
                            <div class="row">
                                <div class="col-md-3">
                                    <strong>Booking ID:</strong> <%= booking.getBookingId() %>
                                </div>
                                <div class="col-md-3">
                                    <strong>Name:</strong> <%= booking.getFullName() %>
                                </div>
                                <div class="col-md-3">
                                    <strong>Travel Class:</strong> <%= booking.getTravelClass() %>
                                </div>
                                <div class="col-md-3">
                                    <strong>Price:</strong> $<%= booking.getPrice() %>
                                </div>
                            </div>

                            <div class="row mt-3">
                                <div class="col-md-3">
                                    <strong>Departure:</strong> <%= booking.getDepartureDate() %> at <%= booking.getDepartureTime() + " UTC"%>
                                </div>
                                <div class="col-md-3">
                                    <strong>Arrival:</strong> <%= booking.getArrivalDate() %> at <%= booking.getArrivalTime() + " UTC"%>
                                </div>
                                <div class="col-md-3">
                                    <strong>Status:</strong> <%= booking.getStatus() %>
                                </div>
                                <div class="col-md-3">
                                    <form action="${pageContext.request.contextPath}/BookingServlet" method="post" onsubmit="return confirm('Are you sure you want to cancel this booking?');">
                                        <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                                        <input type="hidden" name="action" value="cancelbooking">
                                        <button type="submit" class="btn btn-outline-danger btn-sm">Cancel Booking</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>
    <% } else { %>
         <div class="alert alert-warning" role="alert">
            You haven't made any booking yet!
        </div>
    <% } %>
</div>

<jsp:include page="/views/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
