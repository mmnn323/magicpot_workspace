package com.kh.magicpot.guide.model.service;

import java.util.ArrayList;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.guide.model.vo.Faq;
import com.kh.magicpot.guide.model.vo.Guide;
import com.kh.magicpot.guide.model.vo.Guide2;

public interface GuideService {
	
	/* 다인 추가 - 이용약관 */
	// 이용약관 세부 / 수정용 페이지에 띄울 기본 이용약관
	public String proModifyForm();
	
	// 이용약관 수정
	public int proModify(String gu_provision);

	// 이용가이드 페이지
	public ArrayList<Guide2> guideForm(int ctg);
	
	// faq 갯수조회
	int selectListCount();
	
	// faq 리스트조회
	ArrayList<Faq> faqList(PageInfo pi);
	
	// faq 등록
	int insertForm(Faq fa);
	
	// faq 조회수 증가
	int increaseCount(int faqNo);
	
	// faq 상세조회
	Faq selectFaq(int faqNo);
	
	// faq 수정
	int updateFa(Faq fa);
	
	// faq 삭제
	int deleteFa(Faq fa);
	
	// 이용가이드 내용
	Guide2 guideDetail(int ctg);
	
	// 이용가이드 수정
	int updateGu(Guide2 gu);
}
