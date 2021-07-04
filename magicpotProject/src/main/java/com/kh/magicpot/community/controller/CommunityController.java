package com.kh.magicpot.community.controller;

import java.util.ArrayList;
import java.util.HashMap;

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
}
