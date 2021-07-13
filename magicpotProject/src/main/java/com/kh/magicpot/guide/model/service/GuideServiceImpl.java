package com.kh.magicpot.guide.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.guide.model.dao.GuideDao;
import com.kh.magicpot.guide.model.vo.Faq;
import com.kh.magicpot.guide.model.vo.Guide;
import com.kh.magicpot.guide.model.vo.Guide2;

@Service
public class GuideServiceImpl implements GuideService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GuideDao gDao;

	
	/* 다인 추가 - 이용약관 */
	// 이용약관 세부 / 수정용 페이지에 띄울 기본 이용약관
	@Override
	public String proModifyForm() {
		return gDao.proModifyForm(sqlSession);
	}

	// 이용약관 수정
	@Override
	public int proModify(String gu_provision) {
		return gDao.proModify(sqlSession, gu_provision);		
	}

	// 이용가이드페이지
	@Override
	public ArrayList<Guide2> guideForm(int ctg) {
		return gDao.guideForm(sqlSession, ctg);	
	}
	
	// faq갯수조회
	@Override
	public int selectListCount() {
		return gDao.selectListCount(sqlSession);
	}
	
	// faq리스트조회
	@Override
	public ArrayList<Faq> faqList(PageInfo pi) {
		return gDao.faqList(sqlSession, pi);
	}
	
	// faq 등록
	@Override
	public int insertForm(Faq fa) {
		return gDao.insertForm(sqlSession, fa);
	}

	// faq 조회수 증가
	@Override
	public int increaseCount(int faqNo) {
		return gDao.increaseCount(sqlSession, faqNo);
	}

	// faq 상세조회
	@Override
	public Faq selectFaq(int faqNo) {
		return gDao.selectFaq(sqlSession, faqNo);
	}
	
	// faq 수정
	@Override
	public int updateFa(Faq fa) {
		return gDao.updateFa(sqlSession, fa);
	}
	
	// faq 삭제
	@Override
	public int deleteFa(Faq fa) {
		return gDao.deleteFa(sqlSession, fa);
	}

	// 이용가이드 내용
	@Override
	public Guide2 guideDetail(int ctg) {
		return gDao.guideDetail(sqlSession, ctg);
	}

	// 이용가이드 수정
	@Override
	public int updateGu(Guide2 gu) {
		return gDao.updateGu(sqlSession, gu);
	}
	
	
	
	
	
	
	
	
}
