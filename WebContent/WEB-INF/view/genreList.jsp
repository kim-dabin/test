<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Genre List</title>
</head>
<body>
<h1>Genre List</h1>
<ul>
	<c:forEach items="${genres }" var="genre">
	<li>${genre.no } ) ${genre.name } 
		<a href="/deleteGenre.gm?no=${genre.no }">delete</a>
	</li>
	</c:forEach>
</ul>
<a href="/genreInsert.gm">genre insert form</a>

<a href="/index.gm">go to the index</a>

</body>
</html>