package com.kh.magicpot.pay.model.vo;

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
public class FundingList {

	// 결제 페이지 =========
	
	private int rewardNo;
	private String rewardExplain;
	private String rewardPrice;
	private int proNo;
	private String proImage;
	private String proTitle;
	private int orNum;
	private int orSum;
	private int memNo;
	private String phone;
	private String email;
	private String memName;
	private int cpNo;
	private String cpName;
	private int cpPrice;
	
}
