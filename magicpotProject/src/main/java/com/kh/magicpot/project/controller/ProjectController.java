package com.kh.magicpot.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProjectController {
	
	@RequestMapping("story.fd")
	public String fundingDetailStory() {
		
		return "project/fundingDetail";
	}
	
}
