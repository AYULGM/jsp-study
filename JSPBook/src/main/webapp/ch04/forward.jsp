<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Action Tag</title>
</head>
<body>
	<!-- forward 액션 태그로 현재 날짜와 시간을 출력하는 페이지로 이동하기 -->
	<h2>forward 액션 태그</h2>
	<!-- 자식 쪽(안쪽)에 쓸게 없으면 이렇게 씀, -->
	<!-- <jsp:forward page=""></jsp:forward> 이렇게 자동완성된거 써도됨.-->
	<jsp:forward page="forward_date.jsp" />
	<p>---------------------------------</p>
</body>
</html>