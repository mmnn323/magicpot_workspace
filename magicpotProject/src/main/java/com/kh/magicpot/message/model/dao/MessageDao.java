package com.kh.magicpot.message.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.message.model.vo.Message;
import com.kh.magicpot.message.model.vo.MessageList;
import com.kh.magicpot.project.model.vo.Creator;

@Repository
public class MessageDao {
	
	// 새로운 문의사항 추가
	public int newMessage(SqlSessionTemplate sqlSession, Message m) {
		return sqlSession.insert("messageMapper.newMessage", m);
	}

	// 일반 회원 메세지 리스트 조회
	public ArrayList<MessageList> msgList(SqlSessionTemplate sqlSession, int memNo, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("messageMapper.msgList", memNo, rowBounds);
	}
	
	// 일반 회원 페이징 처리
	public int selectListCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("messageMapper.selectListCount", memNo);
	}

	
	
	// 크리에이터 조회
	public Creator creatorNo (SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("messageMapper.creatorNo", memNo);
	}
	
	// 크리에이터 메세지 리스트 조회
	public ArrayList<MessageList> creMsgList(SqlSessionTemplate sqlSession, int creNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("messageMapper.creMsgList", creNo, rowBounds);
	}
	
	// 크리에이터 페이징 처리
	public int selectCreListCount(SqlSessionTemplate sqlSession, int creNo) {
		return sqlSession.selectOne("messageMapper.selectCreListCount", creNo);
	}
	
	// 모달 조회
	public MessageList msgModal(SqlSessionTemplate sqlSession, int msgNo) {
		return sqlSession.selectOne("messageMapper.msgModal", msgNo);
	}
	
	// 안 읽은 메세지 리스트 조회
	public ArrayList<MessageList> notReadList(SqlSessionTemplate sqlSession, int creNo, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("messageMapper.notReadList", creNo, rowBounds);
	}
	
	// 안 읽은 메세지 페이징 처리
	public int selectStaListCount(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("messageMapper.selectStaListCount", memNo);
	}
	
	// 문의 답변 추가
	public int insertMsg(SqlSessionTemplate sqlSession, Message message) {
		return sqlSession.update("messageMapper.insertMsg", message);
	}


	

}
