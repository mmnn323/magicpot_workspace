package com.kh.magicpot.guide.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.guide.model.vo.Faq;
import com.kh.magicpot.guide.model.vo.Guide;

@Repository
public class GuideDao {

	/* 다인 추가 - 이용약관 */
	// 이용약관 세부 / 수정용 페이지에 띄울 기본 이용약관
	public String proModifyForm(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("guideMapper.proModifyForm");
	}

	// 이용약관 수정
	public int proModify(SqlSessionTemplate sqlSession, String gu_provision) {
		return sqlSession.update("guideMapper.proModify", gu_provision);
	}
	
	// 이용가이드 페이지
	public ArrayList<Guide> guideForm(SqlSessionTemplate sqlSession, int ctg) {
		return (ArrayList)sqlSession.selectList("guideMapper.guideForm", ctg);
	}
	
	// faq 갯수
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("guideMapper.selectListCount");
	}

	//faq 리스트조회
	public ArrayList<Faq> faqList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("guideMapper.faqList", null, rowBounds);
	}
	
	// faq 등록
	public int insertForm(SqlSessionTemplate sqlSession, Faq fa) {
		return sqlSession.insert("guideMapper.insertForm", fa);
	}
	
	// faq 조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int faqNo) {
		return sqlSession.update("guideMapper.increaseCount", faqNo);
	}
	// faq 상세조회
	public Faq selectFaq(SqlSessionTemplate sqlSession, int faqNo) {
		return sqlSession.selectOne("guideMapper.selectFaq", faqNo);
	}
	
	// faq 수정
	public int updateFa(SqlSessionTemplate sqlSession, Faq fa) {
		return sqlSession.update("guideMapper.updateFa", fa);
	}
	
	// faq 삭제
		public int deleteFa(SqlSessionTemplate sqlSession, Faq fa) {
			return sqlSession.update("guideMapper.deleteFa", fa);
		}
}
