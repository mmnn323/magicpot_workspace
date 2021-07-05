package com.kh.magicpot.project.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.magicpot.project.model.vo.Creator;
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


	public int insertCre(SqlSessionTemplate sqlSession, Creator c) {
		return sqlSession.insert("insertCre", c);
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
	
	

}

