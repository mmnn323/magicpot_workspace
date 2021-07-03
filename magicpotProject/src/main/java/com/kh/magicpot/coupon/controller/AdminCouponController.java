package com.kh.magicpot.coupon.controller;


import java.util.ArrayList;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.magicpot.coupon.model.service.AdminCouponService;
import com.kh.magicpot.coupon.model.vo.Coupon;

@Controller
public class AdminCouponController {
	
	
	@Autowired
	private AdminCouponService cService;
	
	
	@RequestMapping("coupon.me")
	public String couponView() {

		return "coupon/adminCoupon";
	}
	
	@RequestMapping("adminInsert.me")
	public String adminCoupon(Coupon c, HttpSession session, Model model) {
		
		int result = cService.insertCoupon(c);
			System.out.println(c);

		if(result > 0) {
			return "redirect:/";
		}else { 
			return "common/errorPage";
		}
			
	}

	
	@RequestMapping("adminCoupon.me")
	public ModelAndView selectCoupon(ModelAndView mv) {
		
		ArrayList<Coupon> list = cService.selectCoupon();
		
		mv.addObject("list", list)
		  .setViewName("coupon/adminCoupon");
		
		return mv;
		
	}
	
}
	

