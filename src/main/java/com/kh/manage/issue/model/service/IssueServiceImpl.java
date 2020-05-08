package com.kh.manage.issue.model.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.issue.model.dao.IssueDao;
import com.kh.manage.issue.model.vo.ChangeRequest;
import com.kh.manage.issue.model.vo.Issue;
import com.kh.manage.issue.model.vo.IssueHistory;
import com.kh.manage.issue.model.vo.IssueList;
import com.kh.manage.issue.model.vo.IssueProjectTeam;
import com.kh.manage.issue.model.vo.IssueWPT;
import com.kh.manage.issue.model.vo.IssueWork;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.work.model.vo.Grantor;
import com.kh.manage.work.model.vo.Work;
import com.kh.manage.work.model.vo.WorkProjectTeam;

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
	public List<IssueWork> selectWorkList(HashMap<String, String> map) {
		return id.selectWorkList(sqlSession, map);
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
	public IssueList selectIssueOne(String issueNo) {
		return id.selectIssueOne(sqlSession, issueNo);
	}

	@Override
	public int selectissueAgree(String issueNo) {
		return id.selectIssueAgree(sqlSession, issueNo);
	}

	@Override
	public int insertIssueComplete(IssueHistory ih) {
		return id.insertIssueComplete(sqlSession, ih);
	}

	@Override
	public List<Attachment> selectAttachment(Attachment at) {
		return id.selectAttachment(sqlSession, at);
	}

	@Override
	public List<WorkProjectTeam> selectTeamWork(Member member) {
		return id.selectTeamWork(sqlSession, member);
	}

	@Override
	public List<IssueWork> selectWorkTMList(HashMap<String, String> map) {
		return id.selectWorkTMList(sqlSession, map);
	}

	@Override
	public Work selectWork(String workNo) {
		return id.selectWork(sqlSession, workNo);
	}

	@Override
	public List<Grantor> selectGrantorList(String projectNo) {
		return id.selectGrantorList(sqlSession, projectNo);
	}

	@Override
	public List<Work> selectHighWorkNoList(Work w) {
		return id.selectHighWorkNoList(sqlSession, w);
	}

	@Override
	public int insertChangeRequest(ChangeRequest cr) {
		return id.insertChangeRequest(sqlSession, cr);
	}

	@Override
	public List<ChangeRequest> selectChangeRequestList(String pno, PageInfo pi) {
		return id.selectChangeRequestList(sqlSession, pno, pi);
	}

	@Override
	public ChangeRequest selectChangeRequestOne(String changeNo) {
		return id.selectChangeRequestOne(sqlSession, changeNo);
	}

	

	

}
