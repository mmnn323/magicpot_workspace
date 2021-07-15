package com.kh.magicpot.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class chatController {

	/**
	 * 매직팟 실시간 상담 채팅창 요청
	 * @return
	 */
	@RequestMapping("startChat.do")
	public String cmNoticeEnrollForm() {
		return "chat/chatRoom";
	}
}
