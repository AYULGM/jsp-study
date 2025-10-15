<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
    java.util.Date today = new java.util.Date();

    out.println("현재 날짜: " + today);
	%>
	<!-- 둘다 똑같음 -->
	<% 
		Date now = new Date(); 
		out.println("Today: " + now);
	%>  
</body>
</html>