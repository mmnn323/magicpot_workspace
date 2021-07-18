package com.kh.magicpot.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.common.template.Pagination;
import com.kh.magicpot.report.model.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService rService;
	
	
	// 관리자 블랙리스트 조회 페이지 연결
	@RequestMapping("adminBlacklist.re")
	public String adminBlacklist (Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		// 패이징 처리
		int listCount = rService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		model.addAttribute("pi", pi);
		
		// 블랙리스트 조회
		model.addAttribute("adminBlacklist", rService.adminBlacklist(pi));
		return "report/adminBlacklistListView";
	}
	
	// 블랙리스트 모달 조회
	@ResponseBody
	@RequestMapping(value="modalBlacklist.re", produces="application/json; charset=utf-8")
	public String modalBlacklist (Model model, int blacklistNo) {
		return new Gson().toJson(rService.modalBlacklist(blacklistNo));
	}
	
	
	// 관리자 신고 관리 페이지 연결
	@RequestMapping("adminReportList.re")
	public String adminReportList (Model model, @RequestParam(value="currentPage", defaultValue="1")int currentPage) {
		
		// 페이징 처리
		int listCount = rService.selectReListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		model.addAttribute("pi", pi);
		
		// 신고 관리 리스트 조회
		model.addAttribute("adminReportList", rService.adminReportList(pi));
		return "report/adminReportList";
	}

	// 관리자 신고 리스트 - 원본글 확인
	@ResponseBody
	@RequestMapping("cmPage.re")
	public String cmPage (int cmcoNo) {
		
		return "http://localhost:8883/magicpot/detail.cm?cmNo=" + rService.cmPage(cmcoNo);
	}
	

}
