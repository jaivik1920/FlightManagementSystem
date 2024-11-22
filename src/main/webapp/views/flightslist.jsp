<%@page import="java.util.List"%>
<%@page import="models.Flight"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flight Search Results</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
</head>
<body>
	<div class="container mt-4">
		<h2>Flight Search Results</h2>
		<%
		List<Flight> flights = (List<Flight>) request.getAttribute("flights");
		String fromLocation = (String) request.getAttribute("fromLocation");
		String toLocation = (String) request.getAttribute("toLocation");
        String departureDate = (String) request.getAttribute("departureDate");
		%>

		<!-- Display search criteria -->
		<div class="mb-4">
			<p><strong>From:</strong> <%=fromLocation%></p>
			<p><strong>To:</strong> <%=toLocation%></p>
			<p><strong>Date:</strong> <%=departureDate%></p>
		</div>

		<!-- Check if flights are available -->
		
		<!-- Add sorting options -->
		<div class="mb-4">
		    <form action="${pageContext.request.contextPath}/RootServlet" method="get">
		     	<input type="hidden" name="fromLocation" value="<%= fromLocation %>">
			    <input type="hidden" name="toLocation" value="<%= toLocation %>">
			    <input type="hidden" name="departureDate" value="<%= departureDate %>">
			    <input type="hidden" name="action" value = "flightsearch">
		        <label for="sortOption">Sort by:</label>
		        <select id="sortOption" name="sortOption" class="form-control" style="width: 200px; display: inline-block;">
		            <option value="cheapest" <%= "cheapest".equals(request.getParameter("sortOption")) ? "selected" : "" %>>Cheapest Flight First</option>
				    <option value="shortest" <%= "shortest".equals(request.getParameter("sortOption")) ? "selected" : "" %>>Shortest Flight First</option>
				    <option value="departureTime" <%= "departureTime".equals(request.getParameter("sortOption")) ? "selected" : "" %>>Departure Time</option>
				    <option value="priceHighToLow" <%= "priceHighToLow".equals(request.getParameter("sortOption")) ? "selected" : "" %>>Price High to Low</option>
				</select>
		        <button type="submit" class="btn btn-primary">Sort</button>
		    </form>
		</div>
		
		
		<%
		if (flights != null && !flights.isEmpty()) {
		%>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>Flight Name</th>
					<th>Departure Time</th>
					<th>Arrival Time</th>
					<th>Economy Seats Left</th>
					<th>Business Seats Left</th>
					<th>First Class Seats Left</th>
					<th>Economy Price</th>
					<th>Business Price</th>
					<th>First Class Price</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Flight flight : flights) {
				%>
				<tr>
					<td><%=flight.getAirline()%></td>
					<td><%=flight.getDepartureTime()%></td>
					<td><%=flight.getArrivalTime()%></td>
					<td><%=flight.getEconomySeatsAvailable()%></td>
					<td><%=flight.getBusinessSeatsAvailable()%></td>
					<td><%=flight.getFirstSeatsAvailable()%></td>
					<td><%=String.format("$%.2f", flight.getEconomyPrice())%></td>
					<td><%=String.format("$%.2f", flight.getBusinessPrice())%></td>
					<td><%=String.format("$%.2f", flight.getFirstClassPrice())%></td>
					<td>
						<!-- Book Now button for Economy -->
						<form action="views/booking.jsp" method="get" class="mb-2">
							<input type="hidden" name="flightId" value="<%=flight.getFlightID()%>">
							<input type="hidden" name="fromLocation" value="<%=fromLocation%>">
							<input type="hidden" name="toLocation" value="<%=toLocation%>">
							<input type="hidden" name="departureTime" value="<%=flight.getDepartureTime()%>">
							<input type="hidden" name="arrivalTime" value="<%=flight.getArrivalTime()%>">
							<input type="hidden" name="price" value="<%=flight.getEconomyPrice()%>">
							<input type="hidden" name="travelClass" value="EC">
							<button type="submit" class="btn btn-primary">Book Economy</button>
						</form>

						<!-- Book Now button for Business -->
						<form action="views/booking.jsp" method="get" class="mb-2">
							<input type="hidden" name="flightId" value="<%=flight.getFlightID()%>">
							<input type="hidden" name="fromLocation" value="<%=fromLocation%>">
							<input type="hidden" name="toLocation" value="<%=toLocation%>">
							<input type="hidden" name="departureTime" value="<%=flight.getDepartureTime()%>">
							<input type="hidden" name="arrivalTime" value="<%=flight.getArrivalTime()%>">
							<input type="hidden" name="price" value="<%=flight.getBusinessPrice()%>">
							<input type="hidden" name="travelClass" value="BC">
							<button type="submit" class="btn btn-secondary">Book Business</button>
						</form>

						<!-- Book Now button for First Class -->
						<form action="views/booking.jsp" method="get">
							<input type="hidden" name="flightId" value="<%=flight.getFlightID()%>">
							<input type="hidden" name="fromLocation" value="<%=fromLocation%>">
							<input type="hidden" name="toLocation" value="<%=toLocation%>">
							<input type="hidden" name="departureTime" value="<%=flight.getDepartureTime()%>">
							<input type="hidden" name="arrivalTime" value="<%=flight.getArrivalTime()%>">
							<input type="hidden" name="price" value="<%=flight.getFirstClassPrice()%>">
							<input type="hidden" name="travelClass" value="FC">
							<button type="submit" class="btn btn-success">Book First Class</button>
						</form>
					</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
		<%
		} else {
		%>
		<p>No flights found for the selected criteria.</p>
		<%
		}
		%>
	</div>
</body>
</html>
