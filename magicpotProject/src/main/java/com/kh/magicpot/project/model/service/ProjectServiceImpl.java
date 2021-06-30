package com.kh.magicpot.project.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.project.model.dao.ProjectDao;
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

	

}
