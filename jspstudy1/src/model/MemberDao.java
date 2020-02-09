package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
//Model 기능을 담당하는 클래스
//Dao : Data Access Object
public class MemberDao {
	public Member selectOne(String id){
		//id : 화면에서 입력된 id
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where binary id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Member mem = new Member();
				mem.setId(rs.getString("id"));
				mem.setPass(rs.getString("pass"));
				mem.setName(rs.getString("name"));
				mem.setGender(rs.getInt("gender"));
				mem.setTel(rs.getString("tel"));
				mem.setEmail(rs.getString("email"));
				mem.setPicture(rs.getString("picture"));
				return mem;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	public int insert(Member m) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "insert into member "
				+ "(id, pass, name, gender, email, tel, picture)"
				+ "values (?,?,?,?,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getId());
			pstmt.setString(2, m.getPass());
			pstmt.setString(3, m.getName());
			pstmt.setInt(4, m.getGender());
			pstmt.setString(5, m.getEmail());
			pstmt.setString(6, m.getTel());
			pstmt.setString(7, m.getPicture());
			//int executeUpdate() : 변경된 레코드 건수.
			return pstmt.executeUpdate(); //여기서 insert됨 성공 : 1을 전달.
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, null);
		}
		return 0; //  insert 실패시 0을 전달.
		
		
	}
	public List<Member> list(){
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Member> list = new ArrayList<Member>();
		try {
			pstmt = conn.prepareStatement("select * from member");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Member m = new Member();
				m.setId(rs.getString("id"));
				m.setPass(rs.getString("pass"));
				m.setName(rs.getString("name"));
				m.setGender(rs.getInt("gender"));
				m.setTel(rs.getString("tel"));
				m.setEmail(rs.getString("email"));
				m.setPicture(rs.getString("picture"));
				list.add(m); // 전부다 list객체에 다가 저장
				
			}
			return list;
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(conn, pstmt, rs);
		}
		return null;
	}
	public int update(Member m) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql ="update member set name=?, gender=?, "
				+ "email=?, tel=?, picture=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, m.getName());
			pstmt.setInt(2, m.getGender());
			pstmt.setString(3, m.getEmail());
			pstmt.setString(4, m.getTel());
			pstmt.setString(5, m.getPicture());
			pstmt.setString(6, m.getId());
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int delete(String id, String pass) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from member where id=? and pass=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
	public int delete(String id) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "delete from member where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
		
	}
	public int pwupdate(String id, String pass) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String sql = "update member set pass=? where id=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, id);
			return pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return 0;
	}
}
