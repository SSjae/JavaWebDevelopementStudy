package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import dto.UserDTO;

public class UserDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	ProductDAO pdao = new ProductDAO();
	
	public UserDAO() {
		conn = DBConnection.getConnection();
	}
	
	public boolean join(UserDTO user) {
		String sql = "insert into user (userid, userpw, username, userage, userphone, useraddr)"
				+ "values(?, ? ,? ,? ,?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, user.userid);
			ps.setString(2, user.userpw);
			ps.setString(3, user.username);
			ps.setInt(4, user.userage);
			ps.setString(5, user.userphone);
			ps.setString(6, user.useraddr);
			
			return ps.executeUpdate() == 1;
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return false;
	}

	public boolean checkDup(String userid) {
		String sql = "select * from user where userid = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs = ps.executeQuery();
			
			// rs.next()는 더 이상 데이터가 존재하지 않으면 false / 데이터가 존재한다면 true
			return !rs.next();
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return false;
	}

	public boolean login(String userid, String userpw) {
		String sql = "select * from user where userid = ? and userpw = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setString(2, userpw);
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				Session.put("login_id", userid);
				Session.put("login-idx", rs.getInt("useridx") + "");
				return true;
			}
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return false;
	}

	public String myInfo() {
		String sql = "select * from user where userid = ?";
		String result = "";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, Session.get("login_id"));
			
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result += "아이디 : " + rs.getString(2) +"\n";
				result += "비밀번호 : " + rs.getString(3) +"\n";
				result += "이름 : " + rs.getString(4) +"\n";
				result += "나이 : " + rs.getInt(5) +"\n";
				result += "핸드폰번호 : " + rs.getString(6) +"\n";
				result += "주소 : " + rs.getString(7) +"\n";
			}
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return result;
	}

	public boolean modifyUser(int col, String newData) {
		// col : 1. 비밀번호 수정 / 2. 핸드폰 번호 수정 / 3. 주소 수정
		String[] cols = {"userpw", "userphone", "useraddr"};
		String sql = "update user set " + cols[col-1] + " = ? where userid = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, newData);
			ps.setString(2,Session.get("login_id"));
			
			return ps.executeUpdate() == 1;
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return false;
	}

	public boolean checkPw(String userpw) {
		String sql = "select * from user where userid = ? and userpw = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, Session.get("login_id"));
			ps.setString(2, userpw);
			
			rs = ps.executeQuery();
			
			return rs.next();
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return false;
	}

	public boolean leaveId() {
		String sql = "delete from user where userid = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, Session.get("login_id"));
			
			if (ps.executeUpdate() == 1) {
				Session.put("login_id", null);
				Session.put("login-idx", null);
				return true;
			}
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return false;
	}

	public String sellerPhone(int prodnum) {
		String userid = pdao.seller(prodnum + "");
		String sql = "select userphone from user where userid = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			
			rs = ps.executeQuery();
			
			if (rs.next()) {
				return "판매자 연락처 : " + rs.getString(1);
			}
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
		return "";
	}
}










