<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Our Partners - GujjuSkies</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	 <link href="${pageContext.request.contextPath}/static/css/ourpartner.css" rel="stylesheet">
</head>
<body>
	<%
	request.setAttribute("navtab", "OurPartners");
	%>
    <jsp:include page="/views/navbar.jsp" />

    <div class="header-section">
        <h1>Our Esteemed Partners</h1>
        <p class="lead">We are proud to collaborate with top businesses from Gujarat to offer unparalleled services and innovation in the aviation industry.</p>
    </div>

    <div class="container partner-section">
        <div class="row">
            <div class="col-md-4">
                <div class="partner-card">
                    <img src="../static/images/reliencelogo.png" alt="Reliance Industries">
                    <div class="partner-card-body">
                        <h5 class="partner-card-title">Reliance Industries</h5>
                        <p class="partner-card-text">Reliance Industries is India's largest conglomerate, with interests in energy, petrochemicals, natural gas, retail, and telecommunications. Their collaboration with GujjuSkies helps bring innovation and sustainability to air travel.</p>
                        <a href="https://www.ril.com/" target="_blank" class="button-custom">Learn More</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="partner-card">
                    <img src="../static/images/adanilogo.png" alt="Adani Group">
                    <div class="partner-card-body">
                        <h5 class="partner-card-title">Adani Group</h5>
                        <p class="partner-card-text">Adani Group is a global leader in infrastructure development, with diverse interests in energy, ports, logistics, agribusiness, and more. Their partnership with GujjuSkies focuses on eco-friendly and cutting-edge technologies for our fleet and operations.</p>
                        <a href="https://www.adani.com/" target="_blank" class="button-custom">Learn More</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="partner-card">
                    <img src="../static/images/zyduslogo.jpg" alt="Zydus Cadila">
                    <div class="partner-card-body">
                        <h5 class="partner-card-title">Zydus Cadila</h5>
                        <p class="partner-card-text">Zydus Cadila is a multinational pharmaceutical company based in Gujarat, known for its innovative medicines. Zydus Cadila’s healthcare and medical research partnership ensures top-notch medical services for GujjuSkies passengers and crew.</p>
                        <a href="https://www.zyduslife.com/zyduslife/" target="_blank" class="button-custom">Learn More</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="testimonial-card">
                    <p><em>"Our partnership with GujjuSkies has been transformative. Together, we’re helping redefine the future of air travel by bringing top-tier services to passengers and maximizing innovation across the aviation industry."</em></p>
                    <footer>- Mukesh Ambani, Chairman & Managing Director, Reliance Industries</footer>
                </div>
            </div>
        </div>
    </div>

    <div class="footer-section">
        <p>Want to partner with GujjuSkies? <a href="${pageContext.request.contextPath}/views/help.jsp" class="button-custom">Contact Us</a></p>
    </div>

    <jsp:include page="/views/footer.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
    