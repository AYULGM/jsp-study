<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<body>
	<!-- 폼 페이지에서 입력한 비밀번호 값이 숫자인지 검사하기 -->
	<form name="loginForm" action="validation04_process.jsp" method="post">
		<p>아이디: <input type="text" name="id"> </p>
		<p>비밀번호: <input type="password" name="passwd"> </p>
		<!-- return false;할거면 onclick안에 return 넣어줘야함 그래야 서버에전송안되고 로그인페이지에서 막히지(폼제출차단).. ,강의노트가 오래되서 잘못됨 -->
		<!-- event를 e로 바꿔쓰면안됨. 정해진거임 -->
		<button type="submit" onclick="checkLogin(event)">전송</button>
	</form>
	
	<script type="text/javascript">
	// name 기반 접근은 구식의 레거시 방식
	// 현대 웹 표준에서는 권장하지 않음
	// 대신 id 속성과 getElementById() 또는 querySelector() 와 같은 표준 DOM API 사용 권장
	
	// checkLogin()의 내부는 작명하는거임 보통event나 e로 쓰는게 관례
		function checkLogin(e) {
			const form = document.loginForm;
			
			for (let ch of form.id.value) { // for-of문, 자바에서는 for-each문같은거임
			if (ch < 'a' || ch > 'z') {
				alert("아이디는 영문 소문자만 입력 가능합니다!");
				form.id.select(); // 얘는 focus말고 select로 해보자. 보니까 드래그까지 되네.
				e.preventDefault(); // 기본 동작 막기(여기서는 폼 제출을 차단)
				return; // return을 안넣으면 함수 바깥의 다른코드가 쭉 실행이됨. 잘못입력했으면 return해서 되돌아가라.
			}
								
			}
			
			if (isNaN(form.passwd.value)) { // isNaN()은 JS 내장함수
				alert("비밀번호는 숫자만 입력 가능합니다!");
				form.passwd.select();
				e.preventDefault(); // 기본 동작 막기(여기서는 폼 제출을 차단)
				return; // return을 넣으면 다시 실행이됨
			}
			
			// form.submit(); // 일반 button인 경우 필요, submit 버튼에서는 불필요
		}
	</script>
</body>
</html>