<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<!-- number 파라미터를 갖고와서 number라는 변수에 저장 -->
	<c:set var="number" value="${param.number}"/>
	
	<!-- 다중 조건문: if --- else if --- else 와 동일 -->
		<!-- (참고) number는 문자열이지만, 연산 시 EL이 자동으로 숫자로 형 변환 -->
	<c:choose>
		<c:when test="${number % 2 == 0}">
			<c:out value="${number}" />은 짝수입니다.
		</c:when>
		<c:when test="${number % 2 == 1}">
			<c:out value="${number}" />은 홀수입니다.
		</c:when>		
		<c:otherwise>
			숫자가 아닙니다.
		</c:otherwise>
	</c:choose>
</body>
</html>