package filter;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;

// 필터 처리로 콘솔에 로그 기록하기
public class LogFilter implements Filter {
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		System.out.println("BookMarket Filter 초기화...");
	} 
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		long start = System.currentTimeMillis(); // 밀리초, 자바할때는 nanoTime()썼음
		System.out.println("접속한 클라이언트 IP: " + request.getRemoteAddr());
		System.out.println("접근한 URL 경로: " + getURLPath(request));
		System.out.println("요청 처리 시작 시각: " + getCurrentTime());
		
		filterChain.doFilter(request, response);
		
		long end = System.currentTimeMillis(); // 밀리초, 자바할때는 nanoTime()썼음
		System.out.println("요청 처리 종료 시각 " + getCurrentTime());
		System.out.println("요청 처리 소요 시간 " + (end - start) + "ms");
		System.out.println("===========================================================");
	}
	
	private String getCurrentTime() {
		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		return dateTime.format(formatter);
	}

	// URI와 쿼리스트링을 이어붙이는 역할
	// 코드 가독성과 재사용성을 위해 메소드로 추출
	private String getURLPath(ServletRequest request) { // ServletRequest는 상위타입, HttpServletRequest가 하위타입
		// getRequestURI() , getQueryString()는 HttpServletRequest객체 안에 있기떄문에 쓰기위해 형변환이 필요함
		// 하위타입을 쓰기위해 안전한 형변환, request가 HttpServletRequest의 인스턴스가 맞냐? ,안전한 검사(예외 발생을 피하기 위해)
		if (request instanceof HttpServletRequest req) { // 안전한 타입 변환 (자바 신규문법으로 req 변수선언까지)
			String currentPath = req.getRequestURI();
			String queryString = req.getQueryString();
			// 쿼리스트링이 있을수도 없을수도 있기때문에 만약 null 이라면 URI만 아니라면 ?queryString까지 추가.
			return (queryString == null) ? currentPath : currentPath + "?" + queryString;
		}
		return ""; // 잘못된 객체가 들어올 경우, 그냥 빈 문자열 리턴
	}

	@Override
	public void destroy() {
		System.out.println("BookMarket Filter 해제...");
	}

}
