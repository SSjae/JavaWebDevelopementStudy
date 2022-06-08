package com.koreait.app.user.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.SqlMapConfig;

public class UserDAO {
	SqlSession sqlsession;
	
	public UserDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
		//true로 설정시 오토커밋 : 데이터베이스 파일에 바로 적용
	}
	
	public boolean join(UserDTO newUser) {
		// insert의 반환타입은 int, 성공한 행의 개수 반환
		return sqlsession.insert("User.join", newUser) == 1;
	}
	
	public boolean checkId(String userid) {
		// MyBatis는 int로 돌려주지만 selectOne은 Object이다.
		// 다운캐스팅에 오토언박싱까지
		
		// (반환값이 하나일때 One)selectOne("a",b) : a 곳으로 가서 거기에 있는 쿼리문 사용, b를 넘겨줌(넘길게 없으면 안 써도됨)
		int result = sqlsession.selectOne("User.checkId", userid);
		return result == 0;
	}
	
	// 여러 개의 상관없는 것을 보낼 때는 해쉬맵 사용
	public UserDTO login(String userid, String userpw) {
		HashMap<String, String> datas = new HashMap<String, String>();
		datas.put("userid", userid);
		datas.put("userpw", userpw);
		
		UserDTO loginUser = sqlsession.selectOne("User.login", datas);
		return loginUser;
	}
}