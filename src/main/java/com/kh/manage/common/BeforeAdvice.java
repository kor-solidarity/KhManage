package com.kh.manage.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class BeforeAdvice {

	@Pointcut("excution(* com.kh.manage..*ServiceImpl.*(..)")
	public void allPoint() {}
	
	@Before("allPointcut()")
	public void beforeLog(JoinPoint jp) {
		//target-object가 실행하기 전에 수행할 내용을 작성함
		String methodName = jp.getSignature().getName();
		Object[] args = jp.getArgs();
		
		System.out.println("[메소드 호출 전 확인] : " + methodName + "() 메소드 호출됨");
		
		for(int i = 0; i < args.length; i++) {
			System.out.println(i + "번째 매개변수 정보 : " + args[i].toString());
		}
	}
	
}
