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
public class ProjectReward {
	private int rewardNo;			// 리워드 번호
	private int proNo; 				// 프로젝트 번호
	private String rewardTitle;		// 리워드명
	private int rewardPrice;		// 리워드 가격
	private String rewardExplain; 	// 리워드 설명
	private int optionType;			// 옵션 타입 (1: 옵션x, 2: 선택, 3: 직접, 4: 둘다)
	private String choiceOption;	// 선택 옵션 내용
	private String inputOption;		// 직접 옵션 내용
	private int quantityLimit;		// 제헌 수량
	private String deliveryStart; 	// 발송 시작일
}
