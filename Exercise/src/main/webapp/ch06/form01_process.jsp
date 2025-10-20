<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름은 <%= request.getParameter("name") %> <br>
	주소는 <%= request.getParameter("address") %> <br>
	이메일은 <%= request.getParameter("email") %>
</body>
</html>