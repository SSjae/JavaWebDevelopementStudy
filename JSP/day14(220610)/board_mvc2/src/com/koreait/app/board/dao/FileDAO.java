package com.koreait.app.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.SqlMapConfig;

public class FileDAO {
	SqlSession sqlsession;
	public FileDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
	}
	
	public boolean insertFile(FileDTO file) {
		return 1 == sqlsession.insert("File.insertFile",file);
	}
	
	public List<FileDTO> getFiles(int boardnum){
		return sqlsession.selectList("File.getFiles",boardnum);
	}

	public void deleteByName(String systemname) {
		sqlsession.delete("File.deleteByName",systemname);
	}
}
