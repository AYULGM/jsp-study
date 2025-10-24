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
	<%
		ResultSet rs = null; // 테이블 객체(ResultSet 객체)
		PreparedStatement pstmt = null;
		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		try {
			String sql = "SELECT * FROM member WHERE id = ? ";
			
			pstmt = conn.prepareStatement(sql); // 동적인 쿼리에 사용하는 PreparedStatement 객체 생성
			pstmt.setString(1, id);
			rs = pstmt.executeQuery(); // 인자값 넣지X
			
			if (!rs.next()) {
				out.println("member 테이블에 일치하는 아이디가 없습니다.");
			} else {
				String dbId = rs.getString("id");
				String dbPasswd = rs.getString("passwd");
				
					// 사용자가 입력한 비밀번호가 일치할 때만 데이터를 삭제
				if(dbPasswd.equals(passwd)) {
					sql = "DELETE FROM member WHERE id = ? AND passwd = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, id); 
					pstmt.setString(2, passwd); 
					pstmt.executeUpdate();
					out.println("member 테이블에서 데이터를 삭제했습니다.");
				} else {
					out.println("일치하는 비밀번호가 아닙니다.");
				}
			}
		} catch (SQLException e) {
			out.println("member 테이블 데이터 삭제에 실패했습니다.<br>");
			out.println("SQLException: " + e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	%>
</body>
</html>