<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="utility.Constants"%>
<%@page import="java.util.List"%>
<%@page import="models.Flight"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Flight Booking</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/static/css/booking.css" rel="stylesheet">
</head>
<body>
	<%
	request.setAttribute("navtab", "Booking");
	%>
	<jsp:include page="/views/navbar.jsp" />
	
	<div class="hero-section">
	    <div class="hero-content text-center">
	        <h1 class="hero-title">Book Your Dream Flight</h1>
	        <p class="hero-subtitle">Find the best deals on flights to your favorite destinations. Start your journey with us!</p>
	    </div>
	</div>
	
	<div class="container mt-4">
	    <div class="progress" style="height: 30px;">
	        <div class="progress-bar bg-secondary" role="progressbar" style="width: 33.33%;" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">Step 1: Search Flights</div>
	    	<div class="progress-bar bg-secondary" role="progressbar" style="width: 33.33%;" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">Step 2: Choose Flight</div>
	        <div class="progress-bar bg-secondary" role="progressbar" style="width: 33.33%;" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">Step 3: Confirm Booking</div>
	    </div>
	</div>
	

	<div>
		<form action="${pageContext.request.contextPath}/RootServlet"
			method="post" class="needs-validation" novalidate>
			<input type="hidden" name="action" value="flightsearch">
			<div class="row g-3">
				<div class="col-md">
					<div class="form-floating">
						<select class="form-select" id="travelClass" name="travelClass"
							aria-label="Travel Class" required>
							<option value="BC" selected>Business Class</option>
							<option value="EC">Economy Class</option>
							<option value="FC">First Class</option>
						</select> <label for="travelClass">Travel Class</label>
						<div class="invalid-feedback">Please select a travel class.</div>
					</div>
				</div>
				<div class="col-md">
					<div class="form-floating">
						<select class="form-select" id="passengerType"
							name="passengerType" aria-label="Passengers" required>
							<option value="Adults" selected>Adults</option>
							<option value="Child">Children</option>
						</select> <label for="passengerType">Passengers</label>
						<div class="invalid-feedback">Please select the passenger
							type.</div>
					</div>
				</div>
			</div>
			<div class="row g-4">
				<div class="col-md">
					<div class="form-floating">
						<select class="form-select" id="fromLocation" name="fromLocation"
							required>
							<%
							    HashMap<String, String> airportMap = Constants.AIRPORTCODE_WITH_AIRPORTNAMES;
							    for (Map.Entry<String, String> entry : airportMap.entrySet()) {
							%>
					        <option value="<%= entry.getKey() %>">
					            <%= entry.getValue() %>
					        </option>
							<%
							    }
							%>
							<!--  
							<option value="YYZ" selected>Toronto,ON,CA</option>
							<option value="DEL">Delhi,India</option>
							<option value="BOM">Mumbai,India</option>
							<option value="YVR">Vancouver,Canada</option>
							<option value="YEA">Edmonton,Canada</option>-->
						</select> <label for="fromLocation">From</label>
						<div class="invalid-feedback">Please enter the departure
							location.</div>
					</div>
				</div>
				<div class="col-md">
					<div class="form-floating">
						<select class="form-select" id="toLocation" name="toLocation"
							required>
							<%
							 for (Map.Entry<String, String> entry : airportMap.entrySet()) {
							%>
					        <option value="<%= entry.getKey() %>">
					            <%= entry.getValue() %>
					        </option>
							<%
							    }
							%>
							<!-- 
							<option value="YYZ" selected>Toronto,ON,CA</option>
							<option value="DEL">Delhi,India</option>
							<option value="BOM">Mumbai,India</option>
							<option value="YVR">Vancouver,Canada</option>
							<option value="YEA">Edmonton,Canada</option>  -->
						</select> <label for="toLocation">To</label>
						<div class="invalid-feedback">Please enter the destination
							location.</div>
					</div>
				</div>
				<div class="col-md">
					<div class="form-floating">
						<input type="date" class="form-control" id="departureDate"
							name="departureDate" required /> <label for="departureDate">Departure</label>
						<div class="invalid-feedback">Please select a departure
							date.</div>
					</div>
				</div>
				<div class="col-md">
					<button type="submit" class="btn btn-primary">Search</button>
				</div>
			</div>
		</form>

	</div>
	

	<jsp:include page="/views/footer.jsp" />

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

	<script>
	
		const today = new Date().toISOString().split('T')[0];
	    document.getElementById('departureDate').setAttribute('min', today);
		(function() {
			'use strict'

			var forms = document.querySelectorAll('.needs-validation')
			Array.prototype.slice.call(forms).forEach(function(form) {
				form.addEventListener('submit', function(event) {
					if (!form.checkValidity()) {
						event.preventDefault()
						event.stopPropagation()
					}

					form.classList.add('was-validated')
				}, false)
			})
		})()
	</script>
</body>
</html>
