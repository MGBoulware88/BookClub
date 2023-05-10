<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Share</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container d-flex flex-column justify-content-center gap-3 align-content-center p-5 margin-2">
		<div class="d-flex justify-content-between align-items-center gap-3">
			<h1 class="text-primary">Change your Entry</h1>
			<a class="btn btn-success align-items-center" href="/books">back to shelves</a>
		</div>
		<div class="bg-dark text-light text-left col-5 d-flex flex-column justify-content-between gap-3 align-content-center p-5 margin-auto">
			<form:form action="/books/${book.id}" method="POST" modelAttribute="book">
				<input type="hidden" name="_method" value="PUT" />
				<form:input type="hidden" path="user" value="${user}" />
				<div class="d-flex justify-content-between gap-1">
					<form:label class="text-left" path="title">Title</form:label>
					<form:input class="" type="text" path="title" />
				</div>
					<form:errors class="text-danger fw-bold fst-italic" path="title" />
				<div class="d-flex justify-content-between gap-1">
					<form:label class="text-nowrap" path="author">Author</form:label>
					<form:input class="" type="text" path="author" />
				</div>
					<form:errors class="text-danger fw-bold fst-italic" path="author" />
				<div class="d-flex justify-content-between gap-1">
					<form:label class="text-nowrap" path="thoughts">My Thoughts</form:label>
					<form:textarea path="thoughts" cols="25" rows="3"></form:textarea>
				</div>
					<form:errors class="text-danger fw-bold fst-italic" path="thoughts" />
				<div class="text-end my-2">
					<button class="btn btn-success" type="submit">Submit</button>
				</div>
			</form:form>
		</div>
	</div>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>