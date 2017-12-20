package com.kh.everycvs.user.model.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.EmailCertification;
import com.kh.everycvs.common.model.vo.User;

public interface UserService {

	/** 로그인 **/
	User signIn(User login);

	public void keepSignIn(String email, String sessionId, Date next) throws Exception;

	User checkUserWithSessionKey(String value);
	/** 정보수정 **/
	User getUser(int user_no);

	/** 인증번호 생성 및 DB insert **/
	String createCertifyNo();
	
	int insertCertify(EmailCertification emailCertification);

	/** 이메일 보내기 **/
	boolean sendCertifyMail(String email, String certifyNo);

	/** 회원가입 **/
	User signUp(User user);

	/** 이메일 중복 검사 **/
	int checkEmail(String email);

	/** 인증번호 확인 **/
	int certificationCheck(EmailCertification emailCertification);

	/** 회원탈퇴 **/
	boolean deleteUser(int user_no);

	/** 정보수정 **/
	boolean modifyUser(User user);

	/** 이메일찾기 **/
	boolean findEmail(String email);

	/** 이름 확인 **/
	boolean findName(String name);

	/** 전화번호 확인 **/
	boolean findPhone(String phone);

	/** 임시비밀번호 생성 및 DB update **/
	String createTempPwd();

	boolean updateTempPwd(User user);

	/** 임시비밀번호를 포함한 이메일 보내기 **/
	boolean sendTempPwdMail(String tempPwd);
	
	int increMoney(Map<String, Object> map);
	

	/* 사이트 관리자 */

	/** 회원 목록 및 검색 **/
	Map<String, Object> userList(String page, String keyword);

	


	

	
}
