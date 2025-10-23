<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<!-- 쿠키 생성하기 -->
	<!-- 전송해보고 F12눌러서 네트워크-응답헤더쪽이랑 애플리케이션-쿠키쪽 확인해보면 잘 들어가있음 -->
	<form action="cookie01_process.jsp" method="post">
		<p>아이디: <input type="text" name="id"> </p>
		<p>비밀번호: <input type="password" name="passwd"> </p>
		<button type="submit">전송</button>
	</form>
</body>
</html>