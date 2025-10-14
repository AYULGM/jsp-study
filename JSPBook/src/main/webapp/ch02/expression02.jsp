<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scripting Tag</title>
</head>
<body>
	<!-- 표현문 태그로 연산 결과 출력하기 -->
	<%
		int a = 10;
		int b = 20;
		int c = 30;
		out.println(a + b + c);
	%>
	<%= a + b + c	%>
	<!-- 같은 결과, 표현문 태그안에는 자바 코드쓰면 에러남 -->
</body>
</html>