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
	<!-- getProperty 액션 태그에 자바빈 Person으로 아이디와 이름을 가져와 출력하기 -->
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request" />
	
	<!-- 당연히 get하기전에 set하면 값이 바뀜 -->
	<jsp:setProperty name="person" property="id" value="20251016" />
	<jsp:setProperty name="person" property="name" value="김재" />
	
	<!-- 자동완성으로 만들어진건데 쌤은 name속성이 앞에 오는게 가독성이 좋다고 하심-->
	<!-- person이라는 자바빈객체에서 id,name을 꺼내온다. -->
	<p>아이디: <jsp:getProperty property="id" name="person" /> </p>
	<p>이름: <jsp:getProperty property="name" name="person"/> </p>
	
</body>
</html>