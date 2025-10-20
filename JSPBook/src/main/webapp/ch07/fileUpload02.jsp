<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>
	<!-- 파일 업로드 및 정보 출력하기 -->
	<!-- context path: 웹 애플리케이션 루트 경로를 의미 -->
	<!-- 예: 톰캣에서 주소가 http://localhost:8080/JSPBook/uploadProcess이면 /JSPBook 을 의미 -->
	<!-- <form action="/JSPBook/fileupload02Process"> -->
	<form action="<%= request.getContextPath() %>/fileupload02Process"
		method="post" enctype="multipart/form-data">
		<p>
			이름1: <input type="text" name="name1">
			제목1: <input type="text" name="subject1">
			파일1: <input type="file" name="uploadFile1">
		</p>
		<p>
			이름2: <input type="text" name="name2">
			제목2: <input type="text" name="subject2">
			파일2: <input type="file" name="uploadFile2">
		</p>
		<p>
			이름3: <input type="text" name="name3">
			제목3: <input type="text" name="subject3">
			파일3: <input type="file" name="uploadFile3">
		</p>
		<button type="submit">파일 올리기</button>	
	</form>
</body>
</html>