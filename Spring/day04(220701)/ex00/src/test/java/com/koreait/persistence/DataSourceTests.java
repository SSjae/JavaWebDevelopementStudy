package com.koreait.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

@Log4j
public class DataSourceTests {
	// DBCP를 사용할 떄는 필요한 설정들을 context.xml에 작성했는데
	// Spring이 관리하기 때문에 root-context.xml에 작성
	
	// dataSource를 주입해줘야 하기 때문에 Spring 필요
	@Setter(onMethod_ = @Autowired)
	private DataSource dataSource;
	
	@Test
	public void connectionTest() {
		try(
				Connection conn = dataSource.getConnection();
		){
			log.info(conn);
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}
}