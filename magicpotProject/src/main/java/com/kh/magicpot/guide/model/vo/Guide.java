package com.kh.magicpot.guide.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Guide {

	private String guTitle;
	private String guContent;
	private String enrollDate;
	private String modifyDate;
	
	
}
