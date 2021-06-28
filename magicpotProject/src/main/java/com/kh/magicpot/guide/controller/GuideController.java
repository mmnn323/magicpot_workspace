package com.kh.magicpot.guide.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.magicpot.guide.model.service.GuideService;

@Controller
public class GuideController {
	
	@Autowired
	private GuideService gService;

	
}
