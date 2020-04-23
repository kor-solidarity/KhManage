package com.kh.manage.issue.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.manage.common.Attachment;
import com.kh.manage.common.PageInfo;
import com.kh.manage.issue.model.vo.Issue;
import com.kh.manage.issue.model.vo.IssueHistory;
import com.kh.manage.issue.model.vo.IssueList;
import com.kh.manage.issue.model.vo.IssueProjectTeam;
import com.kh.manage.issue.model.vo.IssueWPT;
import com.kh.manage.issue.model.vo.IssueWork;
import com.kh.manage.member.model.vo.Member;

@Repository
public class IssueDaoImpl implements IssueDao{

	@Override
	public List<IssueWPT> selectProjectName(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectList("Issue.selectProjectName", member);
	}

	@Override
	public List<IssueWork> selectWorkList(SqlSessionTemplate sqlSession, String pno) {
		
		return sqlSession.selectList("Issue.selectWorkList", pno);
	}

	@Override
	public List<IssueProjectTeam> selectProjectTeamList(SqlSessionTemplate sqlSession, String pno) {
		return sqlSession.selectList("Issue.selectProjectTeamList", pno);
	}

	@Override
	public int insertIssue(SqlSessionTemplate sqlSession, Issue issue) {
		return sqlSession.insert("Issue.insertIssue", issue);
	}

	@Override
	public int insertIssueAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("Issue.insertIssueAttachment", at);
	}

	@Override
	public List<Issue> selectIssueList(SqlSessionTemplate sqlSession, Member member) {
		return sqlSession.selectList("Issue.selectIssueList", member);
	}

	@Override
	public List<IssueProjectTeam> selectProjectTeamList(SqlSessionTemplate sqlSession, Issue issue) {
		return sqlSession.selectList("Issue.selectProjectTeamList2", issue);
	}

	@Override
	public int insertReportProjectTeam(SqlSessionTemplate sqlSession, IssueProjectTeam ipt) {
		return sqlSession.insert("Issue.insertReportProjectTeam", ipt);
	}

	@Override
	public int insertIssueHistory(SqlSessionTemplate sqlSession, Issue issue) {
		return sqlSession.insert("Issue.insertIssueHistory", issue);
	}

	@Override
	public List<Issue> selectIssueList2(SqlSessionTemplate sqlSession, String pno, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1) * pi.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getLimit());
		
		return sqlSession.selectList("Issue.selectIssueList2", pno, rowBounds);
	}

	@Override
	public int getListCount(SqlSessionTemplate sqlSession, String pno) {
		return sqlSession.selectOne("Issue.getListCount", pno);
	}

	@Override
	public IssueList selectIssueOne(SqlSessionTemplate sqlSession, String issueNo) {
		return sqlSession.selectOne("Issue.selectIssueOne", issueNo);
	}

	@Override
	public int selectIssueAgree(SqlSessionTemplate sqlSession, String issueNo) {
		return sqlSession.insert("Issue.selectIssueAgree", issueNo);
	}

	@Override
	public int insertIssueComplete(SqlSessionTemplate sqlSession, IssueHistory ih) {
		return sqlSession.insert("Issue.insertIssueComplete", ih);
	}

	@Override
	public List<Attachment> selectAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.selectList("Issue.selectAttachment", at);
	}

}
