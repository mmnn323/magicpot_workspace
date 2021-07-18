package com.kh.magicpot.pay.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.magicpot.address.service.AddressService;
import com.kh.magicpot.address.service.AddressServiceImpl;
import com.kh.magicpot.address.vo.AddressList;
import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.common.template.Pagination;
import com.kh.magicpot.member.model.vo.Member;
import com.kh.magicpot.pay.model.service.PayService;
import com.kh.magicpot.pay.model.vo.ConcludePay;
import com.kh.magicpot.pay.model.vo.DetailPay;
import com.kh.magicpot.pay.model.vo.FundingDetail;
import com.kh.magicpot.pay.model.vo.FundingList;
import com.kh.magicpot.pay.model.vo.Pay;
import com.kh.magicpot.project.model.vo.Creator;
import com.kh.magicpot.project.model.vo.Project;
import com.kh.magicpot.project.model.vo.ProjectReward;


@Controller
public class payController {
	
	@Autowired
	private PayService aService;

	 
	@RequestMapping("adminPay.me")
	public ModelAndView selectAdminPayList(HttpSession session, @RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
			
		
		//페이징 처리 
		int listCount = aService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		
		ArrayList<Pay> list = aService.selectList(pi);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("pay/adminPay");
		
		return mv;
	}
	
	@RequestMapping("detail.pay")
	public String PaySelect(int ano, Model model) {
		
		DetailPay a = aService.selectDetailPay(ano);
		
		return "pay/adminDetailPay";
		
	}
	
	
	// 사용자 결제
	@RequestMapping("pay.me")
	public String OrderPay(int rno, Model model, HttpSession session) {
		
		ProjectReward r = (ProjectReward)session.getAttribute("rno");
		model.addAttribute("r", r);
		
		ArrayList<FundingList> list = aService.orderList(rno);
		model.addAttribute("list", list);
		System.out.println(list);
		
		return "pay/pay";
	}
	
	

	
	//주문목록
	@RequestMapping("fundingList.me")
	public String selectDetail(int mno, Model model) {

		//Member loginUser = (Member)session.getAttribute("loginUser");
		//int memNo = loginUser.getMemNo();
		ArrayList<FundingDetail> list = aService.selectDetail(mno);
		
		System.out.println(mno);
		System.out.println(list);
		
		model.addAttribute("list",list)
		     .addAttribute("mno", mno);
		
		return "pay/fundingList";
	
		}
	
	@RequestMapping("fundingDetail.me")
	public String selectDetail(int proNo) {
		System.out.println(proNo);
		
		return "pay/fundingDetailList";
	}
	

	@Autowired
	AddressService addressService;
	
	
	@RequestMapping("conclude.me")
	public String concludePay(ConcludePay concludePay, Model model, HttpSession session) {
		System.out.println("vakye : " + concludePay.getAdDetail());
		AddressList a = new AddressList();
		a.setAdName(adName);
		addressService.newAddress(a);
		return "pay/payConclude";
 	}
}
