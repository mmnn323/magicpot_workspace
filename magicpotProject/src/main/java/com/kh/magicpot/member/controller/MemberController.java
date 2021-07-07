package com.kh.magicpot.member.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.common.template.Pagination;
import com.kh.magicpot.member.model.service.MemberService;
import com.kh.magicpot.member.model.vo.Address;
import com.kh.magicpot.member.model.vo.Member;
import com.kh.magicpot.project.model.vo.Creator;
import com.kh.magicpot.project.model.vo.Project;




@Controller
public class MemberController {

	
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {

		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		
		Member loginUser = mService.loginMember(m);
		
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getMemPwd(), loginUser.getMemPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}else {
			mv.addObject("errorMsg", "로그인실패");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
	
}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("myPage.me")
	public String myPage() {
		return "common/myPage";
	}
	
	
	/*관리자메인(일반회원관리)*/
	@RequestMapping("admin.me")
	public String adminMemberList(@RequestParam(value="currentPage", defaultValue="1") int currentPage, Model model) {

		int listCount = mService.selectListCount(); // 현재 회원 총 수 
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Member> list = mService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "member/adminMember";
	}

	/* 일반회원 상세보기 */
	@RequestMapping("detail.me")
	public String selectAdminMember(int mno, Model model) {
				
		Member m = mService.selectAdminMember(mno);
		model.addAttribute("m", m);
		
		return "member/adminMemberDetail";
	}
	
	
	// 회원가입폼 페이지
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	

	// 회원가입 이메일 인증 ajax 
	
	@ResponseBody
	@RequestMapping(value="mailCheck", produces="application/json; charset=utf-8")
    public String mailCheckGET(String email) throws Exception{
        
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;
		
		String setFrom = "cloudmoney1112@gmail.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
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
	
	// 회원가입 아이디 중복체크 ajax
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String ajaxIdCheck(String checkId) {
		int count = mService.idCheck(checkId);
		
		
		return count>0 ? "N" : "Y";
	}
	
	// 회원가입
	@RequestMapping("insert.me")
	public String insertMember(Member m, HttpSession session, Model model) {
		
		
	
		
		// 암호화 작업
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		
		
		m.setMemPwd(encPwd); // 암호문으로  변경하기
		
		System.out.println(encPwd);
		
		int result = mService.insertMember(m);
		
		if(result>0) { // 성공 => 알람창 출력할 문고 담아서 => 메인페이지 (url재요청)
			session.setAttribute("alertMsg", "성공적으로 회원가입되었습니다");
			return "redirect:/";
		}else { // 실패 => 에러문구 담아서 => 에러페이지로 포워딩
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage";
		}
		
		
	}
	
	// 마이페이지 프로필 폼 이동
	@RequestMapping("profile.me")
	public String profileForm(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
		Address add = mService.selectDefault(memNo);
		model.addAttribute("add", add);
		
		return "member/myPageProfile";
	}
	
	// 회원정보수정
	@RequestMapping("update.me")
	public String updateMember(Member m, HttpSession session, Model model) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		m.setMemPwd(encPwd); // 암호문으로  변경하기
		
		
		int result = mService.updateMember(m);
		
		
		if(result>0) {
		
			session.setAttribute("loginUser", mService.loginMember(m));
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다");
			return "redirect:profile.me";
					
		} else {
		
			model.addAttribute("errorMsg", "정보 수정 실패");
			return "common/errorPage";
		}
	}
	
	// 배송지관리 폼
	@RequestMapping("address.me")
	public String addressForm(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		int memNo = loginUser.getMemNo();
		ArrayList<Address> a = mService.selectMember(memNo);
		Address add = mService.selectDefault(memNo);
		
		model.addAttribute("a", a);
		model.addAttribute("add", add);
		
		return "member/myPageAddress";
	}
	
	// 배송지 추가
	@RequestMapping("insert.ad")
	public String insertAddress(Address ad, HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		System.out.println(ad);
		int memNo = loginUser.getMemNo();
		
		String adName = ad.getAdName();
		String adPhone = ad.getAdPhone();
		String adPost = ad.getAdPost();
		String adRoad = ad.getAdRoad();
		String adDetail = ad.getAdDetail();
		String adDefault = ad.getAdDefault();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memNo", memNo);
		map.put("adName", adName);
		map.put("adPhone", adPhone);
		map.put("adPost", adPost);
		map.put("adRoad", adRoad);
		map.put("adDetail", adDetail);
		map.put("adDefault", adDefault);
		
		
		int result3 = mService.insertAddress(map);
		
		if(result3>0) { // 성공 => 알람창 출력할 문고 담아서 => 메인페이지 (url재요청)
			session.setAttribute("alertMsg", "배송지가 추가되었습니다");
			return "redirect:address.me";
		}else { 
			return "common/errorPage";
		}
		
		
	}
	
	// 배송지 수정상세보기
	@RequestMapping("address.up")
	public String selectAddress(int adNo, Model model) {
		
		Address a = mService.selectAddress(adNo); 
			
		model.addAttribute("a", a);
		return "member/myPageAddressUpdate";
			
		
	}
	
	// 배송지 수정하기
	@RequestMapping("address.fi")
	public String fixAddress(Address a, HttpSession session, Model model) {
		System.out.println(a);
	
		String adDefault = a.getAdDefault();
		
		System.out.println(a.getMemNo());
		int	result = mService.fixAddress(a);
		
		int result3 = 0;
		
		if(adDefault.equals("Y")) {
			 result3 = mService.fixAddress3(a);
			 int result2 = mService.fixAddress2(a);
		}
			
		
		if(result>0 || result3>0) {
		
			session.setAttribute("alertMsg", "성공적으로 수정되었습니다");
			return "redirect:address.me";
					
		} else {
		
			model.addAttribute("errorMsg", "정보 수정 실패");
			return "common/errorPage";
		}
	}
	
	// 배송지 삭제
	@RequestMapping("delete.ad")
	public String deleteAddress(int adNo, HttpSession session, Model model) {
		System.out.println(adNo);
		int result = mService.deleteAddress(adNo);
		
		if(result > 0) { 
			
			session.setAttribute("alertMsg", "성공적으로 배송지가 삭제되었습니다.");
			return "redirect:address.me";
			
		}else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	
	// 내가만든프로젝트 폼 이동
	@RequestMapping("made.pr")
	public String madeProject(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int memNo = loginUser.getMemNo();
			
		Creator cre = mService.creatSearch(memNo);
			
		int creNo = cre.getCreNo();
			
			
		ArrayList<Project> pr = mService.madeProject(creNo);
			
			
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
		    
			System.out.println(pr);
			model.addAttribute("pr", pr);
			model.addAttribute("arr", arr);
			
			return "member/myPageMadeProject";
		}
		
		
		// 내가 만든 프로젝트 삭제
		@RequestMapping("delete.pr")
		public String deleteMyProject(int proNo, HttpSession session, Model model) {
			
			int result = mService.deleteMyProject(proNo);
			
			if(result > 0) { 
				
				session.setAttribute("alertMsg", "성공적으로 내 프로젝트가 삭제되었습니다.");
				return "redirect:made.pr";
				
			}else {
				model.addAttribute("errorMsg", "게시글 삭제 실패");
				return "common/errorPage";
			}
		}
	
	
}
