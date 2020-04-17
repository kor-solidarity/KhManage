package com.kh.manage.common;

import java.util.Date;

import org.aopalliance.intercept.Joinpoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.kh.manage.member.model.vo.Member;

@Component
@Aspect
public class LoginLogging {
	
	//로그 객체 생성
	private static final Logger logger = LoggerFactory.getLogger(LoginLogging.class);
	
	@Pointcut("execution(* com.kh.manage..*ServiceImpl.login*(..))")
	public void loginPointcut() {}
	
	@AfterReturning(pointcut = "loginPointcut()", returning = "returnObj")
	public void loginLog(Joinpoint jp, Object retuObj) {
		
		if(retuObj instanceof Member) {
			Member m = (Member) retuObj;
			logger.info(new Date() + " : $" + m.getMemberId() + "$ 님이 접속하셨습니다.");
		}
	}

}
