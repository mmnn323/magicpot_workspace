package com.kh.magicpot.pay.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class AdminPay {

	//회원
	private int memNo;
	private String memId;
	private String memName;

	//결제금액
	private Date payDate;
	private String payPrice;
	
	//프로젝트 타이틀, 달성현황 
	private String proTitle;
	private String proAd;

	

	
	
}
