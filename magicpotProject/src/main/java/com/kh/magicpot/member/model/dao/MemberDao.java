package com.kh.magicpot.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.member.model.vo.Member;

@Repository
public class MemberDao {
	
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.idCheck", userId);
	}
	
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}
	
	// 관리자 일반회원관리 총 회원 수 
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("memberMapper.selectListCount");
	}
	
	public ArrayList<Member> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	    int limit = pi.getBoardLimit();
	    
	    RowBounds rowBounds = new RowBounds(offset, limit);
	    
	    return (ArrayList)sqlSession.selectList("memberMapper.selectList", null, rowBounds);
	
	}
	
	
	
}
