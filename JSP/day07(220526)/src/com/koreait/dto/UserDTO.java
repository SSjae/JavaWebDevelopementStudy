package com.koreait.dto;

public class UserDTO {
	private String userid;
	private String userpw;
	private String username;
	private String usergender;
	private String zipcode;
	private String addr;
	private String addrdetail;
	private String addretc;
	// 체크박스로 오기 떄문에 여러개의 값이 넘어옴
	private String[] userhobby;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUsergender() {
		return usergender;
	}
	public void setUsergender(String usergender) {
		this.usergender = usergender;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrdetail() {
		return addrdetail;
	}
	public void setAddrdetail(String addrdetail) {
		this.addrdetail = addrdetail;
	}
	public String getAddretc() {
		return addretc;
	}
	public void setAddretc(String addretc) {
		this.addretc = addretc;
	}
	public String[] getUserhobby() {
		return userhobby;
	}
	public void setUserhobby(String[] userhobby) {
		this.userhobby = userhobby;
	}
	public String getHobbystr() {
		// MyBatis			실제로 찾는 것
		// #{userid}		getUserid()
		// #{hobbystr}		getHobbystr()
		
		String hobbyStr = userhobby[0];
		for (int i = 1; i < userhobby.length; i++) {
			hobbyStr += "," + userhobby[i];
		}
		return hobbyStr;
	}
}
