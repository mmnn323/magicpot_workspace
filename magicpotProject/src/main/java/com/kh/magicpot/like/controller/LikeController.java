package com.kh.magicpot.like.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.magicpot.community.model.vo.CommunityComment;
import com.kh.magicpot.like.model.service.LikeService;
import com.kh.magicpot.like.model.vo.Like;
import com.kh.magicpot.member.model.vo.Member;

@Controller
public class LikeController {
	
	/**
	 * 전역변수
	 */
	@Autowired
	private LikeService lService;
	
	/**
	 * 좋아하는 프로젝트 페이지 요청
	 * @return
	 */
	@RequestMapping("like.pr")
	public String MyPageLikeForm() {
		return "like/likeListView";
	}
	
	/**
	 * ajax : 좋아하는 프로젝트 리스트 요청
	 * @param memNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="likeList.cm", produces="application/json; charset=utf-8")
	public String ajaxSelectLikeList(int memNo) {
		// ajax로 요청했기떄문에 포워딩 X
		// 요청했던 곳으로 응답데이터만 돌려주면 된다
		// json형태로 바꿔서 응답(Gson 라이브러리 등록)
		//ArrayList<CommunityComment> list = cService.selectCmCommentList(cmNo);
		ArrayList<Like> list = lService.selectLikeList(memNo);
		//System.out.println(memNo);
		//System.out.println(list);
		return new Gson().toJson(list);
		//return new Gson().toJson(cService.selectCmCommentList(cmNo));
	}
	
	/**
	 * ajax : 좋아요 삭제
	 * @param l
	 * @return
	 */
	@ResponseBody
	@RequestMapping("deleteLike.pr")
	public String ajaxDeleteLike(Like l) {
		
		int result = lService.deleteLike(l);
		
		if(result > 0) { // 좋아요 삭제 성공
			return "success";
		}else { // 좋아요 삭제 실패
			return "fail";
		}
	}
	
	/**
	 * ajax : 좋아요 여부 확인
	 * @param l
	 * @return
	 */
	@ResponseBody
	@RequestMapping("isChecked.pr")
	public String ajaxIsChecked(Like l) {
		int result = lService.isChecked(l);
		if(result == 1) { // 로그인한 회원이 해당 상품을 좋아요한 상태
			return "Y";
		}else {
			return "N";
		}
	}
	
	
	

}
