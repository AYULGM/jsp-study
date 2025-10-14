<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!
	String message = "Hello, Java Server Pages";

	String getString() {
    return message;
	}
%>

<%= getString() %>
</body>
</html>