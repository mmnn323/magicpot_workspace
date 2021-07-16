package com.kh.magicpot.message.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.message.model.dao.MessageDao;
import com.kh.magicpot.message.model.vo.Message;
import com.kh.magicpot.message.model.vo.MessageList;
import com.kh.magicpot.project.model.vo.Creator;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MessageDao msgDao;
	
	// 새로운 문의사항 추가
	@Override
	public int newMessage(Message m) {
		return msgDao.newMessage(sqlSession, m);
	}
	
	// 일반 회원 메세지 리스트 조회
	@Override
	public ArrayList<MessageList> msgList(int memNo, PageInfo pi) {
		return msgDao.msgList(sqlSession, memNo, pi);
	}
	
	// 일반회원 페이징 처리
	@Override
	public int selectListCount(int memNo) {
		return msgDao.selectListCount(sqlSession, memNo);
	}
	
	
	// 크리에이터 조회
	@Override
	public Creator creatorNo(int memNo) {
		return msgDao.creatorNo(sqlSession, memNo);
	}

	// 크리에이터 메세지 리스트 조회
	@Override
	public ArrayList<MessageList> creMsgList(int creNo, PageInfo pi) {
		return msgDao.creMsgList(sqlSession, creNo, pi);
	}	
	
	// 크리에이터 페이징 처리
	@Override
	public int selectCreListCount(int creNo) {
		return msgDao.selectCreListCount(sqlSession, creNo);
	}

	
	// 모달 조회
	@Override
	public MessageList msgModal(int msgNo) {
		return msgDao.msgModal(sqlSession, msgNo);
	}
	
	
	// 안 읽은 메세지 리스트 조회
	@Override
	public ArrayList<MessageList> notReadList(int creNo, PageInfo pi){
		return msgDao.notReadList(sqlSession, creNo, pi);
	}
	
	// 안 읽은 메세지 페이징 처리
	@Override
	public int selectStaListCount(int memNo) {
		return msgDao.selectStaListCount(sqlSession, memNo);
	}

	// 문의 답변 추가
	@Override
	public int insertMsg(Message m) {
		return msgDao.insertMsg(sqlSession, m);
	}


	




	
	
}
