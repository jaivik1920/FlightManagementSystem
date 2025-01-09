<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Travel Essentials - GujjuSkies</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  	<link href="${pageContext.request.contextPath}/static/css/travelessentials.css" rel="stylesheet">
  	
</head>
<body>
	<%
	request.setAttribute("navtab", "TravelEssentials");
	%>
    <jsp:include page="/views/navbar.jsp" />
    
    <div class="container mt-5">
        <h2 class="section-header">GujjuSkies Travel Essentials</h2>
        <p class="section-content">At GujjuSkies, we strive to make your travel experience as smooth and comfortable as possible. Please review our Travel Essentials guide to ensure you're fully prepared for your upcoming journey.</p>

        <div class="card">
            <div class="card-header">
                <h4 class="section-subheader text-white">Baggage Guidelines</h4>
            </div>
            <div class="card-body">
                <p class="section-content">
                    When flying with GujjuSkies, it's important to be aware of our baggage policies to avoid any inconvenience during your travels. Below are the general baggage guidelines:
                </p>
                <ul class="section-content">
                    <li><strong>Carry-on baggage:</strong> You are allowed to carry one personal item (e.g., a laptop bag, handbag, or backpack) and one standard carry-on bag not exceeding 10kg in weight. Please ensure the carry-on bag fits in the overhead compartments.</li>
                    <li><strong>Checked baggage:</strong> Economy class passengers are allowed 1 checked bag (up to 23kg). Business and First-Class passengers are allowed up to 2 checked bags (up to 32kg per bag).</li>
                    <li><strong>Special items:</strong> Items like sports equipment, musical instruments, and fragile items can be carried but may be subject to additional charges. Always check with the airline for special handling requests.</li>
                </ul>
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                <h4 class="section-subheader text-white">Travel Documents Guidelines</h4>
            </div>
            <div class="card-body">
                <p class="section-content">
                    To ensure smooth travel, please ensure you have all the required documents before your flight:
                </p>
                <ul class="section-content">
                    <li><strong>Passport:</strong> Make sure your passport is valid for at least 6 months from the date of your return. Ensure you have the appropriate visa if required by your destination country.</li>
                    <li><strong>Ticket Confirmation:</strong> Please have your electronic ticket or print-out ready for check-in at the airport.</li>
                    <li><strong>Travel Insurance:</strong> It is recommended to have travel insurance for medical emergencies, cancellations, or delays.</li>
                    <li><strong>Vaccination Certificates:</strong> Some destinations may require proof of vaccination. Be sure to check the specific health requirements for your destination.</li>
                </ul>
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                <h4 class="section-subheader text-white">Health & Medical Assistance</h4>
            </div>
            <div class="card-body">
                <p class="section-content">
                    GujjuSkies prioritizes your health and safety during your travels. Here's what you need to know regarding health and medical assistance:
                </p>
                <ul class="section-content">
                    <li><strong>Onboard Medical Assistance:</strong> We have trained flight attendants who can assist with minor health concerns during the flight. In case of a medical emergency, please inform the crew immediately.</li>
                    <li><strong>Medical Oxygen:</strong> If you require supplemental oxygen, please notify us at least 48 hours before your flight, and we will make necessary arrangements.</li>
                    <li><strong>Health Protocols:</strong> In response to ongoing global health concerns, we adhere to all necessary health and hygiene protocols, including cleaning and sanitizing our aircraft, providing face masks, and maintaining social distancing whenever possible.</li>
                    <li><strong>Travel Health Insurance:</strong> We highly recommend purchasing travel health insurance to cover any medical emergencies during your trip.</li>
                </ul>
            </div>
        </div>

        <p class="text-center mt-5"><strong>We hope you have a safe and pleasant journey with GujjuSkies!</strong></p>
    </div>

    <jsp:include page="/views/footer.jsp" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
