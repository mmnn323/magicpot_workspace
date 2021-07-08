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
public class Member {
	
	private int memNo;
	private String memId;
	private String memPwd;
	private String memName;
	private String phone;
	private String email;
	private String emailYn;
	private String enrollRoute;
	private Date enrollDate;
	private String status;
	private String memPost;
	private String memRoad;
	private String memDetail;
	private int creNo;

}
