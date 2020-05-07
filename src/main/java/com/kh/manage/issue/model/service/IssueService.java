package com.kh.manage.issue.model.service;

import java.util.HashMap;
import java.util.List;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
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

public interface IssueService {

	List<IssueWPT> selectProjectName(Member member);

	List<IssueWork> selectWorkList(HashMap<String, String> map);

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

	List<Attachment> selectAttachment(Attachment at);

	List<WorkProjectTeam> selectTeamWork(Member member);

	List<IssueWork> selectWorkTMList(HashMap<String, String> map);

	Work selectWork(String workNo);

	List<Grantor> selectGrantorList(String projectNo);

	List<Work> selectHighWorkNoList(Work w);

	int insertChangeRequest(ChangeRequest cr);


}
