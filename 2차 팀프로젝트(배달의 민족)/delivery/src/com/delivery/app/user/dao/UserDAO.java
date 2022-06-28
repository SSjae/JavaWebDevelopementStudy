package com.delivery.app.user.dao;

import com.delivery.mybatis.SqlMapConfig;
import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;

public class UserDAO {
	SqlSession sqlsession = SqlMapConfig.getFactory().openSession(true);
  
	public boolean checkId(String userid) {
		int result = ((Integer)this.sqlsession.selectOne("User.checkId", userid)).intValue();
		return (result == 0);
	}
  
	public boolean join(UserDTO udto) {
		return (this.sqlsession.insert("User.join", udto) == 1);
	}
  
	public UserDTO login(String userid, String userpw) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("userpw", userpw);
		UserDTO udto = (UserDTO)this.sqlsession.selectOne("User.login", datas);
		return udto;
	}
  
	public List<UserDTO> findId(String username, String userphone) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("username", username);
		datas.put("userphone", userphone);
		return this.sqlsession.selectList("User.findId", datas);
	}
  
	public UserDTO findPw(UserDTO udto) {
		return (UserDTO)this.sqlsession.selectOne("User.findPw", udto);
	}
  
	public boolean findResetPw(String userid, String userpw) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("userpw", userpw);
		return (this.sqlsession.update("User.findResetPw", datas) == 1);
	}
	
	public void userRemove(String userid) {
		this.sqlsession.delete("User.userRemoveOrder", userid);
		this.sqlsession.delete("User.userRemoveLikestore", userid);
		this.sqlsession.delete("User.userRemoveReview", userid);
		this.sqlsession.delete("User.userRemove", userid);
	}

	public UserDTO reviewUser(String userid) {
		return sqlsession.selectOne("User.reviewUser", userid);
	}
	
	public void modifyUsername(String userid, String username) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("username", username);
		this.sqlsession.update("User.modifyUsername", datas);
	}
	public void modifyUsernickname(String userid, String usernickname) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("usernickname", usernickname);
		this.sqlsession.update("User.modifyUsernickname", datas);
	}
	public void modifyUserpw(String userid, String userpw) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("userpw", userpw);
		this.sqlsession.update("User.modifyUserpw", datas);
	}
	public void modifyUseremail(String userid, String useremail) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("useremail", useremail);
		this.sqlsession.update("User.modifyUseremail", datas);
	}
	public void modifyUserphone(String userid, String userphone) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("userphone", userphone);
		this.sqlsession.update("User.modifyUserphone", datas);
	}
	public void modifyZipcode(String userid, String zipcode) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("zipcode", zipcode);
		this.sqlsession.update("User.modifyZipcode", datas);
	}
	public void modifyAddr(String userid, String addr) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("addr", addr);
		this.sqlsession.update("User.modifyAddr", datas);
	}
	public void modifyAddrdetail(String userid, String addrdetail) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("addrdetail", addrdetail);
		this.sqlsession.update("User.modifyAddrdetail", datas);
	}
	public void modifyAddretc(String userid, String addretc) {
		HashMap<String, String> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("addretc", addretc);
		this.sqlsession.update("User.modifyAddretc", datas);
	}

	public int getOrderCnt(String userid) {
		return sqlsession.selectOne("User.getOrderCnt",userid);
	}

	public void setGrade(int i, String userid) {
		HashMap<String, Object> datas = new HashMap<>();
		datas.put("userid", userid);
		datas.put("i", i);
		sqlsession.update("User.setGrade", datas);
	}

	public void addOrderCnt(String userid) {
		sqlsession.update("User.addOrderCnt", userid);
	}
}