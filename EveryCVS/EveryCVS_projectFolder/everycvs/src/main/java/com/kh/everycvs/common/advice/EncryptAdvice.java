package com.kh.everycvs.common.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

import com.kh.everycvs.common.common.CryptTemplate;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.common.util.AesUtil;

@Service
@Aspect
public class EncryptAdvice implements CryptTemplate{
	
	private AesUtil aesUtil = new AesUtil(KEY_SIZE, ITERATION_COUNT);
	
	@Pointcut("execution(* com.kh.everycvs..UserServiceImpl.enc*(..))")
	public void encPointcut(){}

	@Around(value = "encPointcut()")
	public Object encExcute(ProceedingJoinPoint joinPoint) throws Throwable{
		String signatureStr = joinPoint.getSignature().toShortString();
		User user = (User)joinPoint.getArgs()[0];
		user.setUser_pwd(aesUtil.encrypt(SALT, IV, PASSPHRASE, user.getUser_pwd()));

		System.out.println("LogAdvice : LOG INFO : EncryptAdvice Excute : "+signatureStr);
		Object obj = joinPoint.proceed(); //핵심 기능 실행
		return obj;
	}
}
