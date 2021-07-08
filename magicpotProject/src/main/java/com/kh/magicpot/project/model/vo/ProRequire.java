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
public class ProRequire {
	private int proNo; 				// 프로젝트 번호
	private String rewardPlan; 		// 리워드 진행 계획
	private String rewardDelivery;  // 리워드 전달 계획
	private int rewardCategory;	 	// 카테고리 번호 
}
