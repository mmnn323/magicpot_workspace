package com.kh.magicpot.notice.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.common.template.Pagination;
import com.kh.magicpot.notice.model.service.NoticeService;
import com.kh.magicpot.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	/* 공지사항 리스트 */
	@RequestMapping("notice.li")
	public String selectNotice(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {

		int listCount = nService.selectListCount(); // 현재 게시글 총 수 
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 4);
		
		ArrayList<Notice> list = nService.selectNotice(pi);
		//System.out.println(list);
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "notice/noticeMain";
	}
	
	/* 공지사항 디테일 */
	@RequestMapping("notice.de")
	public String selectNoticeDetail(int nno, Model model) {
		
		Notice n = nService.selectNoticeDetail(nno);
		model.addAttribute("n", n);
		//System.out.println(n);
		return "notice/noticeDetail";
	}
	
	/* 공지사항 작성페이지  */
	@RequestMapping("enroll.no")
	public String enrollNotice() {
		
		return "notice/noticeEnroll";
	}

	/* 공지사항 작성 등록 */
	@RequestMapping("insert.no")
	public String insertNotice(Notice n, MultipartFile upfile, HttpSession session, Model model) {
		
		
		// 전달된 파일이 있을 경우(upfile의 원본명이 빈 문자열이 아닌 경우)
		if(!upfile.getOriginalFilename().equals("")) {
		String changeName = saveFile(session, upfile);

		n.setOrgFileName(upfile.getOriginalFilename());
		n.setNoRoute("resources/notice_uploadFiles/" + changeName); // 업로드된파일명+파일명
		
		}
								
		int result = nService.insertNotice(n);
		
		System.out.println(result);
		
		if(result > 0) { // 게시글 등록 성공
			session.setAttribute("alertMsg", "게시글이 등록되었습니다.");
			return "redirect:notice.li";
		}else {
			return "common/errorPage";
		}
		
	}

	private String saveFile(HttpSession session, MultipartFile upfile) {
		String savePath = session.getServletContext().getRealPath("/resources/notice_uploadFiles/");
		String originName = upfile.getOriginalFilename();
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = "MagigPot_" + currentTime + ranNum + ext;
		try {
			upfile.transferTo(new File(savePath + changeName));
			//System.out.println(savePath + changeName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return changeName;
	}
}
