<!DOCTYPE html>
<%@page import="java.util.HashMap"%>
<%@page import="utility.Constants"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flight Details & Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="${pageContext.request.contextPath}/static/css/bookingdetails.css" rel="stylesheet">
</head>
<body>
<% request.setAttribute("navtab", "Booking"); %>
<jsp:include page="/views/navbar.jsp" />
<div class="container mt-4">
	    <div class="progress" style="height: 30px;">
	        <div class="progress-bar bg-primary" role="progressbar" style="width: 33.33%;" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">Step 1: Search Flights</div>
	    	<div class="progress-bar bg-primary" role="progressbar" style="width: 33.33%;" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">Step 2: Choose Flight</div>
	        <div class="progress-bar bg-secondary" role="progressbar" style="width: 33.33%;" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100">Step 3: Confirm Booking</div>
	    </div>
</div>

<div class="container booking-container mt-5">
    <div class="card">
        <div class="header-section">
            <h2>Flight Booking</h2>
            <p>Complete your booking details below</p>
        </div>

        <% HashMap<String, String> airportMap = Constants.AIRPORTCODE_WITH_AIRPORTNAMES; %>
        <div class="summary-section">
            <h5 class="mb-3">Flight Details : <%= request.getParameter("flightNumber") %></h5>
            <div class="row">
                <div class="col-md-6">
                    <p><strong>Origin:</strong> <%= airportMap.get(request.getParameter("fromLocation")) %></p>
                    <p><strong>Destination:</strong> <%= airportMap.get(request.getParameter("toLocation")) %></p>
                </div>
                <div class="col-md-6">
                    <p><strong>Departure:</strong> <%= request.getParameter("departureDate") %> (<%= request.getParameter("departureTime")%>) </p>
                    <p><strong>Arrival:</strong> <%= request.getParameter("arrivalDate") %> (<%= request.getParameter("arrivalTime") %>)</p>
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-md-6">
                    <p><strong>Travel Class:</strong> <%= request.getParameter("travelClass") %></p>
                </div>
                <div class="col-md-6">
                    <p><strong>Price:</strong> $<%= request.getParameter("price") %></p>
                </div>
            </div>
        </div>

        <!-- Passenger Form -->
        <form action="${pageContext.request.contextPath}/BookingServlet" method="post" class="needs-validation form-section" novalidate>
        	<input type="hidden" name="action" value="bookflight">
            <input type="hidden" name="flightId" value="<%= request.getParameter("flightId") %>">
            <input type="hidden" name="travelClass" value="<%= request.getParameter("travelClass") %>">

            <div class="mb-3">
                <label for="fullName" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Enter your full name" required>
                <div class="invalid-feedback">Please provide the passenger's full name.</div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-3">
                    <label for="age" class="form-label">Age</label>
                    <input type="number" class="form-control" id="age" name="age" placeholder="Enter age" required>
                    <div class="invalid-feedback">Please provide the passenger's age.</div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="passportNumber" class="form-label">Passport Number</label>
                    <input type="text" class="form-control" id="passportNumber" name="passportNumber" placeholder="Enter passport number" required>
                    <div class="invalid-feedback">Please provide a valid passport number.</div>
                </div>
            </div>

            <div class="mb-3">
                <label for="contactDetails" class="form-label">Contact Details</label>
                <input type="text" class="form-control" id="contactDetails" name="contactDetails" placeholder="Enter phone or email" required>
                <div class="invalid-feedback">Please provide the contact details.</div>
            </div>

            <button type="submit" class="btn btn-primary mt-3">Confirm Booking</button>
        </form>
    </div>
</div>

<jsp:include page="/views/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
    (function () {
        'use strict';
        var forms = document.querySelectorAll('.needs-validation');
        Array.prototype.slice.call(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });
    })();
</script>
</body>
</html>
