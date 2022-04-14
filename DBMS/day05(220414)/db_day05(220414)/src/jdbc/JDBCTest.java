package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class JDBCTest {
	public static void main(String[] args) {
		String sql = "insert into test(strdata, timedata) values('세번째 문자열', now())";
		Connection conn;
		PreparedStatement ps;
		try {
//			conn = DBConnection.getConnection();
//			
//			// 만들어 놓은 다리위를 왔다갔다 할 택배차 만들기
//			ps = conn.prepareStatement(sql);
//			
//			// 택배차에게 명령문 전달 시키고 DBMS에 명령 수행하도록 시키기
//			int result = ps.executeUpdate(); // 바뀐 행의 갯수 반환
//			
//			System.out.println(result);
			
			sql = "select * from test";
			conn = DBConnection.getConnection();
			
			ps = conn.prepareStatement(sql);
			// executeUpdate()	: 시스템에 변화가 생기는 쿼리문 수행(insert, update, delete) - 변화된 행의 개수 리턴
			// excuteQuery()	: 변화 없는 쿼리문 수행(select) - 검색된 결과 리턴(ResultSet)
			ResultSet rs = ps.executeQuery();
			
			// rs.next() : 검색된 결과에서 행을 하나 이동시키며 이동된 곳에 행이 존재한다면 true,아니라면 false
			// 처음에는 아무것도 없는 것에 화살표가 있기 때문에 하나 이동시키고 첫번쨰 행부터 시작
			while(rs.next()) {
				// 컬럼명을 작성해주면 가리키고 있는 행의 해당 컬럼값을 가지고 온다.
				int intdata = rs.getInt("intdata");
				// 컬럼인덱스로도 데이터를 가지고 올 수 있다.
				String strdata = rs.getString(2);
				String timedata = rs.getString("timedata");
				
				System.out.println("행의 데이터 : " + intdata + " / " + strdata + " / " + timedata);
			}
			
		} catch (SQLException sqle) {
			System.out.println("sql문 수행 실패!!" + sqle);
		}
	}
}