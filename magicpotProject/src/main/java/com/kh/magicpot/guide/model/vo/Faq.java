package com.kh.magicpot.guide.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Faq {
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private String faqDate;
	private int count;
	private String status;

}
