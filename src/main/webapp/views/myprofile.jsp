<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/static/css/myprofile.css" rel="stylesheet">
</head>
<body class="bg-light">
<% request.setAttribute("navtab", "MyProfile"); %>
<jsp:include page="/views/navbar.jsp" />

<%

if(session.getAttribute("user") == null)
{
	response.sendRedirect(request.getContextPath()+"/views/signin.jsp");
}
%>
 <% if (request.getAttribute("error") != null || request.getAttribute("msg") != null) { %>
        <div class="alert alert-dismissible fade show 
            <%= request.getAttribute("error") != null ? "alert-danger" : "alert-success" %>" role="alert">
            <strong>
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : request.getAttribute("msg") %>
            </strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } %>
<div class="profile-container">
    <div class="profile-header">
        <h2>My Profile</h2>
        <p class="text-muted">Manage your account details and settings</p>
    </div>

    <div class="profile-card">
        <h4>User Details</h4>
        <div class="row">
            <div class="col-md-6">
                <p><strong>First Name:</strong> ${user.firstname}</p>
                <p><strong>Last Name:</strong> ${user.lastname}</p>
                <p><strong>Email:</strong> ${user.emailid}</p>
            </div>
            <div class="col-md-6">
                <p><strong>Nationality:</strong> ${user.nationality_code}</p>
                <p><strong>Date of Birth:</strong> ${user.date_of_birth}</p>
                <p><strong>Mobile Number:</strong> ${user.mobile_number}</p>
            </div>
        </div>
        <hr>
        <p class="text-muted"><strong>Account Created:</strong> ${user.date_created}</p>
        <button type="button" class="btn btn-reset" data-bs-toggle="modal" data-bs-target="#passwordResetModal">Reset Password</button>
    </div>

    <div class="profile-card">
        <h4>Update Profile</h4>
        <form action="${pageContext.request.contextPath}/UserHomePage" method="post">
            <input type="hidden" name="action" value="updateProfile">
            <div class="mb-3">
                <label for="firstname" class="form-label">First Name</label>
                <input type="text" class="form-control" id="firstname" name="firstname" value="${user.firstname}" required>
            </div>
            <div class="mb-3">
                <label for="lastname" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="lastname" name="lastname" value="${user.lastname}" required>
            </div>
            <div class="mb-3">
                <label for="emailid" class="form-label">Email</label>
                <input type="email" class="form-control" id="emailid" name="emailid" value="${user.emailid}" required>
            </div>
            <div class="mb-3">
                <label for="mobile_number" class="form-label">Mobile Number</label>
                <input type="tel" class="form-control" id="mobile_number" name="mobile_number" value="${user.mobile_number}" required>
            </div>
            <button type="submit" class="btn btn-outline-primary">Update Profile</button>
        </form>
    </div>
</div>

<div class="modal fade" id="passwordResetModal" tabindex="-1" aria-labelledby="passwordResetModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="${pageContext.request.contextPath}/UserHomePage" method="post">
                <input type="hidden" name="action" value="resetPassword">
                <div class="modal-header">
                    <h5 class="modal-title" id="passwordResetModalLabel">Reset Password</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="current_password" class="form-label">Current Password</label>
                        <input type="password" class="form-control" id="current_password" name="current_password" required>
                    </div>
                    <div class="mb-3">
                        <label for="new_password" class="form-label">New Password</label>
                        <input type="password" class="form-control" id="new_password" name="new_password" required>
                    </div>
                    <div class="mb-3">
                        <label for="confirm_password" class="form-label">Confirm New Password</label>
                        <input type="password" class="form-control" id="confirm_password" name="confirm_password" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-reset">Reset Password</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
