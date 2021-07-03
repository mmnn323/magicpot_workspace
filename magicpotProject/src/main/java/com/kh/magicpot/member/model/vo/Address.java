package com.kh.magicpot.member.model.vo;

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
public class Address {
	
	private String adNo;
	private int memNo;
	private String adLocation;
	private String adName;
	private String adPhone;
	private String adPost;
	private String adRoad;
	private String adDetail;
	private String adDefault;

}
