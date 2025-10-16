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
	<!-- setProperty 액션 태그에 자바빈 Person으로 아이디와 이름을 설정하여 출력하기 -->
	
	<!-- 이건 자바빈이 아님. 일반객체임, 만약 forward해서 이동한페이지에서 person을 못씀 -->
<%-- 	<%
		Person p = new Person();
	%> --%>
	
	<!-- person이란 이름으로 변수가 되는거임. -->
	<!-- 하나의 request에서 person이 계속 쓰인다. -->
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request" />
	<!-- 필드 프로퍼티에 setter로 값을 넣어도되지만 setProperty를 사용 -->
	<jsp:setProperty property="id" name="person" value="20251016" />
	<jsp:setProperty property="name" name="person" value="이경민" />
	
	<!-- get()메소드로 값을 가져와보자. -->
	<p>아이디: <%= person.getId() %></p>
	<p>이름: <%= person.getName() %></p>
	
	<!-- 값을 출력할때 또 다른방법이 있다. -->
	<!-- EL 표현 언어, Spring에서 이걸 많이씀 -->
	<p>아이디: ${person.id}</p>
	<p>이름: ${person.name}</p>	
</body>
</html>