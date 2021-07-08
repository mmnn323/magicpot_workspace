package com.kh.magicpot.message.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.common.template.Pagination;
import com.kh.magicpot.member.model.vo.Member;
import com.kh.magicpot.message.model.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	private MessageService msgService;
	
	
	// 일반 회원 메세지 리스트 조회
	@RequestMapping("myPageMsg.me")
	public String msgList(HttpSession session, Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
	
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// 페이징 처리
		int listCount = msgService.selectListCount(loginUser.getMemNo());
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		model.addAttribute("pi", pi);
		
		// 리스트 조회
		model.addAttribute("msgList", msgService.msgList(loginUser.getMemNo(), pi));
		
			System.out.println(model.getAttribute("msgList"));
			System.out.println(loginUser.getStatus());
			return "message/myPageMessage";
	}
	
	
	// 크리에이터 메세지 리스트 조회
	@RequestMapping("creatorMsg.me")
	public String creMsgList(HttpSession session, Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
	
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// 페이징 처리
		int listCount = msgService.selectListCount(loginUser.getCreNo());
	
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		model.addAttribute("pi", pi);
		
		// 리스트 조회
		model.addAttribute("creMsgList", msgService.creMsgList(loginUser.getCreNo(), pi));
	
			System.out.println(model.getAttribute("creMsgList"));
			System.out.println(loginUser.getCreNo());
			System.out.println(loginUser.getStatus());
			return "message/creatorMessage";
	}
	
	
	
	
	
	// 안 읽은 메세지 리스트 조회
	public String msgStaList(Member loginUser, Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
		
		// 안읽은 메세지 페이징 처리
		int statusListCount = msgService.selectStaListCount(loginUser.getMemNo());
		PageInfo pi = Pagination.getPageInfo(statusListCount, currentPage, 5, 5);
		model.addAttribute("pi", pi);
		
		model.addAttribute("msgStatusList", msgService.msgList(loginUser.getMemNo(), pi));
		
		return "";
	}
	
	
	
	
	
}
