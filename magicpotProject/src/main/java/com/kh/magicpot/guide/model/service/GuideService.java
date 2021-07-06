package com.kh.magicpot.guide.model.service;

public interface GuideService {
	
	/* 다인 추가 - 이용약관 */
	// 이용약관 세부 / 수정용 페이지에 띄울 기본 이용약관
	public String proModifyForm();
	
	// 이용약관 수정
	public int proModify(String gu_provision);


}
