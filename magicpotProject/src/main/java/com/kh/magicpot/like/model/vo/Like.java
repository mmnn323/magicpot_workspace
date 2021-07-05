package com.kh.magicpot.like.model.vo;

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

	private int memNo;	// 회원번호
	private int proNo;	// 프로젝트 번호
	
}
