package com.kh.everycvs.user.model.service;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.EmailCertification;
import com.kh.everycvs.common.model.vo.Store;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.common.util.MailUtils;
import com.kh.everycvs.user.model.dao.UserDao;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Autowired
	private JavaMailSender mailSender;

	@Override
	public User signIn(User login) {
		return userDao.signIn(login);
	}

	@Override
	public void keepSignIn(String email, String sessionId, Date next) {

		userDao.keepSignIn(email, sessionId, next);
	}

	@Override
	public User checkUserWithSessionKey(String sessionId) {
		return userDao.checkUserWithSessionKey(sessionId);
	}

	@Override
	public User getUser(int user_no) {
		return userDao.getUser(user_no);
	}
	
	@Override
	public Store enrollCompare(String enrollNo) {
		return userDao.enrollCompare(enrollNo);
	}
	
	@Override
	public int checkEmail(String email) {
		return userDao.checkEmail(email);
	}

	@Override
	public String createCertifyNo() {
		String BASE = "abcdefghijklmnopqrstuvwxyz0123456789";
		StringBuilder tempSb = new StringBuilder();
		for (int i = 0; i < 8; i++) {
			int randomIdx = (int) (Math.random() * BASE.length());
			tempSb.append(BASE.charAt(randomIdx));
		}
		String result = tempSb.toString();
		return result;
	}

	@Override
	public int insertCertify(EmailCertification emailCertification) {
		int check = userDao.checkCertify(emailCertification);
		if(check>0){
			return userDao.updateCertify(emailCertification);
		}else{
			return userDao.insertCertify(emailCertification);
		}	
	}
	
	@Override
	public boolean sendCertifyMail(String email, String certifyNo) {
		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("[모두의 편의점] 이메일 인증번호");
			sendMail.setText(new StringBuffer().append("<h1>[모두의 편의점] 이메일 인증번호</h1><br>")
					.append("<p style='font-size:18px'>인증번호는 <b>" + certifyNo + "</b> 입니다.<br>").append("<p>해당 페이지에 입력 바랍니다.</p>").toString());
			sendMail.setFrom("everycvs0105@gmail.com", "모두의편의점");
			sendMail.setTo(email);
			sendMail.send();
		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	@Override
	public int certificationCheck(EmailCertification emailCertification) {
		int result = userDao.certificationCheck(emailCertification);
		if(result>0){
			userDao.deleteCertify(emailCertification.getEmail());
		}
		return result;
	}

	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}
	
	@Override
	public int insertAdmin(User user) {
		return userDao.insertAdmin(user);
	}
	
	@Override
	public boolean deleteUser(int user_no) {
		return userDao.deleteUser(user_no);
	}

	@Override
	public boolean modifyUser(User user) {
		return userDao.modifyUser(user);
	}

	@Override
	public boolean findEmail(String email) {
		return userDao.findEmail(email);
	}

	@Override
	public boolean findName(String name) {
		return userDao.findName(name);
	}

	@Override
	public boolean findPhone(String phone) {
		return userDao.findPhone(phone);
	}

	@Override
	public String createTempPwd() {
		return null;
	}

	@Override
	public boolean updateTempPwd(User user) {
		return userDao.updateTempPwd(user);
	}

	@Override
	public boolean sendTempPwdMail(String tempPwd) {
		return false;
	}

	@Override
	public Map<String, Object> userList(String page, String keyword) {
		return userDao.userList(page, keyword);
	}

	@Override
	public int increMoney(Map<String, Object> map) {
		return userDao.userIncreMoney(map);
	}

	



}
