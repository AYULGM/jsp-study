<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cookie</title>
</head>
<body>
	<%
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");
	
		// 간단한 로그인 검증
		if ("admin".equals(user_id) && "1234".equals(user_pw)) {
			Cookie cookie_id = new Cookie("userId", user_id);
			Cookie cookie_pw = new Cookie("userPw", user_pw); // 예제라서 가능한거지 절대 비밀번호를 쿠키로 만들어선 안됨(보안 매우 취약)
			
			// (중요) 실무에서 자주 쓰는 쿠키 설정, 책에는 없음 쌤이 알려주심
			// cookie_id.setPath("/"); // 모든 경로에서 접근 가능 , F12누르면 Application에서 Domain과 Path 부분이있는데 둘중 하나라도 다르면 다른쿠키.
					    									 // 그런데 Path를 "/" 로 해놓으면 localhost밑에 어느 Path에서도 이 쿠키를 쓸 수 있다는 것을 알려줌
			// cookie_id.setHttpOnly(true); // JavaScript로 접근 불가(보안 강화)
			// cookie_id.setSecure(true); // HTTPS에서만 전송(사용), 보안 목적. 우리는 현재 인증서발급을 안했으니 Https가 아닌 Http라 주석처리
			// cookie_id.setMaxAge(60 * 5); // 5분 유효한 쿠키(유효시간)
			
			response.addCookie(cookie_id);
			response.addCookie(cookie_pw);
			
			
			out.println("쿠키 생성이 성공했습니다.<br>");
			out.println( user_id + "님 환영합니다.");
		} else {
			out.println("쿠키 생성이 실패했습니다.");
		}
	%>
	
	<!-- 쿠키 사용 예(쿠키를 언제 쓰는지) 
		1. 로그인 유지(<-- 세션 ID가 저장된 세션 쿠키)
		2. 장바구니 정보 저장(거의 안 씀) => 요새는 세션 기반, DB 기반, 로컬 스토리지 기반
		3. 방문 기록 또는 사용자 설정 유지(예: 아이디 기억하기)
		4. 광고/트래킹 용도(특히 제3자 쿠키)
	-->
</body>
</html>