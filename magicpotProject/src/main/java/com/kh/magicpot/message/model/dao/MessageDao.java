package com.kh.magicpot.message.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.message.model.vo.MessageList;

@Repository
public class MessageDao {
	
	// 일반 회원 메세지 리스트 조회
	public ArrayList<MessageList> msgList(SqlSessionTemplate sqlSession, int memNo, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("messageMapper.msgList", memNo, rowBounds);
	}

	// 크리에이터 메세지 리스트 조회
	public ArrayList<MessageList> creMsgList(SqlSessionTemplate sqlSession, int creNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("messageMapper.creMsgList", creNo, rowBounds);
	}
	
	// 페이징 처리
	public int selectListCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("messageMapper.selectListCount", memNo);
	}

	// 안 읽은 메세지 페이징 처리
	public int selectStaListCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("messageMapper.selectStaListCount", memNo);
	}

	

}
