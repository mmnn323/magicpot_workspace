package com.kh.magicpot.like.model.vo;

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
public class Like { // 좋아요 vo클래스

	private int memNo;			// 회원번호
	private int proNo;			// 프로젝트 번호
	
    private String proTitle; 	// 프로젝트 제목
    private int proPrice;		// 목표금액
    private String proImage; 	// 프로젝트 대표이미지 경로
    private int proFundPrice; 	// 후원된 금액
    private Date openDate; 		// 오픈일
    private Date closeDate; 	// 종료일
    private int decimalDay;		// 프로젝트 남은 일 수
    private String proStep; 	// 펀딩 단계
    private String caName;		// 카테고리명
	
}
