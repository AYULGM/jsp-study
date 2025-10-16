<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<!-- request 내장 객체로 모든 HTTP 헤더 정보 값 출력하기 -->
	<%
		Enumeration<String> en = request.getHeaderNames(); // 모든 헤더 이름 가져오기
		
		while (en.hasMoreElements()) { // 요소를 가지고 있니? 가져올 헤더 이름이 있으면 리턴값이 True(While이라 반복) 없으면 False
			String headerName =	en.nextElement(); // 요소를 꺼내옴, nextElement()의 return type이 String이라 String객체에 저장
			String headerValue = request.getHeader(headerName);
			
			// out.println(headerName + ": " + headerValue + "<br>"); // 아래 표현문태그나 이 코드나 동일한 코드
	%>		
			<%= headerName %>: <%= headerValue %> <br>
	<%
		}
	%>
	
</body>
</html>