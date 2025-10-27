<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<!-- 문자열 분리하고 연결하기 -->
	<c:set var="texts" value="${fn:split('Hello, Java Server Pages!', ' ')}"/>
	
	<!-- split으로 배열로 쪼개지므로 0부터 시작 -->
	<c:forEach var="i" begin="0" end="${fn:length(texts) - 1}">
		<p>text[${i}] = ${texts[i]}</p>
 	</c:forEach>
 	<!-- 또는 향상된 for문을 이용한다, 인덱스까지 얻고싶으면 varStatus에 index정보있으니 쓴다. -->
 		<c:forEach var="text" items="${texts}" varStatus="i">
		<p>text[${i.index}] = ${text}</p>
 	</c:forEach>

	<!-- 쪼갠거 합칠때는 join --> 	
 	<p>
 		<c:out value="${fn:join(texts, '-')}"></c:out>
 	</p>
</body>
</html>