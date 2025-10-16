<%@ page import="ch04.com.dao.Person" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<!-- setProperty가 자주 쓰이는 상황 
		폼 페이지에서 전달되는 요청 파라미터를 자바빈 객체에 자동으로 맵핑할 때 아주 유용
		즉, form 데이터 -> DTO/VO(여기선 JavaBean) 자동 맵핑용으로 가장 많이 사용 
	-->
	
	<!-- get으로 전달하면 ?로 되는 쿼리스트링에전달이고 post는 본문에 전달이라는 뜻 -->
	<!-- action에는 jsp의 주소를 입력 -->
	<form action="setProperty02_process.jsp" method="post">
		아이디: <input type="text" name="id"><br>
		이름: <input type="text" name="name"><br>
		<button type="submit">등록</button>
	</form>
	
</body>
</html>