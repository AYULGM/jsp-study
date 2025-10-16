<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 출력하기</title>
</head>
<body>
<!-- 사실 단순 유틸리티성인 곱셈이니 GuGuDan.java를 Static으로 선언해서 쓰는게 훨 편함 -->
<!-- 문제에서 scope는 얘기안했으니 굳이 신경안써도됨 -->
	<jsp:useBean id="gugudan" class="ch04.com.dao.GuGuDan" scope="request" />
	<% int num = 5; %>
	<%
		for (int i = 1; i <= 9; i++) {
			out.println(num + " * " + i + " = " + num * i + "<br>");
		}
	
	%>
</body>
</html>