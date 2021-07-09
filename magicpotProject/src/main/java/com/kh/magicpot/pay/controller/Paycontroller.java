package com.kh.magicpot.pay.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
public class Paycontroller {
	
	@RequestMapping("pay.me")
	public String myPage() {
		return "pay/pay";
	}
}
