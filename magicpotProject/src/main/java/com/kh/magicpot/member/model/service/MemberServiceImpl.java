package com.kh.magicpot.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.member.model.dao.MemberDao;
import com.kh.magicpot.member.model.vo.Address;
import com.kh.magicpot.member.model.vo.Member;

@Service 
public class MemberServiceImpl implements MemberService {


	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao mDao;

	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession, m);
	}

	
	// 아이디 중복체크
	@Override
	public int idCheck(String userId) {
		return mDao.idCheck(sqlSession, userId);
	}

	// 회원가입
	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}

	// 배송지조회
	@Override
	public Address selectMember(int memNo) {
		return mDao.selectMember(sqlSession, memNo);
	}
	
	// 회원정보수정
	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession, m);
	}

	// 배송지추가	
	@Override
	public int insertAddress(HashMap<String, Object> map) {
		return mDao.insertAddress(sqlSession, map);
	}

	
	// 일반회원관리 리스트 조회 (페이징 처리 회원 총 갯수)
	@Override
	public int selectListCount() {
		return mDao.selectListCount(sqlSession);
	}

	// 요청한 페이지에 보여질 회원 리스트
	@Override
	public ArrayList<Member> selectList(PageInfo pi) {
		return mDao.selectList(sqlSession, pi);
	}

	// 회원 상세조회
	@Override
	public Member selectAdminMember(int memNo) {
		// TODO Auto-generated method stub
		return null;
	}

}
