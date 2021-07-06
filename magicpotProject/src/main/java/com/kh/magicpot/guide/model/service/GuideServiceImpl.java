package com.kh.magicpot.guide.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.guide.model.dao.GuideDao;
import com.kh.magicpot.guide.model.vo.Guide;

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
	public ArrayList<Guide> guideForm(int ctg) {
		return gDao.guideForm(sqlSession, ctg);	
	}
	
	
	
	
	
	
}
