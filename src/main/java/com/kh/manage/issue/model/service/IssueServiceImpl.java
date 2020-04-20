package com.kh.manage.issue.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.common.Attachment;
import com.kh.manage.issue.model.dao.IssueDao;
import com.kh.manage.issue.model.vo.Issue;
import com.kh.manage.issue.model.vo.IssueProjectTeam;
import com.kh.manage.issue.model.vo.IssueWPT;
import com.kh.manage.issue.model.vo.IssueWork;
import com.kh.manage.member.model.vo.Member;

@Service
public class IssueServiceImpl implements IssueService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private IssueDao id;

	@Override
	public List<IssueWPT> selectProjectName(Member member) {
		return id.selectProjectName(sqlSession, member);
	}

	@Override
	public List<IssueWork> selectWorkList(String pno) {
		return id.selectWorkList(sqlSession, pno);
	}

	@Override
	public List<IssueProjectTeam> selectProjectTeamList(String pno) {
		return id.selectProjectTeamList(sqlSession, pno);
	}

	@Override
	public Issue insertIssue(Issue issue) {
		return null;
	}

	@Override
	public int insertIssueAttachment(Attachment attachment) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
