package com.kh.manage.common;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AfterAdvice {

	@Pointcut("excution(* com.kh.manage..*ServiceImpl.*(..)")
	public void allPoint() {}

	@After("allPointcut()")
	public void finallyLog() {
		//예외 발생여부와 상관없이 사후에 동작하는 어드바이스
		System.out.println("[후 실행] 비지니스 로직 수행 후 무조건 작동");
	}
	
}
