package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBUtil {
	private static final String URL = "jdbc:mysql://localhost:3306/bookmarketdb";
	private static final String USER = "root";
	private static final String PASSWORD = "mysql1234";
	
	// 커넥션 생성
    public static Connection getConnection() {
        try {
        		// JDBC 드라이버 로드
            Class.forName("com.mysql.cj.jdbc.Driver"); // MySQL 8.x
			return DriverManager.getConnection(URL, USER, PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
    }
    
    // 리소스 해제
    // try-with-resources를 사용한다면 필요 없음
    // ...은 가변인자 라는 뜻이고 인자를 몇개든 받는단 뜻임
    // AutoCloseable은 close()해서 닫을때 상위 클래스를 닫으면 하위 클래스들은 닫히니까 씀.
    public static void close(AutoCloseable... resources) {
        for (AutoCloseable r : resources) {
            if (r != null) {
                try { 
                		r.close(); 
                } catch (Exception e) { 
                		e.printStackTrace(); 
                }
            }
        }
    }
}
