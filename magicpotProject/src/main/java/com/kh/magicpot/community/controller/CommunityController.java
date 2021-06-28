package com.kh.magicpot.community.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.common.template.Pagination;
import com.kh.magicpot.community.model.service.CommunityService;
import com.kh.magicpot.community.model.vo.Community;
import com.kh.magicpot.community.model.vo.CommunityNotice;

@Controller
public class CommunityController {

	@Autowired
	private CommunityService cService;
	
	@RequestMapping("list.cm")
	public String selectCommunityList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		// 커뮤니티 공지사항 리스트 조회
		ArrayList<CommunityNotice> cnList = cService.selectCmNoticeList();
		
		// 커뮤니티 글 리스트 조회(페이징)
		int listCount = cService.selectCmListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 12);
		
		ArrayList<Community> cList = cService.selectCmList(pi);
		
		model.addAttribute("cnList", cnList);
		model.addAttribute("pi", pi);
		model.addAttribute("cList", cList);
		
		return "community/communityListView";
	}
	
	@RequestMapping("enrollForm.cn")
	public String cnEnrollForm() {
		return "community/communityNoticeEnrollForm";
	}
	
	@RequestMapping("insert.cn")
	public String insertCmNotice(CommunityNotice cn, HttpSession session, Model model) {
		int result = cService.insertCmNotice(cn);
		
		if(result > 0) { // 공지사항 등록 성공 => communityListView.jsp 재요청
			session.setAttribute("alertMsg", "공지사항이 등록되었습니다.");
			return "redirect:list.cm";
		}else { // 공지사항 등록 실패
//			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
}
