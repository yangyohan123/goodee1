package model;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class DBConnection {
	
	private DBConnection () {}// ������ ���������ڸ� private���� ����. ��ü ���� �Ұ�
	//���������� �Ⱦ����� ���� ��Ű�� �������� �����ϵ����ϱ�����
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
