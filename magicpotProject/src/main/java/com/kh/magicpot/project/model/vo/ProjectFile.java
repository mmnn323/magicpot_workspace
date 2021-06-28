package com.kh.magicpot.project.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ProjectFile {
	private int fileNo; 		// 파일번호
	private int proNo;			// 프로젝트 번호
	private String fileName;	// 파일 원본명
	private String fileUpdate;	// 파일 수정명
	private String filePath;	// 파일 경로명
	private int fileCategory;	// 파일 카테고리 (1 : 스토리, 2 : 기본 정보)
}
