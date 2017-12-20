package com.kh.everycvs.user.model.service;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.EmailCertification;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.user.model.dao.UserDao;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

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
	public String createCertfiNo() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertEmailCertification(EmailCertification emailCertification) {
		return userDao.insertEmailCertification(emailCertification);
	}

	@Override
	public boolean sendCertiMail(String certfiNo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User signUp(User user) {
		return userDao.signUp(user);
	}

	@Override
	public boolean emailCheck(String email) {
		return userDao.emailCheck(email);
	}

	@Override
	public boolean certificationCheck(String certificationNo) {
		return userDao.certificationCheck(certificationNo);
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
