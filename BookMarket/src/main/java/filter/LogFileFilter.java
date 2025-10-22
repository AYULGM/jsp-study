package filter;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;

// 필터 처리로 로그 기록 파일 만들기
public class LogFileFilter implements Filter {
	PrintWriter writer;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException { // web.xml에서 등록한 파라미터가 filterConfig로 넘어옴
		String filename = filterConfig.getInitParameter("filename"); // 그걸 꺼내쓰는게 getInitParameter
		
		if (filename == null) {
			throw new ServletException("로그 파일 이름을 찾을 수 없습니다.");
		}
		
		try {
			writer = new PrintWriter(new FileWriter(filename, true)); // 기존스트림에 보조스트림붙이기, true는 append라는뜻
		} catch (IOException e) {
			throw new ServletException("로그 파일을 열 수 없습니다.");
		}
	} 
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain)
			throws IOException, ServletException {
		long start = System.currentTimeMillis(); // 밀리초, 자바할때는 nanoTime()썼음
		writer.println("접속한 클라이언트 IP: " + request.getRemoteAddr()); // 콘솔에 쓰는게아닌 파일에 쓰게끔 writer.println으로 바꿈
		writer.println("접근한 URL 경로: " + getURLPath(request));
		writer.println("요청 처리 시작 시각: " + getCurrentTime());
		
		filterChain.doFilter(request, response);
		
		long end = System.currentTimeMillis(); // 밀리초, 자바할때는 nanoTime()썼음
		writer.println("요청 처리 종료 시각 " + getCurrentTime());
		writer.println("요청 처리 소요 시간 " + (end - start) + "ms");
		writer.println("===========================================================");
		writer.flush(); // 출력 버퍼비우기, 그래야 파일이 써짐.
	}
	
	private String getCurrentTime() {
		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		return dateTime.format(formatter);
	}

	// URI와 쿼리스트링을 이어붙이는 역할
	// 코드 가독성과 재사용성을 위해 메소드로 추출
	private String getURLPath(ServletRequest request) { // ServletRequest는 상위타입, HttpServletRequest가 하위타입
		// 하위타입을 쓰기위해 형변환, request가 HttpServletRequest의 인스턴스가 맞냐? ,안전한 검사(예외 발생을 피하기 위해)
		if (request instanceof HttpServletRequest req) { // 안전한 타입 변환 (자바 신규문법으로 req 변수선언까지)
			String currentPath = req.getRequestURI();
			String queryString = req.getQueryString();
			// 쿼리스트링이 있을수도 없을수도 있기때문에.
			return (queryString == null) ? currentPath : currentPath + "?" + queryString;
		}
		return "";
	}

	@Override
	public void destroy() {
		writer.close();
	}

}
