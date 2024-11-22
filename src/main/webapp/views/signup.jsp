<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create an Account</title>
<link rel="stylesheet" href="../css/bootstrap.min.css" />
</head>
<body>
	<form action="${pageContext.request.contextPath}/RootServlet" method = "post">
	<input type="hidden" name="action" value = "signup"> 
	<div class="row g-2">
        <div class="col-md">
          <div class="form-floating">
            <input type="text" class="form-control" id="firstname" name="firstname">
  			<label for="firstname">First/Given Name</label>
          </div>
        </div>
        <div class="col-md">
          <div class="form-floating">
            <input type="text" class="form-control" id="lastname" name="lastname">
  			<label for="lastname">Last Name/Surname</label>
          </div>
        </div>
      </div>
      <div class="row g-2">
        <div class="col-md">
          <div class="form-floating">
            <select
              class="form-select"
              id="nationality_code"
              name="nationality_code"
              aria-label="Nationality"
              required
            >
              <option value="IN" selected>Indian</option>
              <option value="CA">Canadian</option>
              <option value="US">United State of America</option>
              <option value="US">Pakistan</option>
              <option value="DE">German</option>
            </select>
            <label for="nationality_code">Nationality</label>
          </div>
        </div>
        <div class="col-md">
          <div class="form-floating">
            <input type="date" class="form-control" id="date_of_birth" name="date_of_birth">
  			<label for="date_of_birth">Date of Birth</label>
          </div>
        </div>
      </div>
      <div class="row g-2">
        <div class="col-md">
          <div class="form-floating">
            <input type="email" class="form-control" id="emailid" name="emailid">
  			<label for="emailid">Email</label>
          </div>
        </div>
        <div class="col-md">
          <div class="form-floating">
            <input type="text" class="form-control" id="cemailid">
  			<label for="cemailid">Confirm Email</label>
          </div>
        </div>
      </div>
      <div class="row g-2">
        <div class="col-md">
          <div class="form-floating">
            <input type="password" class="form-control" id="password" name="password">
  			<label for="password">Password</label>
          </div>
        </div>
        <div class="col-md">
          <div class="form-floating">
            <input type="password" class="form-control" id="cpassword">
  			<label for="cpassword">Confirm Password</label>
          </div>
        </div>
      </div>
      <div class="row g-2">
        <div class="col-md">
          <div class="form-floating">
            <input type="tel" class="form-control" id="mobile_number" name="mobile_number">
  			<label for="mobile_number">Mobile Number</label>
          </div>
        </div>
        <div class="col-md">
          <div class="form-floating">
            <input type="tel" class="form-control" id="cmobile_number">
  			<label for="cmobile_number">Confirm Mobile Number</label>
          </div>
        </div>
      </div>
      <button type="submit" class="btn btn-outline-primary btn-lg">Create an Account</button>
	</form>
</body>
</html>