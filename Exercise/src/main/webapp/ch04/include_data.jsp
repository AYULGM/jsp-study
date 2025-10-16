<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 출력하기</title>
</head>
<body>
	<!-- 데이터를 꺼낼때는 request 내장객체를 이용,단 return값이 String -->
	<%= request.getParameter("num") %>단 <br>
	
	<% int number = Integer.parseInt(request.getParameter("num")); %>
	<%
		for (int i = 1; i <= 9; i++) {
			out.println(number + " * " + i + " = " + number * i + "<br>");
		}
	
	%>
</body>
</html>