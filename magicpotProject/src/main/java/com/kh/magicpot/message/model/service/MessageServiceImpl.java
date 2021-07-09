package com.kh.magicpot.message.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.message.model.dao.MessageDao;
import com.kh.magicpot.message.model.vo.MessageList;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MessageDao msgDao;
	
	// 일반 회원 메세지 리스트 조회
	@Override
	public ArrayList<MessageList> msgList(int memNo, PageInfo pi) {
		return msgDao.msgList(sqlSession, memNo, pi);
	}

	// 크리에이터 메세지 리스트 조회
	@Override
	public ArrayList<MessageList> creMsgList(int creNo, PageInfo pi) {
		return msgDao.creMsgList(sqlSession, creNo, pi);
	}	
	
	// 페이징 처리
	@Override
	public int selectListCount(int memNo) {
		return msgDao.selectListCount(sqlSession, memNo);
	}

	// 안 읽은 메세지 페이징 처리
	@Override
	public int selectStaListCount(int memNo) {
		return msgDao.selectStaListCount(sqlSession, memNo);
	}




	
	
}
