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
				<div>
					<h1 style="color:#FCA311;">Book Club</h1>
					<h2 style="color:#FCA311;">Welcome, <c:out value="${user.name }"/>!</h2>
					<h2 class="fst-italic">Books from everyone's shelves</h2>
				</div>
				<div class="d-flex flex-column justify-content-around">
					<form action="/logout" method="post">
						<input type="submit" value="logout" class="btn rounded-pill col-12" style="background-color:#ebd5b0;"/>
					</form>
					<a href="/books/new" class="btn rounded-pill col-12" style="background-color:#f1c47b;">add book</a>				
				</div>
			</div>
			<div class="border border-secondary-subtle rounded-2 mt-3">
				<table class="table fs-5" style="color:#e5e5e5">
					<thead>
						<tr style="color:#f1c47b">
							<th scope="col">ID</th>
							<th scope="col">Title</th>
							<th scope="col">Author Name</th>
							<th scope="col">Posted By</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
					<!-- Calls all books in database regardless of user -->
						<c:choose>
							<c:when test="${allBooks.size()==0}">
								<tr>
									<td colspan="4" class="text-center fst-italic text-secondary">Shelves are empty... Be the first to add a book</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="book" items="${allBooks}">
									<tr>
										<th scope="row" style="color:#f1c47b"><c:out value="${book.id}"/></th>
										<td><a href="/books/${book.id}" style="color:#e5e5e5"><c:out value="${book.title}"/></a></td>
										<td><c:out value="${book.author}"/></td>
										<td><c:out value="${book.getUser().name}"/></td>
									</tr>
								</c:forEach>							
							</c:otherwise>
						</c:choose>
						
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>