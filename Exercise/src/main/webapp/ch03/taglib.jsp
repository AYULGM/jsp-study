<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Directives Tag</title>
</head>
<body>

<!-- 반복문 -->
	<c:forEach var="k" begin="0" end="10" step="2">
		<c:out value="${k}" />
	</c:forEach>
	
	<br>
	
	<c:forEach var="i" begin="0" end="10">
<!-- 반복문 안에 조건문, test안에 조건을 넣는다. -->
		<c:if test="${i % 2 == 0}">
			${i}
		</c:if>
	</c:forEach>
</body>
</html>