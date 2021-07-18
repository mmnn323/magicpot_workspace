package com.kh.magicpot.address.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class AddressList {
	int adNo;
	int memNo;
	String adLocation;
	String adName;
	String adPhone;
	String adPost;
	String adRoad;
	String adDetail;
	String adDefault;
}
