package com.kh.magicpot.project.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString



public class Project {
	private int proNo; 				// 프로젝트 번호
	private int creNo; 				// 크리에이터 번호
	private String caNo; 			// 카테고리 
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
	private Category category;
	private Creator creator;
	private int ranNo;				// 랜덤함수
	private String caName;
	private int rewardNo;
}
