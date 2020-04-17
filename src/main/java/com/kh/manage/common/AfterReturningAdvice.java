package com.kh.manage.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import com.kh.manage.member.model.vo.Member;

@Component
@Aspect
public class AfterReturningAdvice {
	
	@Pointcut("excution(* com.kh.manage..*ServiceImpl.*(..))")
	public void allPointcut( ) {}
	
	@AfterReturning(pointcut = "allPointcut()", returning = "returnObj")
	public void allPointcut(JoinPoint jp, Object returnObj) {
		
		String methodName = jp.getSignature().getName();
		
		if(returnObj instanceof Member) {
			
			Member m = (Member) returnObj;
			if(m.getMemberId().equals("user01")) {
				System.out.println("user01님이 로그인 하셨습니다.");
			}
		}
		
		System.out.println("[메소드 리턴] : " + methodName + "() 메소드 리턴값 : " + returnObj.toString());
	}
	

}
