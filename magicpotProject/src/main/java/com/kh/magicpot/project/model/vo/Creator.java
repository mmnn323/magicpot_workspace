package com.kh.magicpot.project.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Creator {
	private int creNo;			// 크리에이터 번호
	private int memNo;			// 회원 번호
	private int creBusiness;	// (1: 개인, 2: 개인사업자, 3: 법인사업자)
	private String crePhone;
	private String crePrivacy;	// 개인정보 동의
	private String creName;		// 크리에이터 이름
	private String status;		// 크리에이터 승인 여부
	
}
