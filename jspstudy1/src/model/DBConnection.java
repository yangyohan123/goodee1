package model;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class DBConnection {
	
	private DBConnection () {}// 생성자 접근제어자를 private으로 막음. 객체 생성 불가
	//접근제어자 안쓴이유 같은 패키지 내에서만 접근하도록하기위해
	static Connection getConnection() {
		Connection conn =null;
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mariadb://localhost:3306/classdb","scott","1234");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
		
	}
	static void close
	(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs != null) rs.close();
			if(conn!=null) {pstmt.close();
				conn.commit();
				conn.close();
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	}
}
