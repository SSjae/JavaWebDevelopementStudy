package com.koreait.app.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.SqlMapConfig;

public class UserDAO {
	SqlSession sqlsession;
	
	public UserDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);	//true로 설정시 오토커밋
	}
	
	public boolean join(UserDTO newUser) {
		return sqlsession.insert("User.join",newUser) == 1;
	}
	public boolean checkId(String userid) {
		int result = sqlsession.selectOne("User.checkId",userid);
		return result == 0;
	}
	public UserDTO login(String userid,String userpw) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("userpw", userpw);
		
		UserDTO loginUser = sqlsession.selectOne("User.login",datas);
		return loginUser;
	}
}

















