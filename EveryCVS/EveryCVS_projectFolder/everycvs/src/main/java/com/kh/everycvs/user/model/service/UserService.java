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
	User encSignIn(User login);

	public void keepSignIn(String email, String sessionId, Date next) throws Exception;

	User checkUserWithSessionKey(String value);

	/** 이메일찾기 **/	
	/* 가입번호 비교 */
	Store enrollCompare(String enrollNo);

	/**인증번호 재요청 검사**/
	int checkCertify(String email);
	/** 이메일 중복 검사 **/
	int checkEmail(String email);
	/** 인증번호 생성 및 DB insert **/
	String createCertifyNo();	
	int insertCertify(EmailCertification emailCertification);
	int updateCertify(EmailCertification emailCertification);
	
	/** 이메일 보내기 **/
	boolean sendCertifyMail(String email, String certifyNo);
	
	/** 인증번호 삭제**/
	void deleteCertify(String email);
	
	/** 인증번호 확인 **/
	int certificationCheck(EmailCertification emailCertification);
	
	/** 회원가입 **/
	int encInsertUser(User user);	
	int encInsertAdmin(User user);
	
	
	/** 회원탈퇴 **/
	int deleteUser(int user_no);

	/** 정보수정 **/
	int encCheckUser(User user);
	int encModifyUser(User user);

	/** 이름 확인 **/
	int checkName(String email, String name);
	
	/** 전화번호 확인 **/
	int checkPhone(String email, String name, String phone);

	/** 기존 비밀번호 재설정 유무 체크 **/
	int checkPasslink(String email);
	
	/** 비밀번호 재설정 키 생성 **/
	String createResetKey();
	
	/** insert or update PassLink **/
	int insertKey(PassLink passlink);
	int updateKey(PassLink passlink);
	
	/** 재설정 이메일 보내기 **/
	boolean sendResetPwd(String email, String resetKey);
	
	int encResetPwd(User user);
	
	/** 재설정 데이터 조회 **/
	PassLink selectPasslink(String key);
	
	/** 재설정 데이터 삭제 **/
	int deleteResetKey(String email);
	
	
	int increMoney(Map<String, Object> map);
	
	/* 사이트 관리자 */
	//회원 등록 수
	int registUserCount();
	/** 회원 목록 및 검색 **/
	Map<String, Object> userList(String page, String keyword);

	

	

	

















	

	


	


	

	
}
