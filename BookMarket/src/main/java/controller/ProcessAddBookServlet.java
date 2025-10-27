package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import util.DBUtil;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import dao.BookRepository;
import dto.Book;

/**
 * Servlet implementation class ProcessAddBookServlet
 */
@WebServlet("/processAddBook")
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 1,   // 메모리 임시 저장 임계값(1MB) , 메모리를 많이잡아먹어서 무조건 크다고 좋은게아님-> 이 크기 초과 시 디스크에 임시 저장
    maxFileSize = 1024 * 1024 * 10,        // 업로드 최대 파일 크기(10MB), 크기 넘으면 서버가 뱉어버림 , 기본값은 -1(무제한)
    maxRequestSize = 1024 * 1024 * 50      // 전체 요청 크기(50MB) , 기본값은 -1(무제한, 서버가 못버팀)
)
public class ProcessAddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// get요청이 들어온다할지라도 post로 넘기겠다면 이렇게 코드를 짠다.
		doPost(req,resp);
	}
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

        // ==== 일반 텍스트 데이터 처리 ====
        String bookId = request.getParameter("bookId");
        String name = request.getParameter("name");
        String unitPrice = request.getParameter("unitPrice");
        String author = request.getParameter("author");
        String publisher = request.getParameter("publisher");
        String releaseDate = request.getParameter("releaseDate");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        String unitsInStock = request.getParameter("unitsInStock");
        String condition = request.getParameter("condition");

        int price = 0;
        if (unitPrice != null && !unitPrice.isEmpty()) {
            price = Integer.parseInt(unitPrice);
        }

        long stock = 0;
        if (unitsInStock != null && !unitsInStock.isEmpty()) {
            stock = Long.parseLong(unitsInStock);
        }
        
        // ==== 파일 업로드 처리 ====
        Part filePart = request.getPart("bookImage");
        String fileName = null;
        
        if (filePart != null && filePart.getSize() > 0) {
        	// 파일 이름 가져오기
        	fileName = filePart.getSubmittedFileName();
        	
        	// 업로드 폴더 경로(2가지 경로 테스트)
        	// 1) webapp 내부 경로 사용
        	// String uploadPath = getServletContext().getRealPath("/resources/images");
        	
        	// 실제 배포되는 경로
        	// D:\jsp-study\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\BookMarket\resources\images
        	// 장점: 내부 경로라서 리소스에 바로 접근 가능
        	// 단점: 서버 재배포 시 초기화됨(즉, 업로드 파일 사라짐)
        	
        	// 2) (서버) 외부 업로드 폴더 사용
        	String uploadPath = "D:/upload";
        	// JSP 페이지에서 /images/파일명으로 바로 접근하려면 톰캣 설정(외부 폴더 매핑)을 추가해야함
        	// server.xml 또는 프로젝트별 context.xml
        	
        	
        	// 업로드 폴더 생성
        	File uploadDir = new File(uploadPath);
        	if(!uploadDir.exists()) {
        		uploadDir.mkdirs();
        	}
        	
        	// 파일 저장
        	filePart.write(uploadPath + File.separator + fileName);
        }
        
        
        // ==== Book 객체 생성 및 저장 ====
        /*
        Book newBook = new Book();
        newBook.setBookId(bookId);
        newBook.setName(name);
        newBook.setUnitPrice(price);
        newBook.setAuthor(author);
        newBook.setPublisher(publisher);
        newBook.setReleaseDate(releaseDate);
        newBook.setDescription(description);
        newBook.setCategory(category);
        newBook.setUnitsInStock(stock);
        newBook.setCondition(condition);
        newBook.setFilename(fileName); // 이미지 이름 저장(상대 경로로 JSP 페이지에서 접근하기 위해)
        // (참고) 보통은 이미지 경로도 같이 저장
		
        BookRepository dao = BookRepository.getInstance();
        dao.addBook(newBook);
        */
        
        // 도서 등록 처리 DB 연동
        //  Connection conn = null;
        //  PreparedStatement pstmt = null;
        
        
        String sql = "INSERT INTO book (b_id, b_name, b_unitPrice, b_author, b_description, b_publisher, b_category, b_unitsInStock, b_releaseDate, b_condition, b_fileName)"
        		+ " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
        
        /*
        try {
        	// 공통 메소드로 커넥션 획득
        	conn = DBUtil.getConnection();
        	
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookId);
			pstmt.setString(2, name);
			pstmt.setInt(3, price);
			pstmt.setString(4, author);
			pstmt.setString(5, description);
			pstmt.setString(6, publisher);
			pstmt.setString(7, category);
			pstmt.setLong(8, stock);
			pstmt.setString(9, releaseDate);
			pstmt.setString(10, condition);
			pstmt.setString(11, fileName);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
		} finally {
			DBUtil.close(pstmt, conn); // 공통 메소드로 자원 해제 , 가변인자니까 여러개 받을 수 있음. 내부적으로 가변인자는 배열로 처리됨
		}
		
        */
        
        
        // try-with-resources 적용
        // try문 안에 있는 () 때문에 finally가 필요없음
        try (Connection conn = DBUtil.getConnection();
        	 PreparedStatement pstmt = conn.prepareStatement(sql))  {
			pstmt.setString(1, bookId);
			pstmt.setString(2, name);
			pstmt.setInt(3, price);
			pstmt.setString(4, author);
			pstmt.setString(5, description);
			pstmt.setString(6, publisher);
			pstmt.setString(7, category);
			pstmt.setLong(8, stock);
			pstmt.setString(9, releaseDate);
			pstmt.setString(10, condition);
			pstmt.setString(11, fileName);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
		}
        
        // 등록 후 도서 목록 페이지로 리다이렉트
        response.sendRedirect("books.jsp");
        
		
	}

}
