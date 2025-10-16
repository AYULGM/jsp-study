<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8"); // 요즘웬만한건 UTF-8인데 안전하게..
		String userId = request.getParameter("id");
		String userPw = request.getParameter("passwd");
		
		if ("admin".equals(userId) && "1234".equals(userPw)) {
			response.sendRedirect("response01_success.jsp");
		} else {
			response.sendRedirect("response01_failed.jsp");
		}
	%>
</body>
</html>