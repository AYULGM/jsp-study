<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%= request.getContextPath() %>/fileuploadProcess"
		method="post" enctype="multipart/form-data">
		<p>
			이름1: <input type="text" name="name1" > <br>
			제목1: <input type="text" name="subject1"> <br>
			파일1: <input type="file" name="uploadFile1" multiple> <br>
		</p>
		<p>
			<button type="submit">제출하기</button> 
		</p>
	</form>
</body>
</html>