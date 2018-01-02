package com.kh.everycvs.user.model.service;

import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.EmailCertification;
import com.kh.everycvs.common.model.vo.PassLink;
import com.kh.everycvs.common.model.vo.Store;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.common.util.CommonUtils;
import com.kh.everycvs.common.util.MailUtils;
import com.kh.everycvs.user.model.dao.UserDao;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Autowired
	private JavaMailSender mailSender;

	@Override
	public User encSignIn(User login) {
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
	public Store enrollCompare(String enrollNo) {
		return userDao.enrollCompare(enrollNo);
	}

	@Override
	public int checkCertify(String email) {
		return userDao.checkCertify(email);
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
		return userDao.insertCertify(emailCertification);
	}

	@Override
	public int updateCertify(EmailCertification emailCertification) {
		return userDao.updateCertify(emailCertification);
	}

	@Override
	public boolean sendCertifyMail(String email, String certifyNo) {
		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("[모두의 편의점] 이메일 인증번호");
			sendMail.setText(new StringBuffer().append("<h1>[모두의 편의점] 이메일 인증번호</h1><br>")
					.append("<p style='font-size:18px'>인증번호는 <b>" + certifyNo + "</b> 입니다.<br>")
					.append("<p>해당 페이지에 입력 바랍니다.</p>").toString());
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
		return userDao.certificationCheck(emailCertification);
	}

	@Override
	public void deleteCertify(String email) {
		userDao.deleteCertify(email);
	}

	@Override
	public int encInsertUser(User user) {
		return userDao.insertUser(user);
	}

	@Override
	public int encInsertAdmin(User user) {
		return userDao.insertAdmin(user);
	}

	@Override
	public int checkName(String email, String name) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("user_name", name);
		return userDao.checkName(map);
	}

	@Override
	public int checkPhone(String email, String name, String phone) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("user_name", name);
		map.put("phone", phone);
		return userDao.checkPhone(map);
	}

	@Override
	public int checkPasslink(String email) {
		return userDao.checkPasslink(email);
	}

	@Override
	public String createResetKey() {
		String key = CommonUtils.getRandomString();
		return key;
	}

	@Override
	public boolean sendResetPwd(String email, String resetKey) {
		InetAddress server = null;
		try {
			server = InetAddress.getLocalHost();
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String ip = server.getHostAddress();
		String port = "8888";
		try {
			MailUtils sendMail = new MailUtils(mailSender);
			sendMail.setSubject("[모두의 편의점] 비밀번호 재설정");
			sendMail.setText(new StringBuffer().append("<h1>[모두의 편의점] 비밀번호 재설정</h1><br>"
					+ "<p style='font-size:18px'>이메일/비밀번호 찾기 작업이 완료되어 비밀번호를 재설정할 수 있는 링크를 보내드립니다.<br>"
					+ "<a href='http://" + ip + ":" + port + "/everycvs/user/resetpwd.do?key=" + resetKey
					+ "'><b>여기</b></a>를 누르시면 해당 링크로 이동합니다.<br>"
					+ "재설정 링크의 만료시간은 <b>6시간 후<b> 이며, 재설정 횟수는 <b>1회<b> 입니다.</p>").toString());
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
	public int insertKey(PassLink passlink) {
		return userDao.insertKey(passlink);
	}

	@Override
	public int updateKey(PassLink passlink) {
		return userDao.updateKey(passlink);
	}

	@Override
	public int encResetPwd(User user) {
		return userDao.resetPwd(user);
	}

	@Override
	public PassLink selectPasslink(String key) {
		return userDao.selectPasslink(key);
	}

	@Override
	public int deleteResetKey(String email) {
		return userDao.deleteResetKey(email);
	}

	@Override
	public int encCheckUser(User user) {
		return userDao.checkUser(user);
	}

	@Override
	public int deleteUser(String email) {
		return userDao.deleteUser(email);
	}
	


	@Override
	public int increMoney(Map<String, Object> map) {
		return userDao.userIncreMoney(map);
	}

	@Override
	public int registUserCount() {
		return userDao.registUserCount();
	}

	@Override
	public int updateUserImg(User user) {
		return userDao.updateUserImg(user);
	}

	@Override
	public int ModifyUser(User user) {
		return userDao.modifyUser(user);
	}

	@Override
	public int encModifyUserpwd(User user) {
		return userDao.modifyUserpwd(user);
	}

	@Override
	public List<User> userList(int currentPage, int limit, int jobno, int orderby, String keyword) {
		int startRow = (currentPage - 1) * limit + 1;
	    int endRow = startRow + limit - 1;        
	    return userDao.userList(startRow,endRow,jobno, orderby,keyword);
	}

	@Override
	public int userCount(int jobno) {
		return userDao.userCount(jobno);
	}

}
