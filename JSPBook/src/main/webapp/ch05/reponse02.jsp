<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<!-- request 내장 객체로 5초마다 JSP 페이지 갱신하기 -->
	<p>
		이 페이지는 5초마다 새로고침 됩니다.
		<%
			response.setIntHeader("Refresh", 5); // 5자리에 무조건 Int값만 들어가야함. Int가 아니면 오류가 남.
			// 아래와 똑같은 결과지만
			// 그럼에도 IntHeader를 쓰는이유는
			// 코드의 명확성과 타입 안전성의 이유로 사용
			// response.setHeader("Refresh", "5");
			// response.setHeader("Refresh", "asdasdasd"); // 이딴식으로 들어가도 오류가안나서 안정성 미흡
			
		%>
	</p>
	<%= new Date() %>
</body>
</html>