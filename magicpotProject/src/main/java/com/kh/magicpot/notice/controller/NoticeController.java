package com.kh.magicpot.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.common.template.Pagination;
import com.kh.magicpot.notice.model.service.NoticeService;
import com.kh.magicpot.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	@RequestMapping("notice.li")
	public String selectNotice(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {

		int listCount = nService.selectListCount(); // 현재 게시글 총 수 
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 4);
		
		ArrayList<Notice> list = nService.selectNotice(pi);
		System.out.println(list);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "notice/noticeMain";
	}
	
	@RequestMapping("notice.de")
	public String selectNoticeDetail(int noNo, Model model) {
		
		Notice n = nService.selectNoticeDetail(noNo);
		model.addAttribute("n", n);
		System.out.println(n);
		return "notice/noticeDetail";
	}
	
}
