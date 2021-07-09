package com.kh.magicpot.pay.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.common.template.Pagination;
import com.kh.magicpot.pay.model.service.AdminPayService;
import com.kh.magicpot.pay.model.vo.AdminPay;


@Controller
public class AdminPayController {
	
	@Autowired
	private AdminPayService aService;
	
	/*
	@RequestMapping("adminPay.me")
	public String selectAdminPayList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {
		
		int listCount = aService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<AdminPay> list = aService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "pay/adminPay";
	}
	*/
	
	@RequestMapping("adminPay.me")
	public ModelAndView selectAdminPayList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = aService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<AdminPay> list = aService.selectList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("pay/adminPay");
		
		return mv;
	}

}
