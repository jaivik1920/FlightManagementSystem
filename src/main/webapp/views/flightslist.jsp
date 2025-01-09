<%@page import="java.util.List"%>
<%@page import="models.Flight"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flight Search Results</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>
        .search-details {
            background-color: #f8f9fa;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .search-details p {
            margin: 5px 0;
            font-size: 1rem;
        }
    </style>     
</head>
<body>
<% request.setAttribute("navtab", "Booking"); %>
<jsp:include page="/views/navbar.jsp" />
<div class="container mt-4">
	    <div class="progress" style="height: 30px;">
	        <div class="progress-bar bg-primary" role="progressbar" style="width: 33.33%;" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">Step 1: Search Flights</div>
	    	<div class="progress-bar bg-secondary" role="progressbar" style="width: 33.33%;" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">Step 2: Choose Flight</div>
	        <div class="progress-bar bg-secondary" role="progressbar" style="width: 33.33%;" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">Step 3: Confirm Booking</div>
	    </div>
</div>
	<div class="container mt-4">
		<%
		List<Flight> flights = (List<Flight>) request.getAttribute("flights");
		String fromLocation = (String) request.getAttribute("fromLocation");
		String toLocation = (String) request.getAttribute("toLocation");
        String departureDate = (String) request.getAttribute("departureDate");
        String passengerType = (String) request.getAttribute("passengerType");
		%>

		<div class="container mt-5">
        <div class="search-details">
            <h4 class="mb-3">Flight Search Details</h4>
            <div class="row">
                <div class="col-md-3">
                    <p><strong>From:</strong> <%=fromLocation%></p>
                </div>
                <div class="col-md-3">
                    <p><strong>To:</strong> <%=toLocation%></p>
                </div>
                <div class="col-md-3">
                    <p><strong>Date:</strong> <%=departureDate%></p>
                </div>
                <div class="col-md-3">
                    <a type="button" href="${pageContext.request.contextPath}/views/booking.jsp" class="btn btn-primary btn-sm">Modify Search</a>
                 </div>
            </div>
            </div>
            
        </div>
    </div>

		
		
		
		 <div class="container mt-5">
        <h2 class="mb-4">Available Flights</h2>
        <%
            if (flights != null && !flights.isEmpty()) {
        %>
        <div class="mb-4">
		    <form action="${pageContext.request.contextPath}/RootServlet" method="get">
		     	<input type="hidden" name="fromLocation" value="<%= fromLocation %>">
			    <input type="hidden" name="toLocation" value="<%= toLocation %>">
			    <input type="hidden" name="departureDate" value="<%= departureDate %>">
			    <input type="hidden" name="passengerType" value="<%= toLocation %>">
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
        <div class="accordion" id="flightAccordion">
            <%
                int index = 0;
                for (Flight flight : flights) {
                    index++;
            %>
            <div class="accordion-item">
                <h2 class="accordion-header" id="heading<%= index %>">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%= index %>" aria-expanded="false" aria-controls="collapse<%= index %>">
                        <strong><%= flight.getAirline() %> - Flight <%= flight.getFlightNumber() %></strong> 
                        | From: <%= flight.getFromLocation() %> → To: <%= flight.getToLocation() %>
                    </button>
                </h2>
                <div id="collapse<%= index %>" class="accordion-collapse collapse show" aria-labelledby="heading<%= index %>">
                    <div class="accordion-body">
                        <!-- Row 1: Flight Route -->
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <h6>From:</h6>
                                <p><%= flight.getFromLocation() %></p>
                            </div>
                            <div class="col-md-6">
                                <h6>To:</h6>
                                <p><%= flight.getToLocation() %></p>
                            </div>
                        </div>
                        <!-- Row 2: Dates and Times -->
                        <div class="row mb-3">
                            <div class="col-md-3">
                                <h6>Departure Date:</h6>
                                <p><%= flight.getDepartureDate() %></p>
                            </div>
                            <div class="col-md-3">
                                <h6>Departure Time:</h6>
                                <p><%= flight.getDepartureTime() + " UTC" %></p>
                            </div>
                            <div class="col-md-3">
                                <h6>Arrival Date:</h6>
                                <p><%= flight.getArrivalDate() %></p>
                            </div>
                            <div class="col-md-3">
                                <h6>Arrival Time:</h6>
                                <p><%= flight.getArrivalTime() + " UTC"%></p>
                            </div>
                        </div>
                        <!-- Row 3: Seat Types and Booking -->
                        <div class="row">
                            <!-- Economy Class -->
                            <div class="col-md-4">
                                <div class="border p-3">
                                    <h6 class="text-success">Economy Class</h6>
                                    <p>Price: $<%= String.format("%.2f", flight.getEconomyPrice()) %></p>
                                    <p>Seats Available: <%= flight.getEconomySeatsAvailable() %></p>
                                    <form action="${pageContext.request.contextPath}/views/bookingdetails.jsp" method="post">
                                    	<input type="hidden" name="flightId" value="<%=flight.getFlightID()%>">
										<input type="hidden" name="fromLocation" value="<%=fromLocation%>">
										<input type="hidden" name="toLocation" value="<%=toLocation%>">
										<input type="hidden" name="departureTime" value="<%=flight.getDepartureTime()%>">
										<input type="hidden" name="arrivalTime" value="<%=flight.getArrivalTime()%>">
										<input type="hidden" name="departureDate" value="<%=flight.getDepartureDate()%>">
										<input type="hidden" name="arrivalDate" value="<%=flight.getArrivalDate()%>">
										<input type="hidden" name="price" value="<%=flight.getEconomyPrice()%>">
										<input type="hidden" name="travelClass" value="EC">
                                        <input type="hidden" name="flightNumber" value="<%= flight.getFlightNumber() %>">
                                        <button type="submit" class="btn btn-success btn-sm" 
                                        <%=flight.getEconomySeatsAvailable() == 0 ? "disabled" : "" %>>Book Economy</button>
                                    </form>
                                </div>
                            </div>
                            <!-- Business Class -->
                            <div class="col-md-4">
                                <div class="border p-3">
                                    <h6 class="text-info">Business Class</h6>
                                    <p>Price: $<%= String.format("%.2f", flight.getBusinessPrice()) %></p>
                                    <p>Seats Available: <%= flight.getBusinessSeatsAvailable() %></p>
                                    <form action="${pageContext.request.contextPath}/views/bookingdetails.jsp" method="post">
                                        <input type="hidden" name="flightId" value="<%=flight.getFlightID()%>">
										<input type="hidden" name="fromLocation" value="<%=fromLocation%>">
										<input type="hidden" name="toLocation" value="<%=toLocation%>">
										<input type="hidden" name="departureTime" value="<%=flight.getDepartureTime()%>">
										<input type="hidden" name="arrivalTime" value="<%=flight.getArrivalTime()%>">
										<input type="hidden" name="departureDate" value="<%=flight.getDepartureDate()%>">
										<input type="hidden" name="arrivalDate" value="<%=flight.getArrivalDate()%>">
										<input type="hidden" name="price" value="<%=flight.getBusinessPrice()%>">
										<input type="hidden" name="travelClass" value="BC">
                                        <input type="hidden" name="flightNumber" value="<%= flight.getFlightNumber() %>">
                                        <button type="submit" class="btn btn-info btn-sm"
                                        <%=flight.getBusinessSeatsAvailable() == 0 ? "disabled" : "" %>>Book Business</button>
                                    </form>
                                </div>
                            </div>
                            <!-- First Class -->
                            <div class="col-md-4">
                                <div class="border p-3">
                                    <h6 class="text-danger">First Class</h6>
                                    <p>Price: $<%= String.format("%.2f", flight.getFirstClassPrice()) %></p>
                                    <p>Seats Available: <%= flight.getFirstSeatsAvailable() %></p>
                                    <form action="${pageContext.request.contextPath}/views/bookingdetails.jsp" method="post">
                                    	<input type="hidden" name="flightId" value="<%=flight.getFlightID()%>">
										<input type="hidden" name="fromLocation" value="<%=fromLocation%>">
										<input type="hidden" name="toLocation" value="<%=toLocation%>">
										<input type="hidden" name="departureTime" value="<%=flight.getDepartureTime()%>">
										<input type="hidden" name="arrivalTime" value="<%=flight.getArrivalTime()%>">
										<input type="hidden" name="departureDate" value="<%=flight.getDepartureDate()%>">
										<input type="hidden" name="arrivalDate" value="<%=flight.getArrivalDate()%>">
										<input type="hidden" name="price" value="<%=flight.getFirstClassPrice()%>">
										<input type="hidden" name="travelClass" value="FC">
                                        <input type="hidden" name="flightNumber" value="<%= flight.getFlightNumber() %>">
                                        <button type="submit" class="btn btn-danger btn-sm"
                                        <%=flight.getFirstSeatsAvailable() == 0 ? "disabled" : "" %>>Book First Class</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <%
            } else {
        %>
        <div class="alert alert-warning" role="alert">
            No flights available for the selected criteria.
        </div>
        <%
            }
        %>
    </div>
		
<jsp:include page="/views/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
