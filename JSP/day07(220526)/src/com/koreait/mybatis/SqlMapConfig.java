package com.koreait.mybatis;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

// factory를 만드는 곳
public class SqlMapConfig {
	private static SqlSessionFactory factory;
	
	// 클래스 초기화 블럭, static 블럭(클래스가 처음 로딩될 때 한번만 수행)
	static {
		// 설계도 위치
		String resource = "./com/koreait/mybatis/config.xml"; // src가 현재 최상위 폴더
		try {
			// 설계도를 읽어주는 reader
			Reader reader = Resources.getResourceAsReader(resource);
			// 설계도를 가지고 공장을 지을 bulider와 reader가 합심해서 factory 생성
			factory = new SqlSessionFactoryBuilder().build(reader);
			// factory에서 SqlSession을 뽑아내서 사용함
		} catch (IOException ioe) {
			System.out.println("초기화 문제 발생 : " + ioe);
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
