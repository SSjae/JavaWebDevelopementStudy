package com.delivery.mybatis;

import java.io.IOException;
import java.io.Reader;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	private static SqlSessionFactory factory;
  
	static {
		String resource = "./com/delivery/mybatis/config.xml";
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			factory = (new SqlSessionFactoryBuilder()).build(reader);
    	} catch (IOException ioe) {
    		System.out.println("초기화 문제 발생 : " + ioe);
    	} 
	}
  
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}