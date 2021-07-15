package com.kh.magicpot.message.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.common.template.Pagination;
import com.kh.magicpot.member.model.vo.Member;
import com.kh.magicpot.message.model.service.MessageService;
import com.kh.magicpot.message.model.vo.Message;
import com.kh.magicpot.project.model.vo.Creator;

@Controller
public class MessageController {

	@Autowired
	private MessageService msgService;
	
	// 새 문의사항 추가
	@RequestMapping("newMessage.msg")
	public String newMessage(Message m, HttpSession session) {
		
		int result = msgService.newMessage(m);

		System.out.println(m.getMsgNo());
		System.out.println(m.getMemNo());
		System.out.println(m.getCreatorNo());
		System.out.println(m.getMsgSend());
		System.out.println(m.getMsgContent());
		System.out.println(m.getProNo());
		
		if(result > 0) {
			session.setAttribute("alertMsg", "크리에이터에게 문의 사항이 전달되었습니다. ");
			return "project/fundingDetail";
			
		} else {
			return "common/errorPage";
		}
	}
	
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
		return "message/myPageMessage";
	}
	
	
	// 크리에이터 메세지 리스트 조회
	@RequestMapping("creatorMsg.me")
	public String creMsgList(HttpSession session, Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {
	
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// 크리에이터 조회
		Creator loginCreator = msgService.creatorNo(loginUser.getMemNo());
		
		// 페이징 처리
		int listCount = msgService.selectCreListCount(loginCreator.getCreNo());
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		model.addAttribute("pi", pi);
		
		// 리스트 조회
		model.addAttribute("creMsgList", msgService.creMsgList(loginCreator.getCreNo(), pi));
		return "message/creatorMessage";
	}
	
	
	// 모달에 띄울 메세지 조회 (크리에이터)
	@ResponseBody 
	@RequestMapping(value="creMsgmodal.msg", produces="application/json; charset=utf-8")
	public String creMsgModal (Model model, int msgNo) {
		
		//System.out.println(msgNo);
		
		return new Gson().toJson(msgService.msgModal(msgNo));
	}
	
	// 모달에 띄울 메세지 조회 (일반회원)
	@ResponseBody
	@RequestMapping(value="msgModal.msg", produces="application/json; charset=utf-8")
	public String msgModal (Model model, int msgNo) {
		return new Gson().toJson(msgService.msgModal(msgNo));
		
	}
	
	
	// 안 읽은 메세지 리스트 조회
	@ResponseBody 
	@RequestMapping(value="notRead.msg", produces="application/json; charset=utf-8")
	public String msgStaList(HttpSession session, Model model, @RequestParam(value="currentPage", defaultValue="1") int currentPage) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		
		// 크리에이터 조회
		Creator loginCreator = msgService.creatorNo(loginUser.getMemNo());
		
		// 안읽은 메세지 페이징 처리
		int statusListCount = msgService.selectStaListCount(loginUser.getMemNo());
		PageInfo pi = Pagination.getPageInfo(statusListCount, currentPage, 5, 5);
		model.addAttribute("pi", pi);
		
		//System.out.println(loginCreator.getCreNo());
		
		return new Gson().toJson(msgService.notReadList(loginCreator.getCreNo(), pi));
	}
	
	
	// 문의 답변 추가
	@ResponseBody
	@RequestMapping("insertMsg.msg")
	public String insertMsg(Message m) {
		
		//int msgNum = Integer.parseInt(msgNo);
		
		//System.out.println(msgNo);
		//System.out.println(msgReply);
		
		int result = msgService.insertMsg(m);
		
		if(result > 0) {
			return "success";
		} else {
			return "false";
		}
	}
	
}
