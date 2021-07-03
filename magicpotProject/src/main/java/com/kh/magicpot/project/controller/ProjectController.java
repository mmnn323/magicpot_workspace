package com.kh.magicpot.project.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.magicpot.project.model.service.ProjectService;
import com.kh.magicpot.project.model.vo.Creator;
import com.kh.magicpot.project.model.vo.Project;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService pService;
	
	@Autowired
	private JavaMailSender mailSender;
	
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
	
	
	
	
	
}
