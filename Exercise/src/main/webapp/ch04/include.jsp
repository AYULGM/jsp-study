<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>구구단 출력하기</h4>
	<!-- 동적include는 실행내용을 갖다 붙인다. 윗줄의 구구단출력하기도 같이 출력되서나옴 -->
	<jsp:include page="include_data.jsp">
		<jsp:param value="5" name="num"/>
	</jsp:include>
</body>
</html>