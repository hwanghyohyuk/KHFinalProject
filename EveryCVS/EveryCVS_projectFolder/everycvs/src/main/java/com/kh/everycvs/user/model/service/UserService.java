package com.kh.everycvs.user.model.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.EmailCertification;
import com.kh.everycvs.common.model.vo.PassLink;
import com.kh.everycvs.common.model.vo.Store;
import com.kh.everycvs.common.model.vo.User;

public interface UserService {

	/** 로그인 **/
	User signIn(User login);

	public void keepSignIn(String email, String sessionId, Date next) throws Exception;

	User checkUserWithSessionKey(String value);
	/** 정보수정 **/
	User getUser(int user_no);
	
	/* 가입번호 비교 */
	Store enrollCompare(String enrollNo);

	/** 인증번호 생성 및 DB insert **/
	String createCertifyNo();
	
	int insertCertify(EmailCertification emailCertification);

	/** 이메일 보내기 **/
	boolean sendCertifyMail(String email, String certifyNo);

	/** 회원가입 **/
	int insertUser(User user);
	
	int insertAdmin(User user);
	
	/** 이메일찾기 **/
	/** 이메일 중복 검사 **/
	int checkEmail(String email);

	/** 인증번호 확인 **/
	int certificationCheck(EmailCertification emailCertification);

	/** 회원탈퇴 **/
	boolean deleteUser(int user_no);

	/** 정보수정 **/
	boolean modifyUser(User user);

	/** 이름 확인 **/
	int checkName(String email, String name);
	
	/** 전화번호 확인 **/
	int checkPhone(String email, String name, String phone);

	/** 비밀번호 재설정 키 생성 **/
	String createResetKey();

	/** 재설정 이메일 보내기 **/
	boolean sendResetPwd(String email, String resetKey);

	/** insert PassLink **/
	int insertKey(PassLink passlink);
	
	int resetPwd(User user);
	
	/** 재설정 데이터 조회 **/
	PassLink selectPasslink(String key);
	
	/** 재설정 데이터 삭제 **/
	int deleteResetKey(String email);
	
	
	int increMoney(Map<String, Object> map);
	
	/* 사이트 관리자 */

	/** 회원 목록 및 검색 **/
	Map<String, Object> userList(String page, String keyword);









	

	


	


	

	
}
