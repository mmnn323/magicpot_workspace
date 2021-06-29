package com.kh.magicpot.report.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Blacklist {
	
	private int blacklistNo;
	private int memNo;
	private String suspended;
	private Date suspendedDate;
	private int reportCount;

}
