package com.koreait.app.board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.koreait.mybatis.SqlMapConfig;

public class BoardDAO {
	SqlSession sqlsession;
	
	public BoardDAO() {
		sqlsession = SqlMapConfig.getFactory().openSession(true);
		//true로 설정시 오토커밋 : 데이터베이스 파일에 바로 적용
	}

	public int getBoardCnt() {
		return sqlsession.selectOne("Board.getBoardCnt");
	}

	public List<BoardDTO> getBoardList(int startRow, int pageSize) {
		HashMap<String, Object> datas = new HashMap<String, Object>();
		
		List<BoardDTO> result;
		datas.put("startRow", startRow);
		datas.put("pageSize", pageSize);
		// selectList로 검색해오면 그 모든 행들을 객체로 만들고 그것들이 담겨있는 List를 리턴
		result = sqlsession.selectList("Board.getBoardList", datas);
		return result;
	}
}
