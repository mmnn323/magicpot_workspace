package com.kh.magicpot.notice.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString

public class Notice {
	
	private int noNo;
	private String noTitle;
	private String noContent;
	private Date noDate;
	private int count;
	private String status;
	private String orgFileName; 
	private String noRoute;
}
