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
public class ConcludePay {
	//배송지에 들어갈 정보들
	int memNo;
	String adName;
	String adPhone;
	String adPost;
	String adRoad;
	String adDetail;
	
	//pay에 들어갈 정보들
	int orNo;
	String payMethod;
	String payPrice;
	String payDate;
}
