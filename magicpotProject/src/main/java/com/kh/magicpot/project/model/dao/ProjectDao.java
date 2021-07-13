package com.kh.magicpot.project.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.magicpot.member.model.vo.Member;
import com.kh.magicpot.project.model.vo.Creator;
import com.kh.magicpot.project.model.vo.ProRequire;
import com.kh.magicpot.project.model.vo.Project;

@Repository
public class ProjectDao {
	
	public ArrayList<Project> rankList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("projectMapper.rankList");
		
	}
	
	
	public ArrayList<Project> reList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("projectMapper.reList");
		
	}
	
	public ArrayList<Project> slide(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("projectMapper.slide");
		
	}
	
	public ArrayList<Project> newList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("projectMapper.newList");
		
	}


	public int insertCreator(SqlSessionTemplate sqlSession, Creator c) {
		return sqlSession.insert("insertCreator", c);
	}
	
	public ArrayList<Project> reList2(SqlSessionTemplate sqlSession, HashMap<String, Object> map){
		return (ArrayList)sqlSession.selectList("projectMapper.reList2", map);
		
	}
	
	public ArrayList<Project> searchList(SqlSessionTemplate sqlSession, HashMap<String, Object> map){
		return (ArrayList)sqlSession.selectList("projectMapper.searchList", map);
		
	}
	
	public ArrayList<Project> searchList2(SqlSessionTemplate sqlSession, HashMap<String, Object> map){
		return (ArrayList)sqlSession.selectList("projectMapper.searchList2", map);
		
	}
	
	public Creator selectCreator(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("selectCreator", m);
	}
	
	public int insertProject(SqlSessionTemplate sqlSession, HashMap<String, Integer> map) {
		return sqlSession.insert("insertProject", map);
	}


	public int selectRanNo(SqlSessionTemplate sqlSession, int ranNo) {
		String result = sqlSession.selectOne("selectRanNo", ranNo);
		if(result == null) { // null인 경우 중복 x -> 0
			return 0;
		}else { // null이 아닌 경우 중복 -> 1
			return 1;
		}
	}
	
	public int selectRanNo2(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("selectRanNo2", pno);
	}

	public Project selectProject1(SqlSessionTemplate sqlSession, int ranNo) {
		return sqlSession.selectOne("selectProject1", ranNo);
	}

	public Project selectProject2(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("selectProject2", pno);
	}
	
	public int updateProStep1(SqlSessionTemplate sqlSession, int ranNo) {
		return sqlSession.update("updateProStep1", ranNo);
	}

	public ProRequire selectRequire(SqlSessionTemplate sqlSession, int pno) {
		return sqlSession.selectOne("selectRequire", pno);
	}
	
	public int insertRequire(SqlSessionTemplate sqlSession, ProRequire proRequire) {
		return sqlSession.insert("insertRequire", proRequire);
	}

	public int updateRequire(SqlSessionTemplate sqlSession, ProRequire proRequire) {
		return sqlSession.update("updateRequire", proRequire);
	}	

	public Project selectFundingDetail(SqlSessionTemplate sqlSession, int proNo) {
		return sqlSession.selectOne("projectMapper.selectFundingDetail", proNo);
	}
	
	public Project authorAjax(SqlSessionTemplate sqlSession, int proNo) {
		return sqlSession.selectOne("projectMapper.authorAjax", proNo);
	}
}

