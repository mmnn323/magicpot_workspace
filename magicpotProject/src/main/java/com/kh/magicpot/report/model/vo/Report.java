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
public class Report {
	
	private int reportNo;
	private int cmcoNo;
	private String reportContent;
	private String reportDate;
	private String reportType;
	private String reportStatus;
	
	private int cmNo;
}
