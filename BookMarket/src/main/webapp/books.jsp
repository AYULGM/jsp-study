<%@page import="java.util.List"%>
<%@page import="dto.Book" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 세션은 브라우저 별로 생성이된다. 예를들어 크롬과 엣지는 다른 세션 -->
    <!-- bookDAO가 있으면 쓰고 없으면 빈 객체를 생성하는 useBean -->
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서 목록</title>
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>

<body>
	<div class="container py-4">
		<!-- 헤더(메뉴) 영역, 모듈화 -->
    <%@ include file="menu.jsp" %>

		<!-- 중간 타이틀 영역 -->
   	<jsp:include page="title.jsp">
   		<jsp:param value="도서목록" name="title"/>
   		<jsp:param value="BookList" name="sub"/>
   	</jsp:include>

		<!-- 자바코드를 쓸때는 스크립틀릿 태그 -->
		<%
			List<Book> listOfBooks = bookDAO.getAllBooks();
		%>

		<!-- 본문 영역 -->
    <div class="row align-items-md-stretch text-center">
			<%
				for (int i = 0; i < listOfBooks.size(); i++) {
					Book book = listOfBooks.get(i);
			%>
		<!-- 중간에 html 태그 넣으려면 닫았다가 열어야함 -->
			
			<div class="col-md-4">
				<div class="h-100 p-2">
					<h5><b><%= book.getName() %></b></h5>
					<p>
						<%= book.getAuthor() %>
						<br>
						<%= book.getPublisher() %> | <%= book.getReleaseDate() %>
					</p>
					<!-- 설명이 길어서 60자까지만 나오게 substring -->
					<p><%= book.getDescription().substring(0, 60) %>...</p>
					<p><%= book.getUnitPrice() %>원</p>
					<p>
					<!-- role은 버튼이 아닌데 버튼이라고 알려주는역할정도. 접근성관련임 -->
					<!-- 보조 기기(스크린 리더)에게 "이거 버튼처럼 동작하는 요소야" 라고 알려줌 -->
					<!-- ?쿼리스트링 뒤에는 name=value 형식으로 들어가야함 -->
					<!-- a태그는 GET요청임 -->
						<a href="./book.jsp?id=<%= book.getBookId() %>" class="btn btn-secondary" role="button">
							상세 정보 &raquo;
						</a>					
					</p>
				</div>
			</div>
			
		<!-- for문 아직 안끝났으니까 다시 열어 -->
			<% 
				}
			%>
 		</div>

		<!-- 푸터(바닥글) 영역, 모듈화 -->
 		<%@ include file="footer.jsp" %>

  </div>
</body>
</html>