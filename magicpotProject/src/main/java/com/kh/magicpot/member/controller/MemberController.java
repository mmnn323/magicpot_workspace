package com.kh.magicpot.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
	
	@RequestMapping("address.me")
	public String addressForm(HttpSession session, Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		int memNo = loginUser.getMemNo();
		Address a = mService.selectMember(memNo);
		
		model.addAttribute("a", a);
		
		return "member/myPageAddress";
	}
	
	// 배송지 추가
	
	@RequestMapping("insert.ad")
	public String insertAddress(Address ad, HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		int memNo = loginUser.getMemNo();
		
		String adName = ad.getAdName();
		String adPhone = ad.getAdPhone();
		String adPost = ad.getAdPost();
		String adRoad = ad.getAdRoad();
		String adDetail = ad.getAdDetail();
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memNo", memNo);
		map.put("adName", adName);
		map.put("adPhone", adPhone);
		map.put("adPost", adPost);
		map.put("adRoad", adRoad);
		map.put("adDetail", adDetail);
		
		
		
	
		int result = mService.insertAddress(map);
		
		if(result>0) { // 성공 => 알람창 출력할 문고 담아서 => 메인페이지 (url재요청)
			session.setAttribute("alertMsg", "배송지가 추가되었습니다");
			return "member/myPageAddress";
		}else { 
			return "common/errorPage";
		}
		
		
	}
	
	

	
	
}
