package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class JDBCTest2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("추가할 문자열 : ");
		String strdata = sc.nextLine();// 오늘 수업 끝
		
		//insert into test (strdata, timedata) values (오늘 수업 끝, now());
		String sql = "insert into test (strdata, timedata) values (?, now())";
		
		Connection conn = DBConnection.getConnection();
		
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			
			// 첫번째 물음표에 strdata에 있는 값을 문자열로 세팅(양쪽에 ''를 붙여준다.)
			ps.setString(1, strdata);
			if(ps.executeUpdate() == 1) {
				System.out.println("쿼리 수행 성공!");
			}
		} catch (SQLException sqle) {
			System.out.println("쿼리 수행 실패 : " + sqle);
		}
	}
}
