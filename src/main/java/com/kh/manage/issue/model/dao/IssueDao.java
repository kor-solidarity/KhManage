package com.kh.manage.issue.model.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.issue.model.vo.Issue;
import com.kh.manage.issue.model.vo.IssueHistory;
import com.kh.manage.issue.model.vo.IssueList;
import com.kh.manage.issue.model.vo.IssueProjectTeam;
import com.kh.manage.issue.model.vo.IssueWPT;
import com.kh.manage.issue.model.vo.IssueWork;
import com.kh.manage.member.model.vo.Member;
import com.kh.manage.work.model.vo.WorkProjectTeam;

public interface IssueDao {

	List<IssueWPT> selectProjectName(SqlSessionTemplate sqlSession, Member member);

	List<IssueWork> selectWorkList(SqlSessionTemplate sqlSession, HashMap<String, String> map);

	List<IssueProjectTeam> selectProjectTeamList(SqlSessionTemplate sqlSession, String pno);

	int insertIssue(SqlSessionTemplate sqlSession, Issue issue);

	int insertIssueAttachment(SqlSessionTemplate sqlSession, Attachment at);

	List<Issue> selectIssueList(SqlSessionTemplate sqlSession, Member member);

	List<IssueProjectTeam> selectProjectTeamList(SqlSessionTemplate sqlSession, Issue issue);

	int insertReportProjectTeam(SqlSessionTemplate sqlSession, IssueProjectTeam ipt);

	int insertIssueHistory(SqlSessionTemplate sqlSession, Issue issue);

	List<Issue> selectIssueList2(SqlSessionTemplate sqlSession, String pno, PageInfo pi);

	int getListCount(SqlSessionTemplate sqlSession, String pno);

	IssueList selectIssueOne(SqlSessionTemplate sqlSession, String issueNo);

	int selectIssueAgree(SqlSessionTemplate sqlSession, String issueNo);

	int insertIssueComplete(SqlSessionTemplate sqlSession, IssueHistory ih);

	List<Attachment> selectAttachment(SqlSessionTemplate sqlSession, Attachment at);

	List<WorkProjectTeam> selectTeamWork(SqlSessionTemplate sqlSession, Member member);

	List<IssueWork> selectWorkTMList(SqlSessionTemplate sqlSession, HashMap<String, String> map);

}
