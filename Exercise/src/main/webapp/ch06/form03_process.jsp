<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	무슨과일을 선택했냐면 <br>
	<%
		String[] paramValues = request.getParameterValues("fruit"); 
	
		if (paramValues != null) {
			for(String value : paramValues) {
				out.println(" " + value);
	    }
		}
	%>
</body>
</html>