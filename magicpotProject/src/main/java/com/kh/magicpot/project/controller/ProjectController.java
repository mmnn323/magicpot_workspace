package com.kh.magicpot.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.magicpot.member.model.service.MemberService;
import com.kh.magicpot.project.model.service.ProjectService;
import com.kh.magicpot.project.model.vo.Creator;
import com.kh.magicpot.project.model.vo.Project;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService pService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping("detail.fd")
	public String fundingDetail() {
		
		return "project/fundingDetail";
	}
	
	@RequestMapping("story.fd")
	public String fundingDetailStory() {
		
		return "project/fundingDetail";
	}
	
	
	// 실시간 랭킹
	@ResponseBody
	@RequestMapping(value="rankAjax.pj", produces="application/json; charset=utf-8")
	public String AjaxMethod1() {
		ArrayList<Project> list = pService.rankList();

		return new Gson().toJson(list);
	}
	
	// 추천 프로젝트
	
	@ResponseBody
	@RequestMapping(value="reAjax.pj", produces="application/json; charset=utf-8")
	public String AjaxMethod2() {
		
		
		ArrayList<Project> list2 = pService.reList();
		
		Collections.shuffle(list2);
		
		return new Gson().toJson(list2);
	}
	
	
	// 메인 슬라이드
	
	@ResponseBody
	@RequestMapping(value="slideAjax.pj", produces="application/json; charset=utf-8")
	public String AjaxMethod3() {
		
		ArrayList<Project> list3 = pService.slide();
		
		return new Gson().toJson(list3);
	}
	
	// 신규 프로젝트
	@ResponseBody
	@RequestMapping(value="newAjax.pj", produces="application/json; charset=utf-8")
	public String AjaxMethod4() {
		ArrayList<Project> list4 = pService.newList();

		return new Gson().toJson(list4);
	}
	

	// 크리에이터 인증 이메일  (출처 : 길상씨. 최고)
	@ResponseBody
	@RequestMapping(value="mailCheck2", produces="application/json; charset=utf-8")
    public String mailCheckGET(String email) throws Exception{
        
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		String setFrom = "cloudmoney1112@gmail.com";
        String toMail = email;
        String title = "크리에이터 인증 이메일 입니다.";
        String content = 
                "크리에이터 등록을 해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
       
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        String num = Integer.toString(checkNum);     
                
        return num;
    }		
	
	// 크리에이터 등록페이지
	@RequestMapping("enrollPage.cre")
	public String creatorEnrollForm() {
		return "project/creatorEnrollForm";
	}
	
	// 크리에이터 등록
	@RequestMapping("insert.cre")
	public String insertCreator(Creator creator, HttpSession session) {
//		System.out.println(creator);
		int result = pService.insertCre(creator);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "크리에이터 신청이 완료되었습니다.");
			return "redirect:/";
		}else {
			return "common/errorPage";
		}
		
	}
	
	// 펀딩리스트 페이지
	@RequestMapping("fund.li")
	public String fundingList(@RequestParam(value="ctg", defaultValue="0") int ctg,
							  @RequestParam(value="ctg2",defaultValue="0") int ctg2,
							  
											HttpSession session, Model model
											) {
		
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ctg", ctg);
		map.put("ctg2", ctg2);
		
		
		ArrayList<Project> pr = pService.reList2(map);
		
		
		
		// 남은 일 계산		
		int[] arr = new int[pr.size()];
			
		for(int i=0; i<pr.size(); i++) {
			Date date1=pr.get(i).getCloseDate();
			Date date2 = new Date(System.currentTimeMillis());
			 
			long calDateDays = 0;
			SimpleDateFormat format = new SimpleDateFormat("yyyy/mm/dd");
			Date FirstDate = date1;
			Date SecondDate = date2;
				
			long calDate = SecondDate.getTime()-FirstDate.getTime(); 
				
			// Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환 
			// 24*60*60*1000을 나눠주면 일수 나옴
			calDateDays = calDate / ( 24*60*60*1000); 
	 
			calDateDays = Math.abs(calDateDays);
				
			arr[i] = (int)calDateDays;
				
		}
		
	
		
		model.addAttribute("pr", pr);
		model.addAttribute("arr", arr);
		model.addAttribute("ctg", ctg);
		model.addAttribute("ctg2", ctg2);
		
		
		String ccc = "";
		if(ctg2 == 0) {
			ccc = "인기순";
		}else if(ctg2 == 1) {
			ccc = "마감순";
		}else {
			ccc = "최신순";
		}
		model.addAttribute("ccc", ccc);
		return "project/fundingList";
	}
	
	// 펀딩하기에서 검색
	@RequestMapping("search.pr")
	public String fundingList(@RequestParam(value="ctg", defaultValue="0") int ctg,
							  @RequestParam(value="ctg2", defaultValue="0") int ctg2,
							  String condition,
							  String keyword,
							  HttpSession session, Model model) {
		
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ctg", ctg);
		map.put("ctg2", ctg2);
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		ArrayList<Project> pr = pService.searchList(map);
		
		
		
		
		// 남은 일 계산		
		int[] arr = new int[pr.size()];
			
		for(int i=0; i<pr.size(); i++) {
			Date date1=pr.get(i).getCloseDate();
			Date date2 = new Date(System.currentTimeMillis());
			 
			long calDateDays = 0;
			SimpleDateFormat format = new SimpleDateFormat("yyyy/mm/dd");
			Date FirstDate = date1;
			Date SecondDate = date2;
				
			long calDate = SecondDate.getTime()-FirstDate.getTime(); 
				
			// Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환 
			// 24*60*60*1000을 나눠주면 일수 나옴
			calDateDays = calDate / ( 24*60*60*1000); 
	 
			calDateDays = Math.abs(calDateDays);
				
			arr[i] = (int)calDateDays;
				
		}
		
		String ccc = "";
		if(ctg2 == 0) {
			ccc = "인기순";
		}else if(ctg2 == 1) {
			ccc = "마감순";
		}else {
			ccc = "최신순";
		}
		model.addAttribute("ccc", ccc);
		model.addAttribute("pr", pr);
		model.addAttribute("arr", arr);
		model.addAttribute("ctg", ctg);
		model.addAttribute("ctg2", ctg2);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);

		
		return "project/fundingList";
	}
	
	// 메뉴바에서 검색
	@RequestMapping("search2.pr")
	public String searchList2(@RequestParam(value="ctg", defaultValue="0") int ctg,
							  @RequestParam(value="ctg2", defaultValue="0") int ctg2,
							  String keyword,
							  HttpSession session, Model model) {
		
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ctg", ctg);
		map.put("ctg2", ctg2);
		map.put("keyword", keyword);
		
		
		ArrayList<Project> pr = pService.searchList2(map);
		
		
		// 남은 일 계산		
		int[] arr = new int[pr.size()];
			
		for(int i=0; i<pr.size(); i++) {
			Date date1=pr.get(i).getCloseDate();
			Date date2 = new Date(System.currentTimeMillis());
			 
			long calDateDays = 0;
			SimpleDateFormat format = new SimpleDateFormat("yyyy/mm/dd");
			Date FirstDate = date1;
			Date SecondDate = date2;
				
			long calDate = SecondDate.getTime()-FirstDate.getTime(); 
				
			// Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환 
			// 24*60*60*1000을 나눠주면 일수 나옴
			calDateDays = calDate / ( 24*60*60*1000); 
	 
			calDateDays = Math.abs(calDateDays);
				
			arr[i] = (int)calDateDays;
				
		}
		
		
		
		String ccc = "";
		if(ctg2 == 0) {
			ccc = "인기순";
		}else if(ctg2 == 1) {
			ccc = "마감순";
		}else {
			ccc = "최신순";
		}
		model.addAttribute("ccc", ccc);
		model.addAttribute("pr", pr);
		model.addAttribute("arr", arr);
		model.addAttribute("ctg", ctg);
		model.addAttribute("ctg2", ctg2);
		model.addAttribute("keyword", keyword);

		
		return "project/searchFunding";
	}
	
	
}
