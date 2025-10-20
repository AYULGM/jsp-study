<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="form03_process.jsp" name="member" method="post">
		<p>
			좋아하는 과일을 선택하세요. 몇개든 상관없습니다. <br>
			오렌지<input type="checkbox" name="fruit" value="오렌지">
			사과<input type="checkbox" name="fruit" value="사과"> 
			바나나<input type="checkbox" name="fruit" value="바나나">
		</p>
		<p>
			<button type="submit">제출하기</button> 
		</p>
	</form>
</body>
</html>