package com.kh.magicpot.message.model.service;

import java.util.ArrayList;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.message.model.vo.MessageList;

public interface MessageService {
	
	// 일반 회원 메세지 리스트 조회
	public ArrayList<MessageList> msgList(int memNo, PageInfo pi);
	
	// 크리에이터 회원 메세지 리스트 조회
	public ArrayList<MessageList> creMsgList(int creNo, PageInfo pi);

	// 마이페이지 메세지 페이징 처리
	public int selectListCount(int memNo);

	// 안 읽은 메세지 페이징 처리
	public int selectStaListCount(int memNo);

	
	
	
}
