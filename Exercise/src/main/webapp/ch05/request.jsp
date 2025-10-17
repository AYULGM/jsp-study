<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 드문 방법인데 이렇게 URL에 쿼리넣으면 post와 get방식 둘다 챙길 수 있음 -->
	<!-- <form action="request_process.jsp?name=value" method="post"> -->
	<form action="request_process.jsp" method="get">
		<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="passwd"></p>
		<button type="submit">전송</button>
	</form>
</body>
</html>