<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
	<!-- PreparedStatement 객체를 이용하여 SELECT 쿼리문 실행 결과 값 가져오기 -->
	<%@ include file="dbconn.jsp" %>
	<!-- 정적 include는 단순히 코드 복붙, 동적 include는 실행된 HTML코드를 복붙 -->
	<table border="1" style="width: 300px">
		<tr>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
		</tr>
	<%
		ResultSet rs = null; // 테이블 객체(ResultSet 객체)
		PreparedStatement pstmt = null;
		
		try {
			String sql = "SELECT * FROM member";
			pstmt = conn.prepareStatement(sql); // 객체를 생성하면서 sql을 바로 넘기기 때문에
			rs = pstmt.executeQuery(); // 실행할때는 빼준다. 만약 (sql); 해버리면 정적쿼리일땐 괜찮지만 sql변수가 동적 쿼리일때 문제생김
		
		while (rs.next()) {
			String id = rs.getString("id");
			String pw = rs.getString("passwd");
			String name = rs.getString("name");
		
	%>
		<tr>
			<th><%= id %></th>
			<th><%= pw %></th>
			<th><%= name %></th>
		</tr>
				
	<%
		}
		} catch (SQLException e) {
			out.println("member 테이블 호출이 실패했습니다.<br>");
			out.println("SQLException: " + e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	%>
	</table>
</body>
</html>