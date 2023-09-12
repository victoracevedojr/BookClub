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
	<body style="background-color:#14213d;color:#e5e5e5">
		<div class="container col-10 offset-1 mt-4 ">
			<div class="d-flex justify-content-between">
				<h1 style="color:#FCA311;">Book Club</h1>
				<a href="/dashboard" class="btn mt-2 rounded-pill my-auto" style="background-color:#f1c47b">Back to shelves</a>
			</div>
			<form:form action="/books/new" method="post" modelAttribute="book" class="form border border-secondary-subtle rounded-5 p-4 mt-4" style="background-color:#495267">
				<div class="form-group">
					<form:label path="title" class="fs-4">Title</form:label><br />
					<form:errors path="title" class="text-danger fs-5"/>
					<form:input path="title" class="form-control mb-2" placeholder="Please enter title"/>
				</div>
				<div class="form-group">
					<form:label path="author" class="fs-4">Author</form:label><br />
					<form:errors path="author" class="text-danger fs-5"/>
					<form:input path="author" class="form-control mb-2" placeholder="Please enter full name"/>						
				</div>
				<div class="form-group">
					<form:label path="thoughts" class="fs-4">My Thoughts</form:label><br />
					<form:errors path="thoughts" class="text-danger fs-5"/>
					<form:textarea path="thoughts" cols="30" rows="5" class="form-control mb-2" placeholder="Write your thoughts here... (up to 255 characters)"></form:textarea>					
				</div>
				<!-- Hidden input to attach book to current user in session -->
				<form:input type="hidden" path="user" value="${user.id}"/>
				<input type="submit" value="add book" class="btn mt-2 rounded-pill" style="background-color:#FCA311;"/>
			</form:form>
		</div>
	</body>
</html>