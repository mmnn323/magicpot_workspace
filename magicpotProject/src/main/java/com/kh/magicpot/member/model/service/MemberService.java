package com.kh.magicpot.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.member.model.vo.Address;
import com.kh.magicpot.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);
	
	//  아이디 중복체크
	int idCheck(String userId);
	
	//  회원 가입
	int insertMember(Member m);
	
	// 회원 상세조회
	Address selectMember(int memNo);
	
	//  회원 정보수정
	int updateMember(Member m);
	
	// 배송지 추가
	int insertAddress(HashMap<String, Object> map);


	
	// 일반회원관리 리스트 조회 (페이징 처리 회원 총 갯수)
	int selectListCount();

	// 요청한 페이지에 보여질 회원 리스트
	ArrayList<Member> selectList(PageInfo pi);
	
	// 회원 상세조회
	Member selectAdminMember(int memNo);
	
	
}
