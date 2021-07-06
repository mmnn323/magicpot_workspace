package com.kh.magicpot.guide.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.magicpot.guide.model.service.GuideService;
import com.kh.magicpot.guide.model.vo.Guide;
import com.kh.magicpot.member.model.vo.Address;
import com.kh.magicpot.member.model.vo.Member;

@Controller
public class GuideController {
	
	@Autowired
	private GuideService gService;

	
	// 이용약관 detailView 페이지 포워딩
	@RequestMapping("provision.gu")
	public String provisionView(Model model) {
		
		model.addAttribute("provision", gService.proModifyForm());
		return "guide/provisionDetailView";
	}
	
	// 관리자 이용약관 수정 페이지 포워딩
	@RequestMapping("proModifyForm.gu")
	public String proModifyForm (Model model) {
		
		model.addAttribute("provision", gService.proModifyForm());
		return "guide/adminProvisionModifyForm";
	}
	
	// 이용약관 수정
	@RequestMapping("proModify.gu")
	public String proModify(String gu_provision, HttpSession session) {
		
		int result = gService.proModify(gu_provision);
		
		if(result >0) {	// 이용약관 수정 성공	
			
			session.setAttribute("alertMsg", "이용약관이 성공적으로 수정되었습니다.");
			return "redirect:/provision.gu";
			
		} else {	// 이용약관 수정 실패
			
			return "common/errorPage";
		}
	}
	
	// 이용가이드페이지
	@RequestMapping("guide.me")
	public String guideForm(@RequestParam(value="ctg", defaultValue="0") int ctg,
							HttpSession session, Model model) {
		
		ArrayList<Guide> gu = gService.guideForm(ctg);
		
		model.addAttribute("gu",gu);
		return "guide/guideMain";
	}
	
	
}
