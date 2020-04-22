package com.kh.manage.issue.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
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
	public int insertIssue(Issue issue) {
		return id.insertIssue(sqlSession, issue);
	}

	@Override
	public int insertIssueAttachment(Attachment at) {
		return id.insertIssueAttachment(sqlSession, at);
	}

	@Override
	public List<Issue> selectIssueList(Member member) {
		return id.selectIssueList(sqlSession, member);
	}

	@Override
	public List<IssueProjectTeam> selectProjectTeamList(Issue issue) {
		return id.selectProjectTeamList(sqlSession, issue);
	}

	@Override
	public int insertReportProjectTeam(IssueProjectTeam ipt) {
		return id.insertReportProjectTeam(sqlSession, ipt);
	}

	@Override
	public int insertIssueHistory(Issue issue) {
		return id.insertIssueHistory(sqlSession, issue);
	}

	@Override
	public List<Issue> selectIssueList2(String pno, PageInfo pi) {
		return id.selectIssueList2(sqlSession, pno, pi);
	}

	@Override
	public int getListCount(String pno) {
		return id.getListCount(sqlSession, pno);
	}

	@Override
	public Issue selectIssueOne(String issueNo) {
		return id.selectIssueOne(sqlSession, issueNo);
	}

	

	

}
