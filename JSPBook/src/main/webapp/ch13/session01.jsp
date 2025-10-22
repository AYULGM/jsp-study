<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<!-- 세션 생성하기 -->
	<form action="session01_process.jsp" method="post">
		<p>아이디: <input type="text" name="id"></p>
		<p>비밀번호: <input type="password" name="passwd"></p>
		<button type="submit">전송</button>	
	</form>
	
	<!-- 개발자 도구에서 본인만의 세션 ID 확인: AAB68E3B87AAC38EE41B75E49119293A -->
	<!-- 세션 ID는 톰캣에서 내려준거임 -->
	
</body>
</html>