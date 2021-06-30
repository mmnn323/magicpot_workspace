package com.kh.magicpot.project.controller;

import java.util.ArrayList;
import java.util.Collections;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.magicpot.community.model.vo.CommunityFile;
import com.kh.magicpot.member.model.vo.Member;
import com.kh.magicpot.project.model.service.ProjectService;
import com.kh.magicpot.project.model.vo.Project;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService pService;
	
	@RequestMapping("detail.fd")
	public String fundingDetail() {
		
		return "project/fundingDetail";
	}
	
	@RequestMapping("story.fd")
	public String fundingDetailStory() {
		
		return "project/fundingDetail";
	}
	
	
	// 실시간 랭킹
	@ResponseBody
	@RequestMapping(value="rankAjax.pj", produces="application/json; charset=utf-8")
	public String AjaxMethod1() {
		ArrayList<Project> list = pService.rankList();

		return new Gson().toJson(list);
	}
	
	// 추천 프로젝트
	
	@ResponseBody
	@RequestMapping(value="reAjax.pj", produces="application/json; charset=utf-8")
	public String AjaxMethod2() {
		
		
		ArrayList<Project> list2 = pService.reList();
		
		Collections.shuffle(list2);
		
		return new Gson().toJson(list2);
	}
	
	
	// 메인 슬라이드
	
	@ResponseBody
	@RequestMapping(value="slideAjax.pj", produces="application/json; charset=utf-8")
	public String AjaxMethod3() {
		
		ArrayList<Project> list3 = pService.slide();
		
		return new Gson().toJson(list3);
	}
	
	
	
	
	
}
