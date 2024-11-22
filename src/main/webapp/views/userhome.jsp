<%@page import="java.util.List"%>
<%@page import="models.Booking"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
</head>
<body>
 <div class="container mt-4">
        <h2>Welcome, <%= request.getAttribute("userName") %>!</h2>
        <p class="lead">Here are your booking details:</p>

		<%
		List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
		if (bookings != null && !bookings.isEmpty()) {
		%>

        <div class="mt-4">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Flight ID</th>
                        <th>Full Name</th>
                        <th>Age</th>
                        <th>Passport Number</th>
                        <th>Contact Details</th>
                        <th>Booking Date</th>
                        <th>Travel Class</th>
                    </tr>
                </thead>
                <tbody>
                   <%
				for (Booking booking : bookings) {
				%>
				<tr>
					<td><%=booking.getFlightId()%></td>
					<td><%=booking.getFullName()%></td>
					<td><%=booking.getAge()%></td>
					<td><%=booking.getPassportNumber()%></td>
					<td><%=booking.getContactDetails()%></td>
					<td><%=booking.getBookingDate()%></td>
					<td><%=booking.getTravelClass()%></td>
					<tr>
					<%
				}
				%>
                </tbody>
            </table>
            <%
		} else {
		%>
		<p>No bookings made by you till date.</p>
		<%
		}
		%>
        </div>

        <a href="index.jsp" class="btn btn-primary mt-4">Book Another Flight</a>
       <form action="index.jsp" method="post">
    		<button type="submit" class="btn btn-danger mt-4">Log Out</button>
	   </form>
    </div>

</body>
</html>