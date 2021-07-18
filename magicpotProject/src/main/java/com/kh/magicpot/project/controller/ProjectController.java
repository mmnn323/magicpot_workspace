package com.kh.magicpot.project.controller;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.common.template.Pagination;
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
      
      //서포터
      //int result = pService.selectSupporter(proNo);
      //System.out.println(result);
      
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
//      System.out.println(creator);
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
//      System.out.println(ranNo);
//      System.out.println(creNo);

      HashMap<String, Integer> map = new HashMap<String, Integer>();
      
      // 중복 검사 -> ranNo을 DB에 저장하기 전에 DB와 비교하여 중복 체크
      int ranCheck = pService.selectRanNo(ranNo);
//      System.out.println(ranCheck);
      
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
//         System.out.println(project);
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
      // 리워드 조회
      ArrayList<ProjectReward> proReward = pService.selectReward2(pno);
      if(proReward != null) {
         model.addAttribute("proReward", proReward);
      }
      
//      System.out.println(pno);
      Project project = pService.selectProject2(pno);

      if(project != null) {
         session.setAttribute("project", project);
         session.setAttribute("pno", pno);
         
//         System.out.println(project);
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
//      System.out.println(proRequire);
      
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
   public String rewardEnroll(HttpSession session, Model model) {
      // 리워드 조회해오기
      int pno = (Integer)session.getAttribute("pno");
      ArrayList<ProjectReward> projectReward = pService.selectReward2(pno);
//      System.out.println(projectReward);
      if(projectReward != null) {
         model.addAttribute("projectReward", projectReward);
      }
      return "project/rewardEnrollForm";
   }
   
   // 기본 요건 insert
   @RequestMapping("insertRequire.pro")
   public String insertRequire(HttpSession session, ProRequire proRequire) {
      int pno = (Integer)session.getAttribute("pno");
      int result = pService.insertRequire(proRequire);
      
      if(result > 0) {
         return "redirect:fundingHome2.pro?pno=" + pno;
      }else {
         return "common/errorPage";
      }
   }
   
   // 기본 요건 update
   @RequestMapping("updateRequire.pro")
   public String updateRequire(HttpSession session, ProRequire proRequire) {
      int pno = (Integer)session.getAttribute("pno");
      int result = pService.updateRequire(proRequire);
      
      if(result > 0) {
         return "redirect:fundingHome2.pro?pno=" + pno;
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

   
   // 휘경씨 최고
   // 첨부파일 수정명
   public String saveFile(HttpSession session, MultipartFile upfile) {
      String savePath = session.getServletContext().getRealPath("/resources/project_uploadFiles/"); // 경로
      String originName = upfile.getOriginalFilename(); // 원본명
      String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // 수정명
      int ranNum = (int)(Math.random() * 90000 + 10000); // 수정명
      String ext = originName.substring(originName.lastIndexOf(".")); // 수정명
      String changeName = "MagigPot_" + currentTime + ranNum + ext; // 수정명
      try {
         upfile.transferTo(new File(savePath + changeName)); // 수정명
         //System.out.println(savePath + changeName);
      } catch (IllegalStateException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }
      return changeName;
   }
   
   // 기본정보 등록(+대표이미지)
   @RequestMapping("updateBasic.pro")
   public String updateBasic(Project p, MultipartFile upfile, HttpSession session) {
//      System.out.println(p);// 잘 넘어옴
//      System.out.println(upfile.getOriginalFilename());// 잘 넘어옴
      int pno = (Integer)session.getAttribute("pno");
      p.setProNo(pno); // 가져온 project에 proNo 추가
      
      // 전달된 파일이 있을 경우(upfile의 원본명이 빈 문자열이 아닌 경우)
      if(!upfile.getOriginalFilename().equals("")) {
         String changeName = saveFile(session, upfile);
         p.setProImage("resources/project_uploadFiles/" + changeName); // 경로담기
      }
      
      //System.out.println(cm); //cmImage 잘 담김
      
      int result = pService.updateBasic(p);
      
      if(result > 0) { // 게시글 등록 성공
         return "redirect:fundingHome2.pro?pno=" + pno;
      }else {
         return "common/errorPage";
      }
   }
   
   // 기본 정보 등록 (써머노트 사진 경로 변경 및 첨부파일 수정명 반환)
   @RequestMapping(value="/uploadSummernoteImageFile2", produces = "application/json; charset=utf8")
   @ResponseBody
   public String uploadSummernoteImageFile2(@RequestParam("file") MultipartFile multipartFile, HttpSession session)  {
      
      JsonObject jsonObject = new JsonObject();

      String savedFileName = saveFile(session, multipartFile);
      jsonObject.addProperty("url", "resources/project_uploadFiles/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
      
      String a = jsonObject.toString();
      return a;
   }
   
   // 광고 심의 동의 여부 update
   @RequestMapping("agreeCheck.pro")
   public String agreeCheck(HttpSession session, Model model) {
      int pno = (Integer)session.getAttribute("pno");
      
      int result =  pService.updateProAd(pno);
      if(result > 0) {
         // project 다시 조회해서 담기
         Project project = pService.selectProject2(pno);
         if(project != null) {
            session.setAttribute("project", project);
         }else {
            return "common/errorPage";
         }
         
         return "redirect:storyEnroll.pro";
      }else {
         return "common/errorPage";
      }
   }
   
   // 스토리 등록
   @RequestMapping("updateStory.pro")
   public String updateStory(Project p, HttpSession session) {
      int pno = (Integer)session.getAttribute("pno");
      p.setProNo(pno); // 가져온 project에 proNo 추가
      
      int result = pService.updateStory(p);
      
      if(result > 0) { // 게시글 등록 성공
         return "redirect:fundingHome2.pro?pno=" + pno;
      }else {
         return "common/errorPage";
      }
   }
   
   // 리워드 등록
   @RequestMapping("insertReward.pro")
   public String insertReward(HttpSession session, ProjectReward proReward) {
      int pno = (Integer)session.getAttribute("pno");
      proReward.setProNo(pno);
      proReward.setDeliveryStart(proReward.getDeliveryStartDate1() + ' ' + proReward.getDeliveryStartDate2());

      int result = pService.insertReward(proReward);
      if(result > 0) {
         return "redirect:rewardEnroll.pro";
      }else {
         return "common/errorPage";
      }
   }
   
   // 리워드 수정
   @RequestMapping("updateReward.pro")
   public String updateReward(ProjectReward proReward) {
      proReward.setDeliveryStart(proReward.getDeliveryStartDate1() + ' ' + proReward.getDeliveryStartDate2());
      int result = pService.updateReward(proReward);
      if(result > 0) {
         return "redirect:rewardEnroll.pro";
      }else {
         return "common/errorPage";
      }
   }
   
   // 리워드 삭제
   @RequestMapping("deleteReward.pro")
   public String deleteReward(int rno) {
      int result = pService.deleteReward(rno);
      if(result > 0) {
         return "redirect:rewardEnroll.pro";
      }else {
         return "common/errorPage";
      }
   }
   
   // 프로젝트 단계 변경
   @RequestMapping("updateStep.pro")
   public String updateStep(HttpSession session) {
      int pno = (Integer)session.getAttribute("pno");
      int result = pService.updateProStep2(pno);
      if(result > 0) {
         return "redirect:fundingHome2.pro?pno=" + pno;
      }else {
         return "common/errorPage";
      }
   }
   
   // 프로젝트 관리 조회
   @RequestMapping("fundingManage.ad")
   public ModelAndView fundingManage(@RequestParam(value="currentPage", defaultValue="1") int currentPage, ModelAndView mv) {
      int listCount = pService.selectListProCount(); 
      PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
      
      ArrayList<Project> list = pService.selectProjectList(pi);
      
      mv.addObject("pi", pi)
        .addObject("list", list)
        .setViewName("project/fundingManage");
      
      return mv;
   }
   
   // 프로젝트 관리 상세조회(기본 정보)
   @RequestMapping("fundingDetail.ad")
   public String fundingManage1(int pno, Model model) {
      model.addAttribute("pno", pno);
      Project pro = pService.selectFunManageBasic(pno);
      
      if(pro != null) {
         model.addAttribute("pro", pro);
         return "project/fundingManage1";
      }else {
         return "common/errorPage";
      }
   }
   
   // 프로젝트 관리 상세조회(기본 요건)
   @RequestMapping("fundingDetail2.ad")
   public String fundingManage2(int pno, Model model) {
      model.addAttribute("pno", pno);
      ProRequire require = pService.selectRequire(pno);
      
      if(require != null) {
         model.addAttribute("require", require);
         return "project/fundingManage2";
      }else {
         return "common/errorPage";
      }
   }
   
   // 프로젝트 관리 상세조회(스토리)
   @RequestMapping("fundingDetail3.ad")
   public String fundingManage3(int pno, Model model) {
      model.addAttribute("pno", pno);
      Project pro = pService.selectFunManageStroy(pno);
      
      int result = 0;
      String proStep = pService.selectProStep(pno);
      if(!proStep.equals("펀딩오픈")) { // 단계 검사
         result = pService.updateProStep3(pno);
      }
      
      if(pro != null) {
         model.addAttribute("pro", pro);
         return "project/fundingManage3";
      }else {
         return "common/errorPage";
      }
   }
   
   // 프로젝트 관리 상세 조회(리워드)
   @RequestMapping("fundingDetail4.ad")
   public String fundingManage4(int pno, Model model) {
      model.addAttribute("pno", pno);
      ArrayList<ProjectReward> reward = pService.selectReward2(pno);
      String proStep = pService.selectProStep(pno);
      System.out.println(proStep);
      if(reward != null) {
         model.addAttribute("reward", reward);
         return "project/fundingManage4";
      }else {
         return "common/errorPage";
      }
   }
   
   // 프로젝트 승인
   @RequestMapping("funApproval")
   public String funApproval(int pno) {
      int result = pService.updateProStep4(pno);
      if(result > 0) {
         return "redirect:fundingManage.ad";
      }else {
         return "common/errorPage";
      }
   }
   
   // 프로젝트 미승인
   @RequestMapping("funCancel")
   public String funCancel(int pno) {
      int result = pService.updateProCancel(pno);
      if(result > 0) {
         return "redirect:fundingManage.ad";
      }else {
         return "common/errorPage";
      }
   }
   
   // 프로젝트 관리 검색 조회 -> 수정 필요
   @RequestMapping("searchFun.ad")
   public ModelAndView searchFun(@RequestParam(value="currentPage", defaultValue="1") int currentPage, String searchCtg, String keyWord, Model model, ModelAndView mv) {
      int listCount = pService.selectListProCount(); 
      PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
      
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("searchCtg", searchCtg);
      map.put("keyWord", keyWord);
      model.addAttribute("searchCtg", searchCtg);
      model.addAttribute("keyWord", keyWord);
      ArrayList<Project> searchList = pService.selectSearchList(pi, map);
      
      mv.addObject("pi", pi)
        .addObject("list", searchList)
        .setViewName("project/fundingManage");
      
      return mv;
   }
   
   // 펀딩 현황 조회
   @RequestMapping("fundingStatus.pro")
   public String fundingStatus(int pno) {
      return "project/fundingStatus";
   }
   
   // 프로젝트 바로 오픈
   @RequestMapping("updateOpenDateDir")
   public String updateOpenDateDir(int pno) {
      int result = pService.updateOpenDateDir(pno);
      if(result > 0) {
         return "redirect:fundingStatus.pro?pno=" + pno;
      }else {
         return "common/errorPage";
      }
   }
   
   // 프로젝트 오픈 예약
   @RequestMapping("updateOpenDateRes")
   public String updateOpenDateRes(int pno, java.sql.Date openDate) {
      Project pro = new Project();
      pro.setProNo(pno);
      pro.setOpenDate(openDate);
      
      int result = pService.updateOpenDateRes(pro);
      if(result > 0) {
         return "redirect:fundingStatus.pro?pno=" + pno;
      }else {
         return "common/errorPage";
      }
   }
}