<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
	<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
	<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>Read Share</title>
		<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
		<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
		<link rel="stylesheet" type="text/css" href="/css/style.css">
		<script type="text/javascript" src="/js/app.js"></script>
	</head>
	<body style="background-color:#0f192e;color:#e5e5e5">
		<div class="container col-10 offset-1 mt-4">
			<h1 style="color:#FCA311;">Book Club</h1>
			<h2 class="fst-italic">A place for friends to share their thoughts on books</h2>
			<div class="forms d-flex justify-content-between mt-5">
				<div class="form-left col-5 border border-secondary-subtle rounded-5 p-4" style="background-color:#14213d">
					<form:form action="/register" method="post" modelAttribute="newUser" class="form">
						<h3>Register</h3>
						<div class="form-group">
							<form:label path="name">Name</form:label><br />
							<form:errors path="name" class="text-danger"/>
							<form:input path="name" class="form-control mb-2"/>
						</div>
						<div class="form-group">
							<form:label path="email">Email</form:label><br />
							<form:errors path="email" class="text-danger"/>
							<form:input path="email" class="form-control mb-2"/>						
						</div>
						<div class="form-group">
							<form:label path="password">Password</form:label><br />
							<form:errors path="password" class="text-danger" htmlEscape="false"/>
							<form:input type="password" path="password" class="form-control mb-2"/>						
						</div>
						<div class="form-group">
							<form:label path="confirm">Confirm Password</form:label><br />
							<form:errors path="confirm" class="text-danger"/>
							<form:input type="password" path="confirm" class="form-control mb-2"/>						
						</div>
						<input type="submit" value="register" class="btn mt-2 rounded-pill " style="background-color:#FCA311;"/>
					</form:form>
				</div>
				<div class="form-right col-5 border border-secondary-subtle rounded-5 p-4 my-auto" style="background-color:#14213d">
					<form:form action="/login" method="post" modelAttribute="newLogin" class="form">
						<h3>Login</h3>
						<div class="form-group">
							<form:label path="email">Email</form:label><br />
							<form:errors path="email" class="text-danger"/>
							<form:input path="email" class="form-control mb-2"/>							
						</div>
						<div class="form-group">
							<form:label path="password">Password</form:label><br />
							<form:errors path="password" class="text-danger"/>
							<form:input type="password" path="password" class="form-control mb-2"/>									
						</div>		
						<input type="submit" value="login" class="btn mt-2 rounded-pill" style="background-color:#FCA311;"/>				
					</form:form>				
				</div>
			</div>
		</div>
	</body>
</html>