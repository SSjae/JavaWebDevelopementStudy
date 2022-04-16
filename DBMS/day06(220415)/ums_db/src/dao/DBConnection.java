package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static Connection conn;
	
	public static Connection getConnection() {
		// 싱글톤 패턴 : 단 하나의 객체만 만들어서 사용하도록 설계된 패턴
		if(conn == null) {
			try {
				// Java쪽으로 설계도 클래스를 사용하고자 불러오는 것
				// 설계도 가져오기
				Class.forName("com.mysql.cj.jdbc.Driver");
				System.out.println("드라이버 로딩 성공!");
				
				// 다리를 짓고자 하는 목적지
				// localhost : DB가 있는 컴퓨터의 ip주소
				// 3306 : 포트번호
				String url = "jdbc:mysql://localhost:3306/web0315";
				String user = "root";
				String password = "1234";
				
				conn = DriverManager.getConnection(url, user, password);
			} catch (ClassNotFoundException e) {
				System.out.println("드라이버 로딩 실패!");
			} catch (SQLException sqle) {
				System.out.println("DB 연결 실패!");
			}
		}
		return conn;
	}
}
