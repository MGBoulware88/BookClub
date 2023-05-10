<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Read Share</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body class="bg-light">
	<div class="container d-flex flex-column justify-content-center gap-3 align-content-center p-5 margin-2">
		<div class="d-flex justify-content-between align-items-center gap-3">
			<h1 class="text-primary"><c:out value="${book.title}"/></h1>
			<a class="btn btn-success align-items-center" href="/books">back to shelves</a>
		</div>
 		<c:if test="${id == book.user.id}">
 			<p>You read <c:out value="${book.title}"/> by <c:out value="${book.author}"/>.</p>
			<p>Here are your thoughts:</p>
			<hr />
			<p><c:out value="${book.thoughts}"/></p>
 			<hr />
	 		<div class="justify-content-end gap-1 my-2 d-flex">
				<a class="btn btn-success" href="/books/${book.id}/edit">Edit</a>
				<form action="/books/delete/${book.id}" method="POST">
					<input type="hidden" name="_method" value="DELETE" />
					<button class="btn btn-danger" type="submit">Delete</button>
				</form>
			</div>
		</c:if>
		<c:if test="${id ne book.user.id}">
			<p><c:out value="${book.user.name}"/> read <c:out value="${book.title}"/> by <c:out value="${book.author}"/>.</p>
			<p>Here are <c:out value="${book.user.name}"/>'s thoughts:</p>
			<hr />
			<p><c:out value="${book.thoughts}"/></p>
 			<hr />
		</c:if>
	</div>
</body>
</html>