package com.kh.magicpot.message.model.vo;

import com.kh.magicpot.member.model.vo.Member;
import com.kh.magicpot.project.model.vo.Creator;
import com.kh.magicpot.project.model.vo.Project;

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

	public Message(int msgNo, String msgReply) {}
	
	private int msgNo;			// 메세지 번호
	private int memNo;			// 회원 번호
	private int creatorNo;		// 크리에이터 번호
	private String msgSend;		// 메세지 송부일
	private String msgContent;	// 메세지 내용
	private String msgReply;	// 메세지 답변
	private String msgAnswer;		// 메세지 답변일
	private String msgStatus;	// 메세지 확인 상탱 (Y.N)
	private int proNo;			// 프로젝트 번호
	
	private Member member;
	private Project project;
	private Creator creator;
	
}
