<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Database SQL</title>
</head>
<body>
	<!-- JDBC API로 데이터베이스 접속하기, connection.jsp에서 DB연결 성공확인했으니, 필요한부분만 가져와서 동적include로 활용 -->
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
			String url = "jdbc:mysql://127.0.0.1:3306/bookmarketdb";
			String user = "root";
			String password = "mysql1234"; // 나는 비밀번호가 이거임
			
			// JDBC 드라이버 로딩
			Class.forName("com.mysql.cj.jdbc.Driver"); // 구버전이 아닌 신규 드라이버 버전으로.
			
			// Connection 객체 얻기(JDBC 드라이버 -> DB 연결)
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			out.println("SQLException" + e.getMessage());
		}
	%>
</body>
</html>