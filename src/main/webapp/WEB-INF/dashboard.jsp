<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Read Share</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body class="bg-light">
	<div class="nav d-flex justify-content-around gap-5 p-5 margin-auto">
		<div class="d-flex flex-column">
			<h1 class="text-primary">Welcome, <c:out value="${userName}"/></h1>
			<p class="h5">A place for friends to share thoughts on books.</p>
		</div>
		<div class="d-flex flex-column">
			<a class="btn btn-primary" href="/logout">logout</a>
			<a class="btn btn-success" href="/books/new">+ Add a book</a>
		</div>
	</div>
	<div class="container margin-auto">
	<table class="table table-striped table-dark">
		<thead>
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Author Name</th>
				<th>Posted By</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="book" items="${allBooks}">		
			<tr>
				<td><c:out value="${book.id}" /></td>
				<td>
					<a href="/books/${book.id}">
						<c:out value="${book.title}" />
					</a>
				</td>
				<td><c:out value="${book.author}" /></td>
				<td><c:out value="${book.user.name}" /></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>