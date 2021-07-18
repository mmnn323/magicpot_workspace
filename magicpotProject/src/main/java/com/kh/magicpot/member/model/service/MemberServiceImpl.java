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
import com.kh.magicpot.project.model.vo.Creator;
import com.kh.magicpot.project.model.vo.Project;

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
	public ArrayList<Address> selectMember(int memNo) {
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


	@Override
	public Address selectDefault(int memNo) {
		return mDao.selectDefault(sqlSession, memNo);
	}

	@Override
	public Address selectAddress(int adNo) {
		return mDao.selectAddress(sqlSession, adNo);
	}


	@Override
	public int fixAddress(Address a) {
		return mDao.fixAddress(sqlSession, a);
	}


	@Override
	public int deleteAddress(int adNo) {
		return mDao.deleteAddress(sqlSession, adNo);
	}


	@Override
	public int fixAddress2(Address a) {
		return mDao.fixAddress2(sqlSession, a);
	}
	
	@Override
	public int fixAddress3(Address a) {
		return mDao.fixAddress3(sqlSession, a);
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
		return mDao.selectAdminMember(sqlSession, memNo);
	}
	
	
	// 크리에이터 조회
	@Override
	public Creator creatSearch(int memNo) {
		return mDao.creatSearch(sqlSession, memNo);
	}
	

	// 내가 만든 프로젝트조회
	@Override
	public ArrayList<Project> madeProject(int creNo) {
		return mDao.madeProject(sqlSession, creNo);
	}

	// 내가 만든 프로젝트삭제
	@Override
	public int deleteMyProject(int proNo) {
		return mDao.deleteMyProject(sqlSession, proNo);
	}

	// 회원탈퇴
	@Override
	public int deleteMember(String memId) {
		return mDao.deleteMember(sqlSession, memId);
	}

	// 일반회원관리 상세 회원 탈퇴
	@Override
	public int deleteAdminMember(int memNo) {
		return mDao.deleteAdminMember(sqlSession, memNo);
	}

	// 일반회원관리 다중 선택 회원 탈퇴
	@Override
	public int multiDeleteAdopt(Member m) {
		return mDao.multiDeleteAdopt(sqlSession, m);
	}


	// 일반회원관리 검색
	@Override
	public ArrayList<Member> searchAdminList(HashMap<String, Object> map) {
		return mDao.searchAdminList(sqlSession, map);
	}








}
