package com.kh.magicpot.message.model.service;

import java.util.ArrayList;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.message.model.vo.Message;
import com.kh.magicpot.message.model.vo.MessageList;
import com.kh.magicpot.project.model.vo.Creator;

public interface MessageService {
	
	// 새로운 문의사항 추가
	int newMessage(Message m);
	
	// 일반 회원 메세지 리스트 조회
	public ArrayList<MessageList> msgList(int memNo, PageInfo pi);
	
	// 일반회원 메세지 페이징 처리
	public int selectListCount(int memNo);
	
	
	// 크리에이터 조회
	public Creator creatorNo(int memNo);
	
	// 크리에이터 회원 메세지 리스트 조회
	public ArrayList<MessageList> creMsgList(int creNo, PageInfo pi);

	// 크리에이터 메세지 페이징 처리
	public int selectCreListCount(int creNo);

	
	// 모달 조회
	public MessageList msgModal(int msgNo);
	
	
	// 안 읽은 메세지 리스트 조회
	public ArrayList<MessageList> notReadList(int creNo, PageInfo pi);
	
	// 안 읽은 메세지 페이징 처리
	public int selectStaListCount(int memNo);

	
	// 문의 답변 추가
	public int insertMsg(Message m);


	
	
	
}
