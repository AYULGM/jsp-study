<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<!-- 폼(입력양식)에서 입력한 한글을 처리하도록 request 내장 객체의 메소드에 문자 인코딩 설정 -->
	<!-- param태그로 받거나 form태그로 받거나 둘다 JSP컨테이너에서 자동생성해주는 request 내장객체로 받음 -->
	<!-- 대소문자 상관없이 씀 -->
	<% request.setCharacterEncoding("utf-8"); %>
	<% request.setCharacterEncoding("UTF-8"); %>
	
	<% String userId = request.getParameter("id"); %>
	<% String userPw = request.getParameter("passwd"); %>
	<%= userId + "<br>" + userPw  %>
	
	<!-- 아래처럼하는게 깔끔할듯 -->
	<p>아이디: <%= userId %></p>
	<p>비밀번호: <%= userPw %></p>
	
	<!-- 출력하는건 표현문태그말고도 EL표현으로도 출력할수있다고 계속배웠음 -->
	<!-- EL 사용 시 -->
	<!-- param -> request.getParameter()와 동일한 역할 -->
	<p>아이디: ${param.id}</p>
	<p>비밀번호: ${param.passwd}</p>
</body>
</html>