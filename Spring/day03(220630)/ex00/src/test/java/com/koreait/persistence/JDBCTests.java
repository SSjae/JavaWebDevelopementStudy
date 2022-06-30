package com.koreait.persistence;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
	// static 블럭 : 클래스 로딩시 딱 한번만 수행되는 영역, 프로젝트 빌드시 가장 먼저 수행되는 영역이다.
	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		}
	}
	
	@Test
	public void connectionTest() {
		// try(Statement) : 소괄호 안에 close를 필요로 하는 인스턴스를 작성하게 되면
		// try문이 끝났을 때 자동으로 close()를 실행해준다.
		try(
				Connection conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/web0315",
						"root",
						"1234"
				)
		) {
			log.info(conn);
		} catch (Exception e) {
			log.warn(e);
		}
	}
}
