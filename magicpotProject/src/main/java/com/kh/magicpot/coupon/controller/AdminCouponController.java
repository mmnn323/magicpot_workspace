package com.kh.magicpot.coupon.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.magicpot.coupon.model.service.AdminCouponService;
import com.kh.magicpot.coupon.model.vo.Coupon;

@Controller
public class AdminCouponController {
	
	
	@Autowired
	private AdminCouponService cService;
	
	@RequestMapping("coupon.me")
	public String couponInsert() {

		return "coupon/adminCoupon";
	}

	
	@RequestMapping("adminCoupon.me")
	public String adminCoupon(Coupon c, HttpSession session, Model model) {
		
		int result = cService.insertCoupon(c);

		if(result > 0) {
			return "redirect:/";
		}else { 
			return "common/errorPage";
		}
		
	}

}
	

