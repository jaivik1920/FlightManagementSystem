<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Flight Details & Booking</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
</head>
<body>
    <div class="container mt-4">
        <h2>Flight Details & Booking</h2>
        <!-- Flight Details Recap -->
        <div class="card mb-4">
            <div class="card-body">
                <h5 class="card-title">Flight Details</h5>
                <p><strong>Origin:</strong> <%= request.getParameter("fromLocation")%></p>
                <p><strong>Destination:</strong><%=request.getParameter("toLocation")%></p>
                <p><strong>Departure Time:</strong> <%=request.getParameter("departureTime")%></p>
                <p><strong>Arrival Time:</strong> <%=request.getParameter("arrivalTime")%></p>
                <p><strong>Travel Class:</strong> <%=request.getParameter("travelClass")%></p>
                <p><strong>Price:</strong> <%=request.getParameter("price")%></p>
            </div>
        </div>

        <!-- Passenger Form -->
        <form action="${pageContext.request.contextPath}/BookingServlet" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="flightId" value="<%=request.getParameter("flightId")%>">
			<input type="hidden" name="travelClass" value="<%=request.getParameter("travelClass")%>">
            <div class="mb-3">
                <label for="fullName" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" required>
                <div class="invalid-feedback">Please provide the passenger's full name.</div>
            </div>

            <div class="mb-3">
                <label for="age" class="form-label">Age</label>
                <input type="number" class="form-control" id="age" name="age" required>
                <div class="invalid-feedback">Please provide the passenger's age.</div>
            </div>

            <div class="mb-3">
                <label for="passportNumber" class="form-label">Passport Number</label>
                <input type="text" class="form-control" id="passportNumber" name="passportNumber" required>
                <div class="invalid-feedback">Please provide a valid passport number.</div>
            </div>

            <div class="mb-3">
                <label for="contactDetails" class="form-label">Contact Details</label>
                <input type="text" class="form-control" id="contactDetails" name="contactDetails" required>
                <div class="invalid-feedback">Please provide the contact details.</div>
            </div>

            <button type="submit" class="btn btn-primary">Confirm Booking</button>
        </form>
    </div>

    <script src="js/bootstrap.bundle.min.js"></script>
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
