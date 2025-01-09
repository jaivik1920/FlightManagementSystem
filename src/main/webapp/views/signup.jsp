<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create an Account</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<style>

 .form-container {
        max-width: 600px;
        margin: 50px auto;
        padding: 2rem;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        border-radius: 15px;
        background-color: white;
    }
    .btn-lg {
        width: 100%;
    }
</style>
</head>
<body class="bg-light">
<% request.setAttribute("navtab", "SignIn"); %>
<jsp:include page="/views/navbar.jsp" />

<h1 class="hero-title text-dark text-center mt-2">Gujjuskies: Soaring to New Heights</h1>
<div class="form-container">
<% if (request.getAttribute("error") != null || request.getAttribute("msg") != null) { %>
        <div class="alert alert-dismissible fade show 
            <%= request.getAttribute("error") != null ? "alert-danger" : "alert-success" %>" role="alert">
            <strong>
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : request.getAttribute("msg") %>
            </strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <% } %>
    <h2 class="text-center mb-4">Create an Account</h2>
    <form action="${pageContext.request.contextPath}/RootServlet" method="post" class="needs-validation" novalidate>
        <input type="hidden" name="action" value="signup"> 

        <div class="row g-2 mb-3">
            <div class="col-md">
                <label for="firstname" class="form-label">First Name</label>
                <input type="text" class="form-control" id="firstname" name="firstname" required>
                <div class="invalid-feedback">Please enter your first name.</div>
                
            </div>
            <div class="col-md">
                <label for="lastname" class="form-label">Last Name</label>
                <input type="text" class="form-control" id="lastname" name="lastname" required>
                <div class="invalid-feedback">Please enter your last name.</div>
            </div>
        </div>

        <div class="row g-2 mb-3">
            <div class="col-md">
                <label for="nationality_code" class="form-label">Nationality</label>
                <select class="form-select" id="nationality_code" name="nationality_code" required>
                    <option value="IN" selected>Indian</option>
                    <option value="CA">Canadian</option>
                    <option value="US">United States</option>
                    <option value="PK">Pakistan</option>
                    <option value="DE">German</option>
                </select>
                <div class="invalid-feedback">Please select your nationality.</div>
            </div>
            <div class="col-md">
                <label for="date_of_birth" class="form-label">Date of Birth</label>
                <input type="date" class="form-control" id="date_of_birth" name="date_of_birth" required>
                <div class="invalid-feedback">Please enter your date of birth.</div>
            </div>
        </div>

        <div class="row g-2 mb-3">
            <div class="col-md">
                <label for="emailid" class="form-label">Email</label>
                <input type="email" class="form-control" id="emailid" name="emailid" required>
                <div class="invalid-feedback">Please enter a valid email.</div>
            </div>
            <div class="col-md">
                <label for="cemailid" class="form-label">Confirm Email</label>
                <input type="email" class="form-control" id="cemailid" name="cemailid" required>
                <div class="invalid-feedback">Email doesn't match</div>
            </div>
        </div>

        <div class="row g-2 mb-3">
            <div class="col-md">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
                <div class="invalid-feedback">Password must be at least 7 characters long, include a letter, a number, and a special character.</div>

            </div>
            <div class="col-md">
                <label for="cpassword" class="form-label">Confirm Password</label>
                <input type="password" class="form-control" id="cpassword" name="cpassword" required>
                <div class="invalid-feedback">Password doesn't match.</div>
            </div>
        </div>

        <div class="row g-2 mb-3">
            <div class="col-md">
                <label for="mobile_number" class="form-label">Mobile Number</label>
                <input type="tel" class="form-control" id="mobile_number" name="mobile_number" required>
                <div class="invalid-feedback">Please enter your mobile number.</div>
            </div>
            <div class="col-md">
                <label for="cmobile_number" class="form-label">Confirm Mobile Number</label>
                <input type="tel" class="form-control" id="cmobile_number" name="cmobile_number" required>
                <div class="invalid-feedback">Mobile number doesn't match.</div>
            </div>
        </div>
        <button type="submit" class="btn btn-outline-primary btn-lg">Create Account</button>
    </form>
    <div class="text-center mt-3">
       <a href="${pageContext.request.contextPath}/views/signin.jsp">Already have an account? Sign in here</a>
    </div>
</div>
<jsp:include page="/views/footer.jsp" />
<script>
    (function () {
        'use strict';

        var forms = document.querySelectorAll('.needs-validation');
        Array.prototype.slice.call(forms).forEach(function (form) {
            form.addEventListener('submit', function (event) {
                if ( !emailMatch() || !passwordCheck() ||  !mobileNumberMatch() || !form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        });

        const emailMatch = () => {
            const email = document.getElementById('emailid').value;
            const confirmEmail = document.getElementById('cemailid').value;

            if (email !== confirmEmail) {
                document.getElementById('cemailid').setCustomValidity("Emails don't match.");
                return false;
            } else {
                document.getElementById('cemailid').setCustomValidity("");
                return true;
            }
        };

        const passwordCheck = () => {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('cpassword').value;

            const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&#])[A-Za-z\d@$!%*?&#]{7,}$/;

            if (!passwordRegex.test(password)) {
                document.getElementById('password').setCustomValidity("Password must be at least 7 characters long, include a letter, a number, and a special character.");
                return false;
            } else if (password !== confirmPassword) {
                document.getElementById('cpassword').setCustomValidity("Passwords don't match.");
                document.getElementById('password').setCustomValidity("");
                return false;
            } else {
                document.getElementById('password').setCustomValidity("");
                document.getElementById('cpassword').setCustomValidity("");
                return true;
            }
        };


        const mobileNumberMatch = () => {
            const mobileNumber = document.getElementById('mobile_number').value;
            const confirmMobileNumber = document.getElementById('cmobile_number').value;

            if (mobileNumber !== confirmMobileNumber) {
                document.getElementById('cmobile_number').setCustomValidity("Mobile numbers don't match.");
                return false;
            } else {
                document.getElementById('cmobile_number').setCustomValidity("");
                return true;
            }
        };
        
    })();
</script>
<script src="${pageContext.request.contextPath}/static/js/signup.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
