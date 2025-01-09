<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">
			<div>
			<h3>GujjuSkies</h3>
			<span>Connecting India & Canada, the Gujju Way!</span>
			</div>
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item fs-4"><a class="nav-link <%= "Booking".equals(request.getAttribute("navtab")) ? "active" : "" %>"
						href="${pageContext.request.contextPath}/views/booking.jsp">Book Flight</a></li>
					<li class="nav-item fs-4"><a class="nav-link <%= "TravelEssentials".equals(request.getAttribute("navtab")) ? "active" : "" %>"
						href="${pageContext.request.contextPath}/views/travelessentials.jsp">Travel Essentials</a></li>
					<li class="nav-item fs-4"><a class="nav-link <%= "OurPartners".equals(request.getAttribute("navtab")) ? "active" : "" %>"
						href="${pageContext.request.contextPath}/views/ourpartner.jsp">Our Partners</a></li>
					<li class="nav-item fs-4"><a class="nav-link <%= "HelpSupport".equals(request.getAttribute("navtab")) ? "active" : "" %>"
						href="${pageContext.request.contextPath}/views/help.jsp">Help/Support</a></li>
					<%
					if (session.getAttribute("user") == null) {
					%>
					<li class="nav-item fs-4"><a class="nav-link <%= "SignIn".equals(request.getAttribute("navtab")) ? "active" : "" %>"
					 href="${pageContext.request.contextPath}/views/signin.jsp">Login/Sign Up</a>
					</li>
					<%
					} else {
					%>
					<li class="nav-item fs-4"><a class="nav-link <%= "MyProfile".equals(request.getAttribute("navtab")) ? "active" : "" %>"
					 href="${pageContext.request.contextPath}/views/myprofile.jsp">My
							Profile</a></li>
					<li class="nav-item fs-4"><a class="nav-link <%= "MyBookings".equals(request.getAttribute("navtab")) ? "active" : "" %>"
					 href="${pageContext.request.contextPath}/UserHomePage">My
							Bookings</a></li>
					<li class="nav-item fs-4"><a class="nav-link"
					 href="${pageContext.request.contextPath}/Logout">Logout</a>
					</li>
					<%
					}
					%>

				</ul>
			</div>
		</div>
	</nav>
