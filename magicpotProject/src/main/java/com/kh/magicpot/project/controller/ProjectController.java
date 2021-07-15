package com.kh.magicpot.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.Random;

import javax.mail.internet.MimeMessage;
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
import com.kh.magicpot.like.model.vo.Like;
import com.kh.magicpot.member.model.service.MemberService;
import com.kh.magicpot.member.model.vo.Member;
import com.kh.magicpot.project.model.service.ProjectService;
import com.kh.magicpot.project.model.vo.Creator;
import com.kh.magicpot.project.model.vo.ProRequire;
import com.kh.magicpot.project.model.vo.Project;
import com.kh.magicpot.project.model.vo.ProjectReward;

@Controller
public class ProjectController {
	
	@Autowired
	private ProjectService pService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService mService;
	
	/* 펀딩상세페이지 */
	@RequestMapping("detail.fd")
	public String selectFundingDetail(int proNo, Model model, HttpSession session, Like l) {

		Project p = pService.selectFundingDetail(proNo);
		model.addAttribute("p", p);
		//System.out.println(proNo);
		
		Project s = pService.selectSupporter(proNo);
		model.addAttribute("s", s);
		System.out.println(s);

		//리워드
		ArrayList<Project> list = pService.selectReward(proNo);
		model.addAttribute("list", list);
		//System.out.println(list);
		
		// 남은 일 계산		
		int d = 0;
			
			Date date1= p.getCloseDate();
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
				
			d = (int)calDateDays;
			
			model.addAttribute("d", d);
			//System.out.println(d);
			
			// [휘경] 해당 프로젝트 좋아요 여부 (로그인한 회원이 좋아요한 프로젝트일 경우 펀딩 상세페이지 빨간 하트로 표시)
			Member loginUser = (Member)session.getAttribute("loginUser");
			if(loginUser != null) {
				int memNo = loginUser.getMemNo();
				l.setMemNo(memNo);
				l.setProNo(proNo);
				int isChecked = pService.isChecked(l);
				model.addAttribute("isChecked", isChecked);
			}else {
				model.addAttribute("inChecked", 0);
			}
			
			// [휘경] 해당 프로젝트 좋아요 수
			int countLike = pService.countLike(proNo);
			model.addAttribute("countLike", countLike);

		return "project/fundingDetail";
	}

	/* 상세페이지 - 스토리 */
	@ResponseBody
	@RequestMapping(value="story.fd", produces="application/json; charset=utf-8")
	public String storyAjax(int proNo) {
		Project p = pService.authorAjax(proNo);
		//System.out.println(p);
		
		return new Gson().toJson(p);
	}
	
	/* 상세페이지 - 작가의말 */
	@ResponseBody
	@RequestMapping(value="author.fd", produces="application/json; charset=utf-8")
	public String authorAjax(int proNo) {
		Project p = pService.authorAjax(proNo);
		//System.out.println(p);
		
		return new Gson().toJson(p);
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
		
		// 남은 일 계산		
		int[] arr = new int[list4.size()];
			
		for(int i=0; i<list4.size(); i++) {
			Date date1=list4.get(i).getCloseDate();
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
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pr", list4);
		map.put("arr", arr);
		return new Gson().toJson(map);
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
		int result = pService.insertCreator(creator);
		
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
	
	// 프로젝트 단계별 안내 조회
	// level1 진입과 동시에 project 기본 생성
	@RequestMapping("insert.pro")
	public String insertPro(HttpSession session) {
		Creator creator = (Creator)session.getAttribute("creator");
		int creNo = creator.getCreNo();
		int ranNo = (int)Math.floor(Math.random( ) * (10000 - 1) + 1);
//		System.out.println(ranNo);
//		System.out.println(creNo);

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		
		// 중복 검사 -> ranNo을 DB에 저장하기 전에 DB와 비교하여 중복 체크
		int ranCheck = pService.selectRanNo(ranNo);
//		System.out.println(ranCheck);
		
		if(ranCheck > 0) { // 중복된 경우 -> 다시 random값 받기
			ranNo = (int)Math.floor(Math.random( ) * (10000 - 1) + 1);
		}else { // 중복 아닌 경우 -> map에 값 넣기
			map.put("creNo", creNo);
			map.put("ranNo", ranNo);
		}

		int result = pService.insertProject(map);
		
		if(result > 0) {
			session.setAttribute("ranNo", ranNo);
			return "project/level1";
		}else {
			return "common/errorPage";
		}
			
	}

	// pno로 가져온 경우 ranNo조회해서 담음
	@RequestMapping("level1.pro")
	public String level1(HttpSession session, int pno) {
		int ranNo = pService.selectRanNo2(pno);
		
		if(ranNo > 0) {
			session.setAttribute("ranNo", ranNo);
		}
		
		return "project/level1";
	}
	
	@RequestMapping("level2.pro")
	public String level2() {
		return "project/level2";
	}
	
	@RequestMapping("level3.pro")
	public String level3() {
		return "project/level3";
	}
	
	@RequestMapping("level4.pro")
	public String level4() {
		return "project/level4";
	}
	
	// 생성 단계에서 이어서 들어온 경우  -> session에 저장된 ranNo이용
	@RequestMapping("fundingHome1.pro")
	public String fundingHome1(HttpSession session) {
		int ranNo = (Integer)session.getAttribute("ranNo");
				
		int result = pService.updateProStep1(ranNo);
		Project project = pService.selectProject1(ranNo);
		int pno = project.getProNo();
		
		if(project != null && result > 0 ) {
			session.setAttribute("project", project);
			session.setAttribute("pno", pno);
//			System.out.println(project);
			return "project/fundingHome";
		}else {
			return "common/errorPage";
		}
	}
	
	// 생성 단계 아닌 proNo을 받아서 들어온 경우 proNo으로 project조회해서 session에 담기
	@RequestMapping("fundingHome2.pro")
	public String fundingHome2(HttpSession session, Model model, int pno) {
		// 기본 요건 조회
		ProRequire proRequire = pService.selectRequire(pno);
		if(proRequire != null) {
			model.addAttribute(proRequire);
		}
		
//		System.out.println(pno);
		Project project = pService.selectProject2(pno);

		if(project != null) {
			session.setAttribute("project", project);
			session.setAttribute("pno", pno);
			
			System.out.println(project);
			return "project/fundingHome";
		}else {
			return "common/errorPage";
		}
	}
	
	// 기본 요건 불러오기
	@RequestMapping("requireEnroll.pro")
	public String requireEnroll(HttpSession session, Model model) {
		// 기본 요건 값 있는지 확인 필요
		int pno = (Integer)session.getAttribute("pno");
		
		ProRequire proRequire = pService.selectRequire(pno);
//		System.out.println(proRequire);
		
		if(proRequire != null) {
			model.addAttribute(proRequire);
		}
		
		return "project/requireEnrollForm";
	}
	
	// 기본 정보 불러오기
	@RequestMapping("basicEnroll.pro")
	public String basicEnroll() {
		return "project/basicEnrollForm";
	}
	
	// 스토리 작성 불러오기
	@RequestMapping("storyEnroll.pro")
	public String storyEnroll() {
		return "project/storyEnrollForm";
	}
	
	// 리워드 작성 불러오기
	@RequestMapping("rewardEnroll.pro")
	public String rewardEnroll() {
		return "project/rewardEnrollForm";
	}	
	
	// 기본 요건 insert
	@RequestMapping("insertRequire.pro")
	public String insertRequire(HttpSession session, ProRequire proRequire) {
		int result = pService.insertRequire(proRequire);
		
		if(result > 0) {
			return "project/fundingHome";
		}else {
			return "common/errorPage";
		}
	}
	
	@RequestMapping("updateRequire.pro")
	public String updateRequire(HttpSession session, ProRequire proRequire) {
		int result = pService.updateRequire(proRequire);
		
		if(result > 0) {
			return "project/fundingHome";
		}else {
			return "common/errorPage";
		}
	}
	
	/**
	 * [휘경] ajax : 프로젝트 좋아요 취소
	 * @param l
	 * @return
	 */
	@ResponseBody
	@RequestMapping("deleteLike2.pr")
	public String ajaxDeleteLike(Like l) {
		
		int result = pService.deleteLike(l);
		
		if(result > 0) { // 좋아요 삭제 성공
			return "success";
		}else { // 좋아요 삭제 실패
			return "fail";
		}
	}
	
	/**
	 * [휘경] ajax : 프로젝트 좋아요 추가
	 * @param l
	 * @return
	 */
	@ResponseBody
	@RequestMapping("insertLike.pr")
	public String ajaxInsertLike(Like l) {
		
		int result = pService.insertLike(l);
		
		if(result > 0) { // 좋아요 추가 성공
			return "success";
		}else { // 좋아요 추가 실패
			return "fail";
		}
	}
	
	/**
	 * [휘경] ajax : 프로젝트 좋아요 카운트 조회
	 * @param proNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="countLike.pr", produces="application/json; charset=utf-8")
	public String ajaxCountLike(int proNo) {
		int result = pService.countLike(proNo);
		System.out.println(result);
		return new Gson().toJson(result);
	}
	
}
