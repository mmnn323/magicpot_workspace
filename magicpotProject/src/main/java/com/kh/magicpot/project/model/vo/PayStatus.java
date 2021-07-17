package com.kh.magicpot.project.model.vo;

import com.kh.magicpot.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PayStatus {
	private int orNo;
	private String memId;
	private int orSum;
	private String orDelivery;
	private String rewardTitle;
	private String deliveryStatus;
	private String deliveryNo;
	private Member member;
	private ProjectReward projectReward;
}
