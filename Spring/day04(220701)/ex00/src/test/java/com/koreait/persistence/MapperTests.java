package com.koreait.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.koreait.mapper.BoardMapper;
import com.koreait.mapper.TimeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MapperTests {
	@Setter(onMethod_ = @Autowired)
	private TimeMapper mapper1;

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper2;
	
//	@Test
//	public void getTimeTest() {
//		log.info("Now : " + mapper1.getTime());
//	}
	
//	@Test
//	public void getTime2Test() {
//		log.info("Now : " + mapper1.getTime2());
//	}
	
	@Test
	public void getMaxBoardnumTest() {
		log.info("apple의 최근 게시글 번호 : " + mapper2.getMaxBoardnum("apple"));
	}
}