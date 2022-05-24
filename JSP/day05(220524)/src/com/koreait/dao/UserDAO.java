package com.koreait.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.koreait.dto.UserDTO;

// 원래는 DBconnection으로 하나의 객체로 사용하기 위해 싱글톤 패턴을 만들었지만
// 그럴 필요없이 DBCP를 사용
public class UserDAO {
	// DBCP를 사용하기 위해 추가
	Context context;
	DataSource ds;
	
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public boolean join(UserDTO newUser) {
		int result = 0;
		try {
			// 아까 설정해둔 name을 찾아옴
			context = new InitialContext(null);
			// java:comp/env/설정한 name
			// 설정한 type이 DataSource일 뿐만 아니라 여러가지 이기 때문에 lookup 반환은 Object 객체
			// 그러므로 다운캐스팅 필요
			ds = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();
			
			String sql = "insert into test_user values(?,?,?,?,?,?,?,?,?)";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, newUser.getUserid());
			ps.setString(2, newUser.getUserpw());
			ps.setString(3, newUser.getUsername());
			ps.setString(4, newUser.getUsergender());
			ps.setString(5, newUser.getZipcode());
			ps.setString(6, newUser.getAddr());
			ps.setString(7, newUser.getAddrdetail());
			ps.setString(8, newUser.getAddretc());
			
			String[] hobbies = newUser.getUserhobby();
			// 무조건 하나는 있을 거기 때문에 맨처음을 넣어둠
			String hobbyStr = hobbies[0];
			for (int i = 1; i < hobbies.length; i++) {
				// 하나만 있다면 for문은 안 돌 것이고 있으면 맨 처음 뒤에 콤마로 연결
				hobbyStr += "," + hobbies[i];
			}
			ps.setString(9, hobbyStr);
			result = ps.executeUpdate();
			
		} catch (NamingException ne) {
			System.out.println(ne);
		} catch (SQLException sqle) {
			System.out.println(sqle);
		}
		return result == 1;
	}
	
	public boolean checkId(String userid) {
		try {
			// 아까 설정해둔 name을 찾아옴
			context = new InitialContext(null);
			// java:comp/env/설정한 name
			// 설정한 type이 DataSource일 뿐만 아니라 여러가지 이기 때문에 lookup 반환은 Object 객체
			// 그러므로 다운캐스팅 필요
			ds = (DataSource) context.lookup("java:comp/env/jdbc/mysql");
			conn = ds.getConnection();
			
			String sql = "select * from test_user where userid = ?";
			
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, userid);
			
			rs = ps.executeQuery();
			
			return !rs.next();
		} catch (NamingException ne) {
			System.out.println(ne);
		} catch (SQLException sqle) {
			System.out.println(sqle);
		}
		return false;
	}
}
