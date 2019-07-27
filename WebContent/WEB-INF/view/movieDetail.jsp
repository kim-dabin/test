<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie Detail Page</title>
</head>
<body>
<h1>${movie.name }의 상세페이지</h1>
<table>
<thead>
<tr>
<th>title</th>
<th>director</th>
<th>release date</th>
<th>audience number</th>
<th>end date</th>
<th>genre</th>
</tr>
</thead>
<tbody>
<tr>
<td>${movie.name }</td>
<td>${movie.director }</td>
<td>
<fmt:formatDate value="${movie.releaseDate }" pattern="YYYY년 MM월 dd일 "/>
</td>
<td>
<fmt:formatNumber value="${movie.audienceNum }" type="number" /> 명 

</td>
<td>
${movie.endDate }
</td>
<td>${movie.genre }</td>
</tr>
</tbody>
<tfoot>
<tr>
<td>
<a href="/deleteMovie.gm?no=${movie.no }">delete</a>

</td>
</tr>


</tfoot>
</table>

</body>
</html>