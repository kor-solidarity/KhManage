package com.kh.manage.issue.model.service;

import java.util.List;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.issue.model.vo.Issue;
import com.kh.manage.issue.model.vo.IssueHistory;
import com.kh.manage.issue.model.vo.IssueList;
import com.kh.manage.issue.model.vo.IssueProjectTeam;
import com.kh.manage.issue.model.vo.IssueWPT;
import com.kh.manage.issue.model.vo.IssueWork;
import com.kh.manage.member.model.vo.Member;

public interface IssueService {

	List<IssueWPT> selectProjectName(Member member);

	List<IssueWork> selectWorkList(String pno);

	List<IssueProjectTeam> selectProjectTeamList(String pno);

	int insertIssue(Issue issue);

	int insertIssueAttachment(Attachment at);

	List<Issue> selectIssueList(Member member);

	List<IssueProjectTeam> selectProjectTeamList(Issue issue);

	int insertReportProjectTeam(IssueProjectTeam ipt);

	int insertIssueHistory(Issue issue);

	List<Issue> selectIssueList2(String pno, PageInfo pi);

	int getListCount(String pno);

	IssueList selectIssueOne(String issueNo);

	int selectissueAgree(String issueNo);

	int insertIssueComplete(IssueHistory ih);


}
