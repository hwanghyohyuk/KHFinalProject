package com.kh.everycvs.user.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.EmailCertification;
import com.kh.everycvs.common.model.vo.User;

@Repository("UserDao")
public class UserDao {

	@Autowired
	private SqlSession sqlSession;

	public User checkUser(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean insertEmailCertification(EmailCertification emailCertification) {
		// TODO Auto-generated method stub
		return false;
	}

	public User getUser(int user_no) {
		// TODO Auto-generated method stub
		return null;
	}

	public User signUp(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean emailCheck(String email) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean certificationCheck(String certificationNo) {
		// TODO Auto-generated method stub
		return false;
	}

	public Map<String, Object> userList(String page, String keyword) {
		// TODO Auto-generated method stub
		return null;
	}

	public boolean updateTempPwd(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean findPhone(String phone) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean findName(String name) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean findEmail(String email) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean modifyUser(User user) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean deleteUser(int user_no) {
		// TODO Auto-generated method stub
		return false;
	}
	
}
