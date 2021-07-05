package com.kh.magicpot.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.project.model.dao.ProjectDao;
import com.kh.magicpot.project.model.vo.Creator;
import com.kh.magicpot.project.model.vo.Project;

@Service
public class ProjectServiceImpl implements ProjectService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProjectDao pDao;

	@Override
	public ArrayList<Project> rankList() {
		
		return pDao.rankList(sqlSession);
	}

	@Override
	public ArrayList<Project> reList() {
		
		return pDao.reList(sqlSession);
	}

	@Override
	public ArrayList<Project> slide() {
		return pDao.slide(sqlSession);
	}

	@Override
	public ArrayList<Project> newList() {
		return pDao.newList(sqlSession);
	}

	@Override
	public int insertCre(Creator c) {
		return pDao.insertCre(sqlSession, c);
	}

	@Override
	public ArrayList<Project> reList2(HashMap<String, Object> map) {
		return pDao.reList2(sqlSession, map);
	}

	@Override
	public ArrayList<Project> searchList(HashMap<String, Object> map) {
		return pDao.searchList(sqlSession, map);
	}

	@Override
	public ArrayList<Project> searchList2(HashMap<String, Object> map) {
		return pDao.searchList2(sqlSession, map);
	}

	
	
	

}
