package com.kh.magicpot.message.model.vo;

import java.sql.Date;

import com.kh.magicpot.member.model.vo.Member;
import com.kh.magicpot.project.model.vo.Category;
import com.kh.magicpot.project.model.vo.Creator;
import com.kh.magicpot.project.model.vo.Project;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MessageList {
	
	private int msgNo;			// 메세지 번호
	private int memNo;			// 회원 번호
	private int creatorNo;		// 크리에이터 번호
	private String msgSend;		// 메세지 송부일
	private String msgContent;	// 메세지 내용
	private String msgReply;	// 메세지 답변
	private String msgAnswer;		// 메세지 답변일
	private String msgStatus;	// 메세지 확인 상탱 (Y.N)
	private int proNo;			// 프로젝트 번호
	
	private String memId;
	private String memPwd;
	private String memName;
	private String phone;
	private String email;
	private String emailYn;
	private String enrollRoute;
	private Date enrollDate;
	private String status;
	private String memPost;
	private String memRoad;
	private String memDetail;
	private int creNo;
	

	private String caNo; 		// 카테고리 
	private String proTitle; 		// 프로젝트 제목
	private int proPrice; 			// 목표 금액
	private String proImage; 		// 이미지 경로
	private String proSummary; 		// 프로젝트 요약
	private String proStory;	 	// 스토리
	private int proFundPrice; 		// 후원된 금액
	private String proStatus; 		// 프로젝트 승인, 미승인
	private String createWord; 		// 작가의 말
	private int proShipPrice; 		// 배송비
	private Date openDate; 			// 오픈일
	private Date closeDate; 		// 종료일
	private String proStep; 		// 펀딩 단계
	private String proAd;		    // 동의 여부
	
	private int creBusiness;	// (1: 개인, 2: 개인사업자, 3: 법인사업자)
	private String crePhone;
	private String crePrivacy;	// 개인정보 동의
	private String creName;		// 크리에이터 이름

}
