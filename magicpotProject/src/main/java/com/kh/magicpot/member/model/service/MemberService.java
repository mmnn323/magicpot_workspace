package com.kh.magicpot.member.model.service;

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
	
	
	
}
