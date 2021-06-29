package com.kh.magicpot.project.controller;

import java.util.ArrayList;

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
	
	@RequestMapping("story.fd")
	public String fundingDetailStory() {
		
		return "project/fundingDetail";
	}
	
	@ResponseBody
	@RequestMapping(value="rankAjax.pj", produces="application/json; charset=utf-8")
	public String AjaxMethod1() {
		ArrayList<Project> list = pService.rankList();
		

		
		
		return new Gson().toJson(list);
	}
	
	
}
