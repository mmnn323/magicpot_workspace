package com.kh.magicpot.member.model.service;

import java.util.ArrayList;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);
	
	//  아이디 중복체크
	int idCheck(String userId);
	
	//  회원 가입
	int insertMember(Member m);
	
	// 일반회원관리 게시판 리스트 조회(페이징 처리)
	int selectListCount(); //게시글 총 갯수
	ArrayList<Member> selectList(PageInfo pi);//몇 번 페이지 요청했고, 그 페이지에 몇개의 게시글 조회 PageInfo
	
	// 일반회원관리 상세조회
	Member selectMember(int memNo);
}
