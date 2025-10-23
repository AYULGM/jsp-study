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
		String user_id = (String) session.getAttribute("userId");	
		String user_pw = (String) session.getAttribute("userPw");	
		
		out.println( user_id + "님 환영합니다.");
		
		out.println("설정된 세션의 속성 값 [1]: " + user_id + "<br>");
		out.println("설정된 세션의 속성 값 [2]: " + user_pw);
		
		if( user_id == null ) {
			response.sendRedirect("session_out.jsp");
		}
		
	%>
	<a href=""></a>
	<!-- 하다맘 -->
</body>
</html>