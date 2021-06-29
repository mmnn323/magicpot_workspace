package com.kh.magicpot.message.model.vo;

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
public class Message {

	private int msgNo;			// 메세지 번호
	private int memNo;			// 회원 번호
	private int creatorNo;		// 크리에이터 번호
	private Date msgSend;		// 메세지 송부일
	private String msgContent;	// 메세지 내용
	private String msgReply;	// 메세지 답변
	private Date msgAnswer;		// 메세지 답변일
	private String msgStatus;	// 메세지 확인 상탱 (Y.N)
	
}
