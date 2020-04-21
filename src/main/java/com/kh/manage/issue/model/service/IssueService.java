package com.kh.manage.issue.model.service;

import java.util.List;

import com.kh.manage.common.Attachment;
import com.kh.manage.issue.model.vo.Issue;
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


}
