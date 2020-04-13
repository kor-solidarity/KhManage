package com.kh.manage.project.model.dao;

import com.kh.manage.admin.adminManage.vo.DeptMember;
import com.kh.manage.admin.department.model.vo.Dept;
import com.kh.manage.project.model.vo.ProjectType;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProjectDaoImpl implements ProjectDao {
	@Override
	public List<ProjectType> selectProjectTypeList(SqlSessionTemplate sqlSession) {
		
		
		// 서비스에서 보내온 SqlSessionTemplate 는 여기서 활용.
		// Statement 문은 mybatis-config 에 매퍼로 설정해둔 경로 안의
		// namespace 와 CRUD 아이디값으로 정한다.
		return sqlSession.selectList("Project.selectProjectTypeList");
	}
	
	@Override
	public List<Dept> selectDeptList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("Project.selectDeptList");
	}
	
	@Override
	public List<DeptMember> selectMemberList(SqlSessionTemplate sqlSession, String deptNo) {
		return sqlSession.selectList("Project.selectActiveMember", deptNo);
	}
}
