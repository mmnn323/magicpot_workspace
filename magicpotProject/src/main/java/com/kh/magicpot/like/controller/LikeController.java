package com.kh.magicpot.like.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	
	@RequestMapping("like.pr")
	public String selectLikeList(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
		
		ArrayList<Like> like = lService.selectLikeList(memNo);
		
		// 남은 일 계산
		int[] arr = new int[like.size()];
		
		for(int i=0; i<like.size(); i++) {
			Date date1=like.get(i).getCloseDate();
			Date date2 = new Date(System.currentTimeMillis());
			 
			long calDateDays = 0;
			SimpleDateFormat format = new SimpleDateFormat("yyyy/mm/dd");
			Date FirstDate = date1;
			Date SecondDate = date2;
				
			long calDate = SecondDate.getTime()-FirstDate.getTime(); 
				
			// Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환 
			// 24*60*60*1000을 나눠주면 일수 나옴
			calDateDays = calDate / ( 24*60*60*1000); 
	 
			calDateDays = Math.abs(calDateDays);
				
			arr[i] = (int)calDateDays;
				
		}
		
		model.addAttribute("like", like);
		model.addAttribute("arr", arr);
		
		return "like/likeListView";
	}

}
