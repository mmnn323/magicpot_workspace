package com.kh.magicpot.pay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class AdminPayController {
	
	
	@RequestMapping("adminPay.me")
	public String selectAdminPay() {
		
		
		
		return "pay/adminPay";
	}
	

}
