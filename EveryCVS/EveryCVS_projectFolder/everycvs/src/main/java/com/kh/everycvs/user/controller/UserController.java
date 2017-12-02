package com.kh.everycvs.user.controller;

import javax.servlet.http.HttpSession;

import org.apache.maven.model.Model;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.user.model.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	/** 로그인 **/
	public String signIn(@RequestParam("email") String email,@RequestParam("password") String password, HttpSession session) {
		User user = userService.checkUser(new User(email,password));
		return null;
	}

	/** 마이 페이지 **/
	public ModelAndView myPage(HttpSession session) {
		User temp = (User)(session.getAttribute("user"));
		int user_no = temp.getUser_no();
		User user = userService.getUser(user_no);
		return null;
	}

	/** 로그아웃 **/
	public String signOut(HttpSession session) {

		return null;
	}

	/* 회원가입 페이지 이동 */
	public String moveToSignup() {
		return "user/signup/signup";
	}
	
	/** 회원가입 **/
	public String signUp(@ModelAttribute User user){
		return null;		
	}

	/** 이메일 중복 검사 **/
	public Model emailCheck(@RequestParam("emailcheck") String email) {

		/* 중복아닐경우 */
		/** Service : 인증번호 생성 및 DB insert **/

		/** Service : 이메일 보내기 **/

		/** 페이지 이동 **/
		// return ture

		/* 중복일경우 */
		// return false
		return null;
	}

	/** 인증번호 확인 **/
	public Model certificationCheck(@RequestParam("certificationNo") String certificationNo) {
		return null;
	}

	/** 회원탈퇴 **/
	public String deleteUser(HttpSession session) {

		return null;
	}

	/** 정보수정 **/
	public String modifyUser(HttpSession session, User user) {
		return null;
	}

	/* 이메일 찾기 페이지 이동 */
	public String moveToFindEmail() {
		return "?";
	}
	
	/** 이메일찾기 **/
	public ModelAndView findEmail(@RequestParam("email") String email) {

		/* 성공시 이름 확인 */

		/* 실패시 오류페이지 */

		return null;
	}

	/** 이름 확인 **/
	public ModelAndView findName(@RequestParam("name") String name) {

		/* 성공시 전화번호 확인 */

		/* 실패시 오류페이지 */

		return null;
	}

	/** 전화번호 확인 **/
	public ModelAndView findPhone(@RequestParam("phone") String phone) {

		/* 성공시 비밀번호 임시 비밀번호 이메일 보내기 */
		/** Service : 임시비밀번호 생성 및 DB update **/

		/** Service : 임시비밀번호를 포함한 이메일 보내기 **/

		/* 실패시 오류페이지 */

		return null;
	}

	/* 사이트 관리자 */

	/** 회원 목록 및 검색 **/
	public ModelAndView userList(@RequestParam(value = "p", required = true, defaultValue = "1") String page,
			@RequestParam(value = "kwd", required = false, defaultValue = "") String keyword) {
		return null;
	}

}
