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
		String user_id = request.getParameter("id"); 
		String user_pw = request.getParameter("passwd"); 
	
		if ("admin".equals(user_id) && "1234".equals(user_pw)) {
			session.setAttribute("userID", user_id); 
			session.setAttribute("userPW", user_pw);

			response.sendRedirect("welcome.jsp");
		} else {
			out.println("세션 설정이 실패하였습니다. <br>");
		}
	%>
</body>
</html>