package com.kh.everycvs.common.advice;



import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterReturningAdvice {
	@Pointcut("execution(* com.kh.everycvs..*Dao.dml*(..))")
	public void transactionPoint(){}

	@AfterReturning()
	public void afterTransaction(JoinPoint jp, Object returnObj){
		String methodName = jp.getSignature().getName();
		if(returnObj instanceof Integer){
			
		}
	}
}
