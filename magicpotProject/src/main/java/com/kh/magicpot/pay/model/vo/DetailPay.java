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
public class DetailPay {
	
	private int memNo;
	private String memId;
	private String memName;
	private String proTitle;
	private String cpPrice;
	private String payPrice;
	private String payMethod;

}
