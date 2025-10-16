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
	<!-- request 내장 객체로 오류 응답 코드와 오류 메시지 보내기 -->
	<%
		// response.sendError(404, "요청 페이지를 못찾겠소ㅠㅠ");
		// 권장 방식: 상수 사용(가독성 + 유지보수성) 자바에서는 public static final..
		// 위랑 밑이랑 같은 코드
		// response.sendError(HttpServletResponse.SC_NOT_FOUND, "요청 페이지를 못찾겠소ㅠㅠ");
		
		// setStatus 테스트 (에러처리 로직이 동작을 안하고 404 에러코드값만 전송함. 개발자도구 보면나옴)
		// 단순히 응답 상태 코드만 설정(에러처리 로직 실행 안됨)
		// 정상 응답인데 코드만 다르게 주고 싶을 때 사용
		response.setStatus(404);
	%>
	
	<h2>HTTP. 응답 상태 코드</h2>
	나중에 가볍게 쓱 훑어봐라. <br>
	https://developer.mozilla.org/ko/docs/Web/HTTP/Reference/Status
</body>
</html>