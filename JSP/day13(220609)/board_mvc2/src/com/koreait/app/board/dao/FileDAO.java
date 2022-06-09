package com.koreait.app.board.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.SqlMapConfig;

public class FileDAO {
	SqlSession sqlsession;
	
	public FileDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
		//true로 설정시 오토커밋 : 데이터베이스 파일에 바로 적용
	}

	public boolean insertFile(FileDTO file) {
		return sqlsession.insert("File.insertFile", file) == 1;
	}

	public List<FileDTO> getFiles(int boardnum) {
		return sqlsession.selectList("File.getFiles", boardnum);
	}

	public void deleteByName(String systemname) {
		sqlsession.delete("File.deleteByName",systemname);
	}
}
