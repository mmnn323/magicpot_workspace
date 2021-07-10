package com.kh.magicpot.guide.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.common.template.Pagination;
import com.kh.magicpot.guide.model.service.GuideService;
import com.kh.magicpot.guide.model.vo.Faq;
import com.kh.magicpot.guide.model.vo.Guide;
import com.kh.magicpot.guide.model.vo.Guide2;

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
		
		ArrayList<Guide2> gu = gService.guideForm(ctg);
		
		model.addAttribute("gu",gu);
		return "guide/guideMain";
	}
	
	// faq페이지
	@RequestMapping("faq.li")
	public String faqList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, Model model) {
			
		int listCount = gService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
			
		ArrayList<Faq> fa = gService.faqList(pi);
			
		model.addAttribute("fa",fa);
		model.addAttribute("pi", pi);
		return "guide/faqList";
	}
		
	// faq 등록페이지폼이동
	@RequestMapping("enrollForm.fa")
	public String enrollForm() {
			
			
		return "guide/faqEnrollForm";
	}
	
	// faq 등록
	@RequestMapping("insert.fa")
	public String insertForm(Faq fa, Model model, HttpSession session) {
		int result = gService.insertForm(fa);
		
		if(result > 0) { 
			session.setAttribute("alertMsg", "성공적으로 FAQ가 등록되었습니다");
			return "redirect:faq.li"; 
			
		}else { 
			model.addAttribute("errorMsg", "게시글 등록 실패");	
			return "common/errorPage";
		}
	}
	
	// faq 상세조회
	@RequestMapping("detail.fa")
	public String selectFaq(int faqNo, Model model) {
		
		int result = gService.increaseCount(faqNo); 
		
		if(result > 0) { 
			Faq fa = gService.selectFaq(faqNo);

			model.addAttribute("fa", fa);
			
			return "guide/faqDetail";
			
		}else { 
			model.addAttribute("errorMsg", "유효하지 않은 게시글 입니다.");
			return "common/errorPage";
		}
	}
	
	// faq 수정페이지 폼
	@RequestMapping("updateForm.fa")
	public String updateForm(int faqNo, Model model) {
		
		
		Faq fa = gService.selectFaq(faqNo);

		model.addAttribute("fa", fa);
		return "guide/faqUpdateForm";
			
		
	}
	
	// faq 수정
	@RequestMapping("update.fa")
	public String updateFa(Faq fa, Model model,  HttpSession session) {
		
		int result = gService.updateFa(fa);

		if(result > 0) { 
			session.setAttribute("alertMsg", "게시글이 성공적으로 수정되었습니다.");
			return "redirect:detail.fa?faqNo=" + fa.getFaqNo();
		}else { 
			
			model.addAttribute("errorMsg", "게시글 수정실패");
			return "common/errorPage";
		}
			
		
	}
	
	// faq 삭제
	@RequestMapping("delete.fa")
	public String deleteFa(Faq fa, Model model,  HttpSession session) {
		
		int result = gService.deleteFa(fa);

		if(result > 0) { 
			session.setAttribute("alertMsg", "게시글이 성공적으로 삭제되었습니다.");
			return "redirect:faq.li";
		}else { 
			
			model.addAttribute("errorMsg", "게시글 삭제실패");
			return "common/errorPage";
		}
			
		
	}
	
	// 관리자 이용가이드 목록
	@RequestMapping("adminProList.gu")
	public String guideForm( Model model) {
		

		return "guide/adminGuideList";
	}
	
	// 관리자 이용가이드 내용
	@RequestMapping("detail.gu")
	public String guideDetail(@RequestParam(value="ctg") int ctg,
							HttpSession session, Model model) {
		
		Guide2 gu = gService.guideDetail(ctg);
		
		System.out.println(gu);
		model.addAttribute("gu",gu);
		return "guide/adminGuideDetail";
	}
	
	// 관리자 이용가이드 수정
	@RequestMapping("update.adGu")
	public String updateGu(Guide2 gu, Model model,  HttpSession session) {
		
		int result = gService.updateGu(gu);

		if(result > 0) { 
			return "guide/adminGuideList";
		}else { 

			return "common/errorPage";
		}
			
		
	}
}
