package com.kh.magicpot.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.like.model.vo.Like;
import com.kh.magicpot.member.model.vo.Member;
import com.kh.magicpot.project.model.dao.ProjectDao;
import com.kh.magicpot.project.model.vo.Creator;
import com.kh.magicpot.project.model.vo.ProRequire;
import com.kh.magicpot.project.model.vo.Project;
import com.kh.magicpot.project.model.vo.ProjectReward;

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
	public int insertCreator(Creator c) {
		return pDao.insertCreator(sqlSession, c);
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

	@Override
	public Creator selectCreator(Member m) {
		return pDao.selectCreator(sqlSession, m);
	}
	
	@Override
	public int insertProject(HashMap<String, Integer> map) {
		return pDao.insertProject(sqlSession, map);
	}
	
	@Override
	public int selectRanNo(int ranNo) {
		return pDao.selectRanNo(sqlSession, ranNo);
	}

	@Override
	public int selectRanNo2(int pno) {
		return pDao.selectRanNo2(sqlSession, pno);
	}

	@Override
	public Project selectProject1(int ranNo) {
		return pDao.selectProject1(sqlSession, ranNo);
	}

	@Override
	public int updateProStep1(int ranNo) {
		return pDao.updateProStep1(sqlSession, ranNo);
	}

	@Override
	public Project selectProject2(int pno) {
		return pDao.selectProject2(sqlSession, pno);
	}

	@Override
	public ProRequire selectRequire(int pno) {
		return pDao.selectRequire(sqlSession, pno);
	}
	
	@Override
	public int insertRequire(ProRequire proRequire) {
		return pDao.insertRequire(sqlSession, proRequire);
	}
	
	@Override
	public int updateRequire(ProRequire proRequire) {
		return pDao.updateRequire(sqlSession, proRequire);
	}

	@Override
	public Project selectFundingDetail(int proNo) {
		return pDao.selectFundingDetail(sqlSession, proNo);
	}
	
	/*서포터
	@Override
	public int selectSupporter(int proNo) {
		return pDao.selectSupporter(sqlSession, proNo);
	}
	*/
	
	@Override
	public Project authorAjax(int proNo) {
		return pDao.authorAjax(sqlSession, proNo);
	}

	/**
	 * [휘경] 프로젝트 좋아요 여부 확인
	 */
	@Override
	public int isChecked(Like l) {
		return pDao.isChecked(sqlSession, l);
	}
	
	/**
	 * [휘경] 프로젝트 좋아요 수 조회
	 */
	@Override
	public int countLike(int proNo) {
		return pDao.countLike(sqlSession, proNo);
	}
	
	/**
	 * [휘경] 프로젝트 좋아요 취소
	 */
	@Override
	public int deleteLike(Like l) {
		return pDao.deleteLike(sqlSession, l);
	}
	
	/**
	 * [휘경] 프로젝트 좋아요 추가
	 */
	@Override
	public int insertLike(Like l) {
		return pDao.insertLike(sqlSession, l);
	}

	@Override
	public ArrayList<Project> selectReward(int proNo) {
		return pDao.selectReward(sqlSession, proNo);
	}

	@Override
	public Project selectBasic(int pno) {
		return pDao.selectBasic(sqlSession, pno);
	}	

	@Override
	public int updateBasic(Project p) {
		return pDao.updateBasic(sqlSession, p);
	}

	@Override
	public int updateProAd(int pno) {
		return pDao.updateProAd(sqlSession, pno);
	}

	@Override
	public int updateStory(Project p) {
		return pDao.updateStory(sqlSession, p);
	}

	@Override
	public ArrayList<ProjectReward> selectReward2(int pno) {
		return pDao.selectReward2(sqlSession, pno);
	}
	
	@Override
	public int insertReward(ProjectReward proReward) {
		return pDao.insertReward(sqlSession, proReward);
	}

	@Override
	public int updateReward(ProjectReward proReward) {
		return pDao.updateReward(sqlSession, proReward);
	}
	
	@Override
	public int deleteReward(int rno) {
		return pDao.deleteReward(sqlSession, rno);
	}

	@Override
	public int updateProStep2(int pno) {
		return pDao.updateProStep2(sqlSession, pno);
	}
	
	@Override
	public ArrayList<Project> selectProjectList(PageInfo pi) {
		return pDao.selectProjectList(sqlSession, pi);
	}

	@Override
	public int selectListProCount() {
		return pDao.selectListProCount(sqlSession);
	}

	@Override
	public Project selectFunManageBasic(int pno) {
		return pDao.selectFunManageBasic(sqlSession, pno);
	}

	@Override
	public Project selectFunManageStroy(int pno) {
		return pDao.selectFunManageStory(sqlSession, pno);
	}

	@Override
	public String selectProStep(int pno) {
		return pDao.selectProStep(sqlSession, pno);
	}
	
	@Override
	public int updateProStep3(int pno) {
		return pDao.updateProStep3(sqlSession, pno);
	}

	@Override
	public int updateProStep4(int pno) {
		return pDao.updateProStep4(sqlSession, pno);
	}

	@Override
	public int updateProCancel(int pno) {
		return pDao.updateProCancel(sqlSession, pno);
	}

	@Override
	public ArrayList<Project> selectSearchList(PageInfo pi, HashMap<String, String> map) {
		return pDao.selectSearchList(sqlSession, pi, map);
	}

	@Override
	public int updateOpenDateDir(int pno) {
		return pDao.updateOpenDateDir(sqlSession, pno);
	}

	@Override
	public int updateOpenDateRes(Project pro) {
		return pDao.updateOpenDateRes(sqlSession, pro);
	}


	
	
}
