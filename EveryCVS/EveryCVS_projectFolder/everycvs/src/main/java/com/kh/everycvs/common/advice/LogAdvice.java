package com.kh.everycvs.common.advice;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

//어드바이스는 서비스 어노테이션으로 선언한다
@Service
@Aspect
public class LogAdvice {
//모든클래스의 모든 메소드 구동 전에 해당 메소드 실행에 대한 로그 자동 출력용 어드바이스
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	//포인트 컷 설정 : 표현식을 사용
	@Pointcut("execution(* com.kh.everycvs..*.*(..))")
	public void allPointcut(){}
	
	@Pointcut("execution(* com.kh.everycvs..*Impl.get*(..))")
	public void getPointcut(){}
	
	@Before("allPointcut()")
	public void printLog(JoinPoint jp){
		logger.info("Execute Method : "+jp.getSignature().getName());
	}
	
}
