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

// 이 서블릿을 만드는 이유: 파일 업로드 때문, jsp에서는 파일업로드가 어려우니 서블릿 단에서 처리

/**
 * Servlet implementation class ProcessAddBookServlet
 */
// updateBook.jsp에서 등록 버튼을 누르면 폼데이터가 이 서블릿으로 오게끔 웹서블릿 설정.
@WebServlet("/processUpdateBook")
@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 1,   // 메모리 임시 저장 임계값(1MB) , 메모리를 많이잡아먹어서 무조건 크다고 좋은게아님-> 이 크기 초과 시 디스크에 임시 저장
    maxFileSize = 1024 * 1024 * 10,        // 업로드 최대 파일 크기(10MB), 크기 넘으면 서버가 뱉어버림 , 기본값은 -1(무제한)
    maxRequestSize = 1024 * 1024 * 50      // 전체 요청 크기(50MB) , 기본값은 -1(무제한, 서버가 못버팀)
)
public class ProcessUpdateBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
        	
        	String uploadPath = "D:/upload";
        	File uploadDir = new File(uploadPath);
        	if(!uploadDir.exists()) {
        		uploadDir.mkdirs();
        	}
        	
        	// 파일 저장
        	filePart.write(uploadPath + File.separator + fileName);
        } 
     //   else {
        	// fileName = "기존 파일 이름";
      //  }
        
        
        // 도서 수정 처리 DB 연동
        //  Connection conn = null;
        //  PreparedStatement pstmt = null;
        
        
		/*
		 * String sql =
		 * "INSERT INTO book (b_id, b_name, b_unitPrice, b_author, b_description, b_publisher, b_category, b_unitsInStock, b_releaseDate, b_condition, b_fileName)"
		 * + " VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		 */
        
        String sql = "UPDATE book SET b_name = ?, b_unitPrice = ?, b_author = ?, b_description = ?, b_publisher = ?, b_category = ?, b_unitsInStock = ?, b_releaseDate = ?, b_condition = ?, b_fileName = IFNULL(?, b_fileName)  WHERE b_id = ? ";
        
        
        // try-with-resources 적용
        // try문 안에 있는 () 때문에 finally가 필요없음
        try (Connection conn = DBUtil.getConnection();
        	 PreparedStatement pstmt = conn.prepareStatement(sql))  {
        	
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setLong(7, stock);
			pstmt.setString(8, releaseDate);
			pstmt.setString(9, condition);
			pstmt.setString(10, fileName);
			pstmt.setString(11, bookId);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQLException: " + e.getMessage());
		}
        
        // 수정 후 도서 편집 페이지로 리다이렉트
        response.sendRedirect("editBook.jsp?edit=update");
        
		
	}

}
