<%@page import="java.net.URLDecoder"%>
<%@page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문 정보</title>
	
	<!-- 부트스트랩 연결 -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
	<!-- 주문 정보 확인 페이지 작성하기 -->
	<%
		String shipping_cartId = "";
		String shipping_shippingDate = "";
		
		Cookie[] cookies = request.getCookies();
		
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				switch (cookie.getName()) {
					case "Shipping_cartId":
						shipping_cartId = URLDecoder.decode(cookie.getValue(), "utf-8");
						break;
					case "Shipping_shippingDate":
						shipping_shippingDate = URLDecoder.decode(cookie.getValue(), "utf-8");
						break;
				}
			}
		}
	%>
	
	<div class="container py-4">
		<%@ include file="menu.jsp" %>

	 	<jsp:include page="title.jsp">
			<jsp:param value="주문 완료" name="title"/>
			<jsp:param value="Order Completed" name="sub"/>
		</jsp:include>

    <div class="row align-items-md-stretch alert alert-info">
			<h2 class="alert alert-danger">주문해 주셔서 감사합니다.</h2>    	
			<p>주문은 <%= shipping_shippingDate %>에 배송될 예정입니다!</p>
			<p>주문번호: <%= shipping_cartId %></p>
 		</div>
		<p>
			<a href="./books.jsp" class="btn btn-secondary">&laquo; 도서 목록</a>
		</p>
    <%@ include file="footer.jsp" %>
  </div>
  
  <%
  	// 세션에 저장된 장바구니 정보를 모두 삭제하도록 작성
  	// session.invalidate(); 이렇게하면 로그아웃되잖아
  		session.removeAttribute("cartlist");
  	
  	// 쿠키에 저장된 배송 정보를 모두 삭제
  	// 예: "Shipping_" 으로 시작하는 쿠키들
  	if (cookies != null) {
    for (Cookie cookie : cookies) {
        if (cookie.getName().startsWith("Shipping_")) {
            cookie.setMaxAge(0);
           // cookie.setPath("/"); <-- 전체경로인줄알았는데 이렇게쓰면 쿠키가 안날라감 말그대로 Path가 "/" 이거인 애들.
           // 처음 만들었을때 setPath를 지정안했으면 넣으면 X
           // 만약 setPath를 지정했으면 삭제할때도 똑같은 값으로 지정해야함
           // cookie.setPath("/BookMarket"); <- ("") 안에는 Context Path가 들어간다.
            response.addCookie(cookie);
   	  }
   	 }
		}
  %>
  
  
  
</body>
</html>