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
public class ProjectRequire {
	private int proNo;				// 프로젝트 번호
	private String rewardPlan;		// 리워드 진행 계획
	private String rewradDelivery;	// 리워드 전달 계획
	private int rewardCategory;		// 리워드 카테고리(1: 생활잡화, 2: 가구, 주방)
}
