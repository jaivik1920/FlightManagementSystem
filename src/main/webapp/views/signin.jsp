<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign in</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
</head>
<body>
	<form action="${pageContext.request.contextPath}/RootServlet" method = "post">
		<input type="hidden" name="action" value = "signin"> 
		<div class="form-floating mb-3">
			<input type="email" class="form-control" id="floatingInput" name="emailid"> 
			<label for="floatingInput">Email address</label>
		</div>
		<div class="form-floating">
			<input type="password" class="form-control" id="floatingPassword" name="password"> 
			<label for="floatingPassword">Password</label>
		</div>
		<button type="submit" class="btn btn-outline-primary btn-lg">Sign In</button>
		<a href="views/signup.jsp">Don't have an account? Click Here</a>
	</form>
</body>
</html>