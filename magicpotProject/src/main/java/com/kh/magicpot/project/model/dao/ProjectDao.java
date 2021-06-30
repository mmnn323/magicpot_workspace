package com.kh.magicpot.project.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
	
	
	

}

