package com.kh.magicpot.guide.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.magicpot.guide.model.service.GuideService;

@Controller
public class GuideController {
	
	@Autowired
	private GuideService gService;

	
	// 관리자 이용약관 리스트 포워딩
	@RequestMapping("adminProList.gu")
	public String provisionList () {
		return "provision/adminProvisionList";
	}
	
	
	
}
