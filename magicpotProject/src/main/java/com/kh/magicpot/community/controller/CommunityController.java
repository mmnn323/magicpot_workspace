package com.kh.magicpot.community.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.common.template.Pagination;
import com.kh.magicpot.community.model.service.CommunityService;
import com.kh.magicpot.community.model.vo.Community;
import com.kh.magicpot.community.model.vo.CommunityComment;
import com.kh.magicpot.community.model.vo.CommunityNotice;

@Controller
public class CommunityController {

	/**
	 * 전역변수
	 */
	@Autowired
	private CommunityService cService;
	
	/**
	 * 커뮤니티 리스트 조회
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping("list.cm")
	public String selectCommunityList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
									  @RequestParam(value="ctg", defaultValue="0") int ctg,
									  Model model) {
		
		// 카테고리 값 잘 넘어오는지 확인
		// System.out.println(ctg); 잘 넘어옴
		
		
		
		// 커뮤니티 공지사항 리스트 조회
		ArrayList<CommunityNotice> cnList = cService.selectCmNoticeList();
		
		// 커뮤니티 글 리스트 조회(페이징)
		int listCount = cService.selectCmListCount(ctg);
		// 카테고리별 글 카운트 잘 넘어오는지 확인
		//System.out.println(listCount); 잘 넘어옴
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 12);
		
		ArrayList<Community> cList = cService.selectCmList(pi, ctg);
		
		model.addAttribute("cnList", cnList);
		model.addAttribute("pi", pi);
		model.addAttribute("cList", cList);
		model.addAttribute("ctg", ctg);
		
		return "community/communityListView";
				
	}
	
	/**
	 * 커뮤니티 검색
	 * @param currentPage
	 * @param ctg
	 * @param condition
	 * @param cmKeyword
	 * @param model
	 * @param map
	 * @return
	 */
	@RequestMapping("search.cm")
	public String searchCommunity(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			  					  @RequestParam(value="ctg", defaultValue="0") int ctg,
			  					  String condition,
			  					  String cmKeyword,
			  					  Model model,
			  					  HashMap<String, Object> map
			  					  ) {
		// HashMap에 담아서 요청
		map.put("currentPage",currentPage);
		map.put("ctg", ctg);
		map.put("condition", condition);
		map.put("cmKeyword", cmKeyword);
		
		// 커뮤니티 공지사항 리스트 조회
		ArrayList<CommunityNotice> cnList = cService.selectCmNoticeList();
		
		// 검색 조건에 만족하는 게시글 총 갯수 조회 , 검색 조건에 만족하는 페이징 처리
		int searchCount = cService.selectSearchListCount(map);
		
		PageInfo pi = Pagination.getPageInfo(searchCount, currentPage, 5, 12);
		ArrayList<Community> cList = cService.selectSearchList(pi, map);
		
		// Model 객체에 응답데이터 담기
		model.addAttribute("cnList", cnList);
		model.addAttribute("pi", pi);
		model.addAttribute("cList", cList);
		model.addAttribute("ctg", ctg);
		model.addAttribute("condition", condition);
		model.addAttribute("cmKeyword", cmKeyword);

		return "community/communityListView";
		
	}
	
	/**
	 * 커뮤니티 공지사항 등록폼 요청
	 * @return
	 */
	@RequestMapping("enrollForm.cn")
	public String cmNoticeEnrollForm() {
		return "community/communityNoticeEnrollForm";
	}
	
	/**
	 * 커뮤니티 공지사항 등록
	 * @param cn
	 * @param session
	 * @param model
	 * @return
	 */
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
	
	/**
	 * 커뮤니티 공지사항 상세조회
	 * @param cnno
	 * @return
	 */
	@RequestMapping("detail.cn")
	public String cmNotiveDetailView(int cnno, Model model) {
		// 조회수 증가
		int result = cService.increaseCmNoticeCount(cnno);
		
		if(result > 0) { // 조회수 증가 성공 => 상세보기 요청
			CommunityNotice cn = cService.selectCmNotice(cnno);
			model.addAttribute("cn", cn);
			return "community/communityNoticeDetailView";
		}else { // 조회수 증가 실패 => 에러페이지 포워딩
			return "common/errorPage";
		}
	}
	
	/**
	 * 커뮤니티 공지사항 업데이트 폼 요청
	 * @param cnno
	 * @return
	 */
	@RequestMapping("updateForm.cn")
	public String cmNoticeUpdateForm(int cnno, Model model) {
//		CommunityNotice cn = cService.selectCmNotice(cnno);
//		model.addAttribute("cn", cn);
		model.addAttribute("cn", cService.selectCmNotice(cnno));
		return "community/communityNoticeUpdateForm";
	}
	
	/**
	 * 커뮤니티 공지사항 업데이트
	 * @param cnno
	 * @param model
	 * @return
	 */
	@RequestMapping("update.cn")
	public String cmNoticeUpdate(CommunityNotice cn, HttpSession session, Model model) {
		int result = cService.updateCmNotice(cn);
		
		if(result > 0) { // 수정 성공
			session.setAttribute("alertMsg", "커뮤니티 공지사항이 수정되었습니다.");
			return "redirect:detail.cn?cnno=" + cn.getCmNoticeNo();
		}else { // 수정 실패
			return "common/errorPage";
		}
	}
	
	/**
	 * 커뮤니티 공지사항 삭제
	 * @param cnno
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("delete.cn")
	public String cmNoticeDelete(int cnno, HttpSession session, Model model) {
		int result = cService.deleteCmNotice(cnno);
		
		if(result > 0) { // 삭제 성공
			session.setAttribute("alertMsg", "커뮤니티 공지사항이 삭제되었습니다.");
			return "redirect:list.cm";
		}else { // 삭제 실패
			return "common/errorPage";
		}
	}
	
	/**
	 * 커뮤니티 게시글 등록 폼
	 * @return
	 */
	@RequestMapping("enrollForm.cm")
	public String communityEnrollForm() {
		return "community/communityEnrollForm";
	}
	
	/**
	 * 커뮤니티 게시글 등록 (써머노트 사진 경로 변경 및 첨부파일 수정명 반환)
	 * @param multipartFile
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpSession session)  {
		
		JsonObject jsonObject = new JsonObject();
		
		String savedFileName = saveFile(session, multipartFile);
		jsonObject.addProperty("url", "resources/community_uploadFiles/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
		//jsonObject.addProperty("responseCode", "success");
		
		String a = jsonObject.toString();
		return a;
	}
	
	/**
	 * 커뮤니티 게시글 등록
	 * @param cm
	 * @return
	 */
	@RequestMapping("enroll.cm")
	public String insertCommunity(Community cm, MultipartFile upfile, HttpSession session) {
		//System.out.println(cm); 잘 넘어옴
		//System.out.println(upfile.getOriginalFilename()); 잘 넘어옴
		
		// 전달된 파일이 있을 경우(upfile의 원본명이 빈 문자열이 아닌 경우)
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(session, upfile);
			cm.setCmImage("resources/community_uploadFiles/" + changeName); // 경로담기
		}
		
		//System.out.println(cm); //cmImage 잘 담김
		
		int result = cService.insertCommunity(cm);
		
		if(result > 0) { // 게시글 등록 성공
			session.setAttribute("alertMsg", "게시글이 등록되었습니다.");
			return "redirect:list.cm";
		}else {
			return "common/errorPage";
		}
	}
	
	/**
	 * 첨부파일 수정명 작업 메소드
	 * @param session
	 * @param upfile
	 * @return
	 */
	public String saveFile(HttpSession session, MultipartFile upfile) {
		String savePath = session.getServletContext().getRealPath("/resources/community_uploadFiles/");
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
	
	/**
	 * 커뮤니티 게시글 상세조회
	 * @param cmNo
	 * @param model
	 * @return
	 */
	@RequestMapping("detail.cm")
	public String selectCommunity(int cmNo, Model model) {
		
		// 조회수 증가
		int result = cService.increaseCmCount(cmNo);
		
		if(result > 0) { // 조회수 증가 성공 => 게시글 상세조회 요청
			Community cm = cService.selectCommunity(cmNo);
			model.addAttribute("cm", cm);
			return "community/communityDetailView";
		}else { // 에러페이지
			return "common/errorPage";
		}
	}
	
	/**
	 * 커뮤니티 게시글 수정 폼 요청
	 * @param cmNo
	 * @param model
	 * @return
	 */
	@RequestMapping("updateForm.cm")
	public String communityUpdateForm(int cmNo, Model model) {
		model.addAttribute("cm", cService.selectCommunity(cmNo));
		return "community/communityUpdateForm";
	}
	
	/**
	 * 커뮤니티 게시글 수정
	 * @param cm
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("update.cm")
	public String communityUpdate(Community cm, MultipartFile reUpfile, HttpSession session, Model model) {
		//System.out.println(cm);
		
		// 새로 넘어온 파일이 있을 경우
		if(!reUpfile.getOriginalFilename().equals("")) {
			// 1_1. 새로 넘어온 파일이 있는데 기존의 첨부파일이 있었을 경우 => 서버에 업로드 되어있는 기존 파일 찾아서 삭제
			if(cm.getCmImage()!=null) {
				new File(session.getServletContext().getRealPath(cm.getCmImage())).delete();
			}
			
			// 1_2. 기존 첨부파일이 있든 없든 새로 넘어온 첨부파일 서버에 업로드
			String changeName = saveFile(session, reUpfile);
			cm.setCmImage("resources/community_uploadFiles/" + changeName);
		}
		
		// 2. Community 객체에 담긴 정보를 가지고 update요청
		//System.out.println(cm);
		int result = cService.updateCommunity(cm);
		//System.out.println(result);
		if(result > 0) {
			session.setAttribute("alertMsg", "커뮤니티 글이 수정되었습니다.");
			return "redirect:detail.cm?cmNo=" + cm.getCmNo();
		}else { // 게시글 수정 실패
			return "common/errorPage";
		}
	}
	
	/**
	 * 커뮤니티 게시글 삭제
	 * @param cmNo
	 * @param filePath
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("delete.cm")
	public String communityDelete(int cmNo, String filePath, HttpSession session, Model model) {
		// 1_1. DB에서 해당 게시글 상태 N으로 변경
		int result = cService.deleteCommunity(cmNo);
		
		if(result > 0) { // 삭제 성공
			if(!filePath.equals("")) { // 첨부파일(대표이미지)가 있었을 경우 => 서버에 업로드된 첨부파일 삭제 
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			session.setAttribute("alertMsg", "커뮤니티 글이 삭제되었습니다.");
			return "redirect:list.cm";
			
		}else { // 삭제 실패
			return "common/errorPage";
		}
	}
	
	/**
	 * ajax : 커뮤니티 댓글 리스트 조회
	 * @param cmNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="rlist.cm", produces="application/json; charset=utf-8")
	public String ajaxSelectCmCommentList(int cmNo) {
		// ajax로 요청했기떄문에 포워딩 X
		// 요청했던 곳으로 응답데이터만 돌려주면 된다
		// json형태로 바꿔서 응답(Gson 라이브러리 등록)
		//System.out.println("요청되나?");
		ArrayList<CommunityComment> list = cService.selectCmCommentList(cmNo);
		//System.out.println(list);
		return new Gson().toJson(list);
		//return new Gson().toJson(cService.selectCmCommentList(cmNo));
		
	}
	
	/**
	 * ajax : 커뮤니티 댓글 등록
	 * @param r
	 * @return
	 */
	@ResponseBody
	@RequestMapping("rinsert.cm")
	public String ajaxInsertComment(CommunityComment r) {
		// 이 메소드 요청 시 전달되는 데이터 Comment로 받고자 한다면
		// ajax에서도 해당 vo 클래스의 필드명과 일치하는 키값으로 전달해주면 알아서 담긴다!
		int result = cService.insertComment(r);
		
		if(result > 0) { // 댓글 등록 성공
			return "success";
		}else { // 댓글 등록 실패
			return "fail";
		}
	}
	
	/**
	 * ajax : 커뮤니티 댓글 삭제
	 * @param cmCommentNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("rdelete.cm")
	public String ajaxDeleteComment(int cmCommentNo) {
		
		// 1_삭제하려는 댓글을 참조하고 있는 대댓글이 있는지 확인 (내용->삭제된 댓글입니다 로 update)
		int count = cService.checkReComment(cmCommentNo);
		
		int result = 0;
		if(count > 0) { // 대댓글이 달려있는 경우 => 내용->삭제된 댓글입니다 로 업데이트 OR 삭제 방지
			//result = cService.deleteRefComment(cmCommentNo);
			return "hasComment";
		}else { // 대댓글이 달려있지 않은 경우 => status -> N 으로 update
			result = cService.deleteComment(cmCommentNo);
		}
		
		if(result > 0) { // 댓글 삭제 성공
			return "success";
		}else { // 댓글 삭제 실패
			return "fail";
		}
	}
	
	@ResponseBody
	@RequestMapping("rupdate.cm")
	public String ajaxUpdateComment(CommunityComment r) {
		int result = cService.updateComment(r);
		if(result > 0) { // 댓글 수정 성공
			return "success";
		}else { // 댓글 수정 실패
			return "fail";
		}
	}
	
	
	
}
