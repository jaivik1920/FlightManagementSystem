<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign In</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .form-container {
            max-width: 400px;
            margin: 50px auto;
            position: relative;
            z-index: 3;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            width: 100%;
        }
    </style>
</head>
<body>
<% request.setAttribute("navtab", "SignIn"); %>
<jsp:include page="/views/navbar.jsp" />

	        <h1 class="hero-title text-center mt-5">Gujjuskies: Soaring to New Heights</h1>


<div class="container form-container">
    <% if (request.getAttribute("error") != null || request.getAttribute("msg") != null) { %>
        <div class="alert alert-dismissible fade show 
            <%= request.getAttribute("error") != null ? "alert-danger" : "alert-success" %>" role="alert">
            <strong>
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : request.getAttribute("msg") %>
            </strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } %>

    <div class="card p-4">
        <h3 class="text-center mb-4">Sign In</h3>
        <form action="${pageContext.request.contextPath}/RootServlet" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="action" value="signin">
            
            <div class="form-floating mb-3">
                <input type="email" class="form-control" id="floatingInput" name="emailid" required>
                <label for="floatingInput"><i class="fas fa-envelope me-2"></i>Email address</label>
                <div class="invalid-feedback">Please enter a valid email.</div>
            </div>

            <div class="form-floating position-relative mb-3">
                <input type="password" class="form-control" id="floatingPassword" name="password" required>
                <label for="floatingPassword"><i class="fas fa-lock me-2"></i>Password</label>
                <i class="fas fa-eye-slash toggle-password" onclick="togglePasswordVisibility()"></i>
                <div class="invalid-feedback">Please enter your password.</div>
            </div>

            <button type="submit" class="btn btn-primary">Sign In</button>
        </form>

        <div class="text-center mt-3">
            <p class="mb-0">Don't have an account? 
                <a href="${pageContext.request.contextPath}/views/signup.jsp" class="text-decoration-none">Sign Up here</a>
            </p>
        </div>
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
