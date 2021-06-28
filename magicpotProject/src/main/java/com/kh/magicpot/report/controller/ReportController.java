package com.kh.magicpot.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.kh.magicpot.report.model.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	private ReportService rService;

}
