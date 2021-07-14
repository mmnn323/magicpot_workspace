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
import com.kh.magicpot.pay.model.service.PayService;
import com.kh.magicpot.pay.model.vo.Pay;


@Controller
public class PayController {
	
	@Autowired
	private PayService aService;

	
	@RequestMapping("adminPay.me")
	public ModelAndView selectAdminPayList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = aService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Pay> list = aService.selectList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("pay/adminPay");
		
		return mv;
	}
	
	@RequestMapping("detail.pay")
	public String paySelect(int ano, Model model) {
		
		ArrayList<Pay> a = aService.paySelect(ano);

		model.addAttribute("a", a);
		
		return "pay/adminDetailPay";
		
	}
	
	
	// 사용자 pay
	@RequestMapping("pay.me")
	public String myPage() {
		return "pay/pay";
	}

}
