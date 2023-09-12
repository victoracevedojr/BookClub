<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
	<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
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
		<div class="container col-10 offset-1 mt-4">
			<div class="d-flex justify-content-between">
				<h1 style="color:#FCA311;"><c:out value="${book.title}"/></h1>
				<a href="/dashboard" class="btn mt-2 rounded-pill my-auto" style="background-color:#f1c47b">Back to shelves</a>
			</div>
			<!-- Determines whether or not the user in session matches the book's user id -->
			<c:choose>
				<c:when test="${user.id eq book.getUser().id}">
					<div>
						<p class="fs-3">
							<span class="fst-italic" style="color:red">You</span> have read 
							<span class="fst-italic" style="color:#d2afff"><c:out value="${book.title}"/></span> by 
							<span class="fst-italic" style="color:green"><c:out value="${book.author}"/></span>
						</p>
					</div>
					<div class="col-10 offset-1">
						<p class="fs-4">Here are your thoughts:</p>	
						<hr />
						<p class="fs-5"><c:out value="${book.thoughts}"/></p>
						<hr />
						<div class="actions d-flex justify-content-around">
							<a href="/books/${book.id}/edit" class="btn mt-2 rounded-pill " style="background-color:#FCA311;">edit</a>
							<form action="/books/${book.id}/delete" method="post">
								<input type="hidden" name="_method" value="delete" />
								<input type="submit" value="delete" class="btn btn-danger mt-2 rounded-pill "/>
							</form>
						</div>
					</div>
				</c:when>
					<c:otherwise>
						<p class="fs-3">
							<span class="fst-italic" style="color:red"><c:out value="${book.getUser().name}" /></span> read 
							<span class="fst-italic" style="color:#d2afff"><c:out value="${book.title}"/></span> by 
							<span class="fst-italic" style="color:green"><c:out value="${book.author}"/></span>
						</p>
						<div class="col-10 offset-1">
							<p class="fs-4">Here are <c:out value="${book.getUser().name}"/>'s thoughts:</p>					
							<hr />
							<p class="fs-5"><c:out value="${book.thoughts}"/></p>
							<hr />
						</div>
					</c:otherwise>
			</c:choose>
		</div>	
	</body>
</html>