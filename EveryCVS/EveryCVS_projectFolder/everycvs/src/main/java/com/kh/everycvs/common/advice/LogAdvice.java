package com.kh.everycvs.common.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class LogAdvice {
	@Pointcut("execution(* com.kh.everycvs..*.*(..))")
	public void allPointcut(){}

	@Around(value = "allPointcut()")
	public Object logOutput(ProceedingJoinPoint joinPoint) throws Throwable{
		String signatureStr = joinPoint.getSignature().toShortString();

		System.out.println("LOG INFO : "+System.currentTimeMillis()+" : "+signatureStr+" 호출");
		Object obj;
		try {
			obj = joinPoint.proceed();//핵심 기능 실행
			return obj;
		}finally {
			System.out.println("LOG INFO : "+System.currentTimeMillis()+" : "+signatureStr+" 리턴");
		}
	}
}
