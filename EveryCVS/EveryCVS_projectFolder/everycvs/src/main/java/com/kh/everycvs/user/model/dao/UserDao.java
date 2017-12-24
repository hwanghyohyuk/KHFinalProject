package com.kh.everycvs.user.model.dao;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.EmailCertification;
import com.kh.everycvs.common.model.vo.PassLink;
import com.kh.everycvs.common.model.vo.Store;
import com.kh.everycvs.common.model.vo.User;

@Repository("UserDao")
public class UserDao {

	@Autowired
	private SqlSession sqlSession;

	public User signIn(User user) {
		// Mapper의 namespace명.id : 자신에게 맞게 작성해서 넣는다.
		User resultUser = sqlSession.selectOne("user.signIn", user);
		if(resultUser!=null){
			resultUser.setUser_pwd(null);
		}	
		return resultUser;
	}

	// 자동로그인 체크한 경우에 사용자 테이블에 세션과 유효시간을 저장하기 위한 메서드
	public void keepSignIn(String email, String sessionId, Date next) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("email", email);
		map.put("sessionId", sessionId);
		map.put("next", next);
		// Mapper.xml로 데이터를 전달할 때 한 객체밖에 전달 못함으로 map으로 묶어서 보내줌 단... 주의할 점은
		// Mapper.xml 안에서 #{} 이 안에 지정한 이름이랑 같아야함.. 자동으로 매핑될 수 있도록
		// 아래가 수행되면서, 사용자 테이블에 세션id와 유효시간이 저장됨
		sqlSession.update("user.keepSignIn", map);

	}

	// 이전에 로그인한 적이 있는지, 즉 유효시간이 넘지 않은 세션을 가지고 있는지 체크한다.
	public User checkUserWithSessionKey(String sessionId) {
		// 유효시간이 남아있고(>now()) 전달받은 세션 id와 일치하는 사용자 정보를 꺼낸다.
		return sqlSession.selectOne("user.checkUserWithSessionKey", sessionId);
	}

	public int insertUser(User user) {
		return sqlSession.insert("user.insertUser", user);
	}

	public int insertAdmin(User user) {
		return sqlSession.insert("user.insertAdmin", user);
	}

	public int checkCertify(String email) {
		return sqlSession.selectOne("user.checkCertify", email);
	}
	
	public int checkEmail(String email) {
		return sqlSession.selectOne("user.checkEmail", email);
	}

	public int insertCertify(EmailCertification emailCertification) {
		return sqlSession.insert("user.insertCertify", emailCertification);
	}

	public int updateCertify(EmailCertification emailCertification) {
		return sqlSession.update("user.updateCertify", emailCertification);
	}

	public void deleteCertify(String email) {
		sqlSession.delete("user.deleteCertify", email);
	}

	public int certificationCheck(EmailCertification emailCertification) {
		return sqlSession.selectOne("user.certificationCheck", emailCertification);
	}

	public Map<String, Object> userList(String page, String keyword) {
		return null;
	}

	public boolean updateTempPwd(User user) {
		return false;
	}
	
	public int checkUser(User user) {
		return sqlSession.selectOne("user.checkUser",user);
	}

	public boolean modifyUser(User user) {
		return false;
	}

	public boolean deleteUser(int user_no) {
		return false;
	}

	public int userIncreMoney(Map<String, Object> map) {
		return sqlSession.update("userIncreMoney", map);
	}

	public Store enrollCompare(String enrollNo) {
		return sqlSession.selectOne("store.enrollCompare", enrollNo);
	}

	public int checkName(Map<String, Object> map) {
		return sqlSession.selectOne("user.checkName", map);
	}

	public int checkPhone(Map<String, Object> map) {
		return sqlSession.selectOne("user.checkPhone", map);
	}

	public int checkPasslink(String email) {
		return sqlSession.selectOne("user.checkPasslink", email);
	}

	public int insertKey(PassLink passlink) {
		return sqlSession.insert("user.insertKey", passlink);
	}

	public int updateKey(PassLink passlink) {
		return sqlSession.insert("user.updateKey", passlink);
	}

	public int resetPwd(User user) {
		return sqlSession.update("user.resetPwd", user);
	}

	public PassLink selectPasslink(String key) {
		return sqlSession.selectOne("user.selectPasslink", key);
	}

	public int deleteResetKey(String email) {
		return sqlSession.delete("user.deleteResetKey", email);
	}



}
