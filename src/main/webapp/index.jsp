<%@page import="java.util.List"%>
<%@page import="models.Flight"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Flight Booking</title>
    <link rel="stylesheet" href="css/bootstrap.min.css" />
  </head>
  <body>
  
  	<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
            session.invalidate();
        }
%>
  
    <form action="${pageContext.request.contextPath}/RootServlet" method = "post" class="needs-validation" novalidate>
    	<input type="hidden" name="action" value = "flightsearch"> 
      <div class="row g-3">
        <div class="col-md">
          <div class="form-floating">
            <select
              class="form-select"
              id="travelClass"
              name="travelClass"
              aria-label="Travel Class"
              required
            >
              <option value="BC" selected>Business Class</option>
              <option value="EC">Economy Class</option>
              <option value="FC">First Class</option>
            </select>
            <label for="travelClass">Travel Class</label>
            <div class="invalid-feedback">Please select a travel class.</div>
          </div>
        </div>
        <div class="col-md">
          <div class="form-floating">
            <select
              class="form-select"
              id="passengerType"
              name="passengerType"
              aria-label="Passengers"
              required
            >
              <option value="Adults" selected>Adults</option>
              <option value="Child">Children</option>
            </select>
            <label for="passengerType">Passengers</label>
            <div class="invalid-feedback">Please select the passenger type.</div>
          </div>
        </div>
        <div class="col-md">
          <div class="form-floating">
            <select
              class="form-select"
              id="numPassenger"
              name= "numPassenger"
              aria-label="Number of Passenger"
              required
            >
              <option value="1" selected>1</option>
              <option value="2">2</option>
            </select>
            <label for="numPassenger">Number of Passenger</label>
            <div class="invalid-feedback">Please select the number of passengers.</div>
          </div>
        </div>
      </div>

      <div class="row g-4">
        <div class="col-md">
          <div class="form-floating">
            <select
              class="form-select"
              id="fromLocation"
              name="fromLocation"
              required
            >
              <option value="YYZ" selected>Toronto,ON,CA</option>
              <option value="DEL">Delhi,India</option>
              <option value="BOM">Mumbai,India</option>
              <option value="YVR">Vancouver,Canada</option>
              <option value="YEA">Edmonton,Canada</option>
            </select>
            <label for="fromLocation">From</label>
            <div class="invalid-feedback">Please enter the departure location.</div>
          </div>
        </div>
        <div class="col-md">
          <div class="form-floating">
            <select
              class="form-select"
              id="toLocation"
              name="toLocation"
              required
            >
              <option value="YYZ" selected>Toronto,ON,CA</option>
              <option value="DEL">Delhi,India</option>
              <option value="BOM">Mumbai,India</option>
              <option value="YVR">Vancouver,Canada</option>
              <option value="YEA">Edmonton,Canada</option>
            </select>
            <label for="toLocation">To</label>
            <div class="invalid-feedback">Please enter the destination location.</div>
          </div>
        </div>
        <div class="col-md">
          <div class="form-floating">
            <input type="date" class="form-control" id="departureDate" name="departureDate" required />
            <label for="departureDate">Departure</label>
            <div class="invalid-feedback">Please select a departure date.</div>
          </div>
        </div>
        <div class="col-md">
          <button type="submit" class="btn btn-primary">Search</button>
        </div>
      </div>
    </form>
 <%
      List<Flight> flights = (List<Flight>)request.getAttribute("flights");
      if (flights != null && !flights.isEmpty()) {
    %>
      <h2 class="mt-4">Available Flights</h2>
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
          </tr>
        </thead>
        <tbody>
          <%
            for (Flight flight : flights) {
          %>
            <tr>
              <td><%= flight.getAirline() %></td>
              <td><%= flight.getDepartureTime() %></td>
              <td><%= flight.getArrivalTime() %></td>
              <td><%= flight.getEconomySeatsAvailable() %></td>
              <td><%= flight.getBusinessSeatsAvailable() %></td>
              <td><%= flight.getFirstSeatsAvailable() %></td>
              <td><%= String.format("$%.2f", flight.getEconomyPrice()) %></td>
              <td><%= String.format("$%.2f", flight.getBusinessPrice()) %></td>
              <td><%= String.format("$%.2f", flight.getFirstClassPrice()) %></td>
            </tr>
          <%
            }
          %>
        </tbody>
      </table>
       <%
          }
       %>
    <script src="js/bootstrap.bundle.min.js"></script>

    <script>
      // Example starter JavaScript for disabling form submissions if there are invalid fields
      (function () {
        'use strict'
        
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll('.needs-validation')
        
        // Loop over them and prevent submission
        Array.prototype.slice.call(forms)
          .forEach(function (form) {
            form.addEventListener('submit', function (event) {
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
