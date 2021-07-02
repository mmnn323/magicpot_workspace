package com.kh.magicpot.coupon.model.vo;

import java.sql.Date;
import java.util.ArrayList;

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
public class Coupon {
	
	private int cpNo;
	private String cpName;
	private int cpPrice;
	private int cpLower;
	private Date cpLimit;
	private String cpCondition;
	
	
	
	
	

}
