package com.koreait.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
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
public class MyBatisTests {
	@Setter(onMethod_ = @Autowired)
	private SqlSessionFactory factory;
	
	@Test
	public void connectionTest() {
		
		try(
				SqlSession sqlsession = factory.openSession(true);
				Connection conn = sqlsession.getConnection();
		) {
			log.info("SqlSession : " + sqlsession);
			log.info("Connection : " + conn);
		}
		catch (Exception e) {
			fail(e.getMessage());
		}
	}
}