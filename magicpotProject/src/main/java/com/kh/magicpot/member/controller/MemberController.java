package com.kh.magicpot.member.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.common.template.Pagination;
import com.kh.magicpot.member.model.service.MemberService;
import com.kh.magicpot.community.model.vo.Community;
import com.kh.magicpot.community.model.vo.CommunityNotice;
import com.kh.magicpot.member.model.vo.Address;
import com.kh.magicpot.member.model.vo.Member;
import com.kh.magicpot.member.model.vo.NaverLoginBO;
import com.kh.magicpot.project.model.service.ProjectService;
import com.kh.magicpot.project.model.vo.Creator;
import com.kh.magicpot.project.model.vo.Project;
import com.kh.magicpot.report.model.service.ReportService;




@Controller
public class MemberController {

	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private ProjectService pService;
	
	@Autowired
	private ReportService rService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;

	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {

		String encPwd = bcryptPasswordEncoder.encode(m.getMemPwd());
		
		Member loginUser = mService.loginMember(m);
		
		// 다인 추가  - 신고 3회 이상으로 계정 정지된 회원 alert띄워주기
		int result = rService.reLogout(loginUser.getMemNo());
		
		if(result > 0) {
			// 로그아웃 안되는거 보완,,
			session.removeAttribute("loginUser");
			session.setAttribute("errorMsg", "신고 처리로 사이트 이용 불가능한 회원 입니다. 문의 바랍니다.");
			//session.invalidate();
			mv.setViewName("redirect:/");
			
		} else {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}
		
		// 로그인시 creator 조회
		Creator creator = pService.selectCreator(loginUser);
		
		if(creator != null) {
			session.setAttribute("creator", creator);
//			System.out.println(creator);
		}
		
		
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
	
	@RequestMapping("fId.me")
	public String FindId(HttpSession session) {
		return "member/FId";
	}
	
	@RequestMapping("fPwd.me")
	public String FindPwd(HttpSession session) {
		return "member/FPwd";
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


	/* 일반회원관리 검색 */
	@RequestMapping("search.me")
	public String adminSearchList(@RequestParam(value="currentPage", defaultValue="1") int currentPage,
			  				      String condition,
							      String cmKeyword,
							      HttpSession session,
							      Model model) {
		// HashMap에 담아서 요청
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("condition", condition);
		map.put("cmKeyword", cmKeyword);
		
		ArrayList<Member> me = mService.searchAdminList(map);
		
		// Model 객체에 응답데이터 담기
		model.addAttribute("me", me);
		model.addAttribute("condition", condition);
		model.addAttribute("cmKeyword", cmKeyword);

		return "admin/adminMember";
		
				
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
        
		// 인증번호 난수생성
		Random random = new Random();
		
		// 변수를 선언하여 이메일 전송에 필요로한 데이터 할당
		int checkNum = random.nextInt(888888) + 111111;
		
		String setFrom = "cloudmoney1112@gmail.com"; // root-context.xml에 삽입한 자신의 이메일 계정의 이메일 주소
        String toMail = email;						 // 수신받을 이메일
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
       
        try {
            // mailSender를 통한 이메일전송 코드
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
        
        // String 타입 변수 num 선언하고 인증번호(checkNum)를 String으로 형변환
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
		
		
		
		//로그인 첫 화면 요청 메소드 ************** 보류
		@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
		public String login(Model model, HttpSession session) {
			
			/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
			String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			
			//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
			//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
			
			//네이버 
			model.addAttribute("url", naverAuthUrl);

			/* 생성한 인증 URL을 View로 전달 */
			return "member/memberEnrollForm";
		}
		
		//성공시 callback호출 메소드 ****************** 보류
		@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })
		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
				throws IOException, ParseException {
			System.out.println("여기는 callback");
			OAuth2AccessToken oauthToken;
	        oauthToken = naverLoginBO.getAccessToken(session, code, state);
	        //로그인 사용자 정보를 읽어온다.
		    apiResult = naverLoginBO.getUserProfile(oauthToken);
		    System.out.println(apiResult);
		  //2. String형식인 apiResult를 json형태로 바꿈
		    JSONParser parser = new JSONParser();
		    Object obj = parser.parse(apiResult);
		    JSONObject jsonObj = (JSONObject) obj;

		  //  3. 데이터 파싱
		  //Top레벨 단계 _response 파싱
		  JSONObject response_obj = (JSONObject)jsonObj.get("response");
		  //response의 nickname값 파싱
		  String name = (String)response_obj.get("name");
		  System.out.println(name);
		  //4.파싱 닉네임 세션으로 저장
		  session.setAttribute("sessionId",name); //세션 생성

		
		    
		    
		    
			model.addAttribute("result", apiResult);
			

			
	        /* 네이버 로그인 성공 페이지 View 호출 */
			return "main";
		}
		
	// 네이버회원가입

	@RequestMapping("naver.en")
	public String enrollNaver() {
		return "member/naverEnrollForm";
	}
		
	// 회원탈퇴
	@RequestMapping("delete.me")
	public String deleteMember(String memPwd, HttpSession session, Model model) { 
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		if(bcryptPasswordEncoder.matches(memPwd, loginUser.getMemPwd())) {
			// 비밀번호 일치 => 본인 맞음
			int result = mService.deleteMember(loginUser.getMemId());
			
			if(result > 0) {
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "회원탈퇴가 완료되었습니다. 그동안 이용해주셔서 감사합니다.");
				
				// => 메인페이지
				return "redirect:/";
				
			}else{ // => 에러페이지
				model.addAttribute("errorMsg", "회원 탈퇴 실패");
				return "common/errorPage"; // 포워딩
			}
			
		}else {
			// 비밀번호 일치 x
			session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			return "redirect:profile.me";
		}
		
	}
	
	/* 일반회원관리 상세 회원 탈퇴*/
	@RequestMapping("delete.am")
	public String deleteAdminMember(int memNo, HttpSession session, Model model) {
		
		int result = mService.deleteAdminMember(memNo);
		//System.out.println(result);
		if(result>0) {
			session.removeAttribute("memNo");
			session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다.");
			return "redirect:admin.me";
		}else {
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			return "common/errorPage";
		}

	}

	/* 일반회원관리 회원 다중선택 탈퇴 */
 	@ResponseBody 
	@RequestMapping(value = "/delete.amc", method = RequestMethod.POST)
	public int multiDeleteAdopt(HttpSession session, @RequestParam(value = "chBox[]") List<String> chArr,Member m
			) {
 		
		int result = 0;
		int memNo = 0;

		for (String i : chArr) {
			memNo = Integer.parseInt(i);
			m.setMemNo(memNo);

			mService.multiDeleteAdopt(m);

		}
		result = 1;
		return result;
 	}

}
