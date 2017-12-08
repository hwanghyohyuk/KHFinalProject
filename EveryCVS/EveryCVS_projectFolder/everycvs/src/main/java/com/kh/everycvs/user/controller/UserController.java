package com.kh.everycvs.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.kh.everycvs.common.model.vo.Favorite;
import com.kh.everycvs.common.model.vo.Purchase;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.favorite.model.service.FavoriteService;
import com.kh.everycvs.purchase.model.service.PurchaseService;
import com.kh.everycvs.user.model.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private PurchaseService purchaseService;
	@Autowired
	private FavoriteService favoriteService;
	

	/* 로그인 페이지 이동 */
	@RequestMapping(value = "sign/signin.do", method = RequestMethod.GET)
	public String intercepterSignin() {
		return "user/sign/signin";
	}

	/** 로그인 **/
	@RequestMapping(value = "signinpost.do", method = RequestMethod.POST)
	public String signIn(@RequestParam("email") String email, @RequestParam("pwd") String pwd,
			@RequestParam(value = "usercookie", defaultValue = "false", required = false) boolean useCookie,
			HttpSession session, HttpServletResponse response) {
		String returnURL = "";
		if (session.getAttribute("user") != null) {
			// 기존에 user이란 세션 값이 존재한다면
			session.removeAttribute("user"); // 기존값을 제거해 준다.
		}
		User signin = new User(email, pwd, useCookie);

		// 로그인이 성공하면 UserVO 객체를 반환함.
		User user = userService.signIn(signin);

		if (user != null) { // 로그인 성공
			session.setAttribute("user", user); // 세션에 login인이란 이름으로 User 객체를
												// 저장해 놈.
			// switch(사용자 직책으로)
			// customer
			// storemanager
			// cvsmanager
			// sitemanager

			returnURL = "main/main"; // 로그인 성공시 일반 메인페이지 이동
			/*
			 * [ 세션 추가되는 부분 ]
			 */
			// 1. 로그인이 성공하면, 그 다음으로 로그인 폼에서 쿠키가 체크된 상태로 로그인 요청이 왔는지를 확인한다.
			if (signin.isUseCookie()) { // dto 클래스 안에 useCookie 항목에 폼에서 넘어온 쿠키사용
										// 여부(true/false)가 들어있을 것임
				// 쿠키 사용한다는게 체크되어 있으면...
				// 쿠키를 생성하고 현재 로그인되어 있을 때 생성되었던 세션의 id를 쿠키에 저장한다.
				Cookie cookie = new Cookie("userCookie", session.getId());
				// 쿠키를 찾을 경로를 컨텍스트 경로로 변경해 주고...
				cookie.setPath("/");
				cookie.setMaxAge(60 * 60 * 24 * 7); // 단위는 (초)임으로 7일정도로 유효시간을
													// 설정해 준다.
				// 쿠키를 적용해 준다.
				response.addCookie(cookie);
			}
		} else { // 로그인에 실패한 경우
			returnURL = "sign/signin"; // 로그인 폼으로 다시 가도록 함
		}
		return returnURL; // 위에서 설정한 returnURL 을 반환해서 이동시킴
	}

	/** 마이 페이지 **/
	@RequestMapping("mypage.do")
	public ModelAndView myPage(HttpSession session, ModelAndView mv) {
		
		ArrayList<Purchase> list = (ArrayList<Purchase>) purchaseService.purchaseList();
		ArrayList<Favorite> flist = (ArrayList<Favorite>) favoriteService.favoriteList();
		mv.addObject("list", list);		
		mv.addObject("flist", flist); 
		System.out.println(list);
		System.out.println(flist);
		mv.setViewName("user/mypage/main");
		return mv;
	}
	
	/** 잔고 충전  **/
	@RequestMapping(value="increMoney.do", method=RequestMethod.POST)
	@ResponseBody
	public void userIncreMoney(@RequestParam Map<String,Object> map, HttpSession session, HttpServletResponse response, HttpServletRequest request, String increMoney) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		increMoney = request.getParameter(increMoney);
		int mon = Integer.parseInt(request.getParameter("increMoney"));
		
		
	    User user = (User) session.getAttribute("user");
	    session.setAttribute("user", user);
	    request.setAttribute("increMoney", mon);
	  
	    userService.increMoney(map);
	    
		System.out.println("vo : " + user);
		System.out.println("increMoney : " + mon);
	
		/*
		System.out.println("충전할 값 : " + increcash);*/
		/*out.append("ok");
		out.flush();
		out.close();*/
		
		//userService.increMoney(increMoney);
		/*session.setAttribute("increMoney", session);
		mv.addObject("increNum", increMoney);
		System.out.println(increMoney);*/
	}


	/** 로그아웃 **/
	@RequestMapping(value = "signout.do", method = RequestMethod.GET)
	public String signOut(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Object obj = session.getAttribute("user");
		if (obj != null) {
			User user = (User) obj;
			// null이 아닐 경우 제거
			session.removeAttribute("user");
			session.invalidate(); // 세션 전체를 날려버림
			// 쿠키를 가져와보고
			Cookie signinCookie = WebUtils.getCookie(request, "userCookie");
			if (signinCookie != null) {
				// null이 아니면 존재하면!
				signinCookie.setPath("/");
				// 쿠키는 없앨 때 유효시간을 0으로 설정하는 것 !!! invalidate같은거 없음.
				signinCookie.setMaxAge(0);
				// 쿠키 설정을 적용한다.
				response.addCookie(signinCookie);

				// 사용자 테이블에서도 유효기간을 현재시간으로 다시 세팅해줘야함.
				Date date = new Date(System.currentTimeMillis());
				try {
					userService.keepSignIn(user.getEmail(), session.getId(), date);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return "redirect:/main/main.do";
	}

	/* 회원가입 페이지 이동 */
	public String moveToSignup() {
		return "user/signup/signup";
	}

	/** 회원가입 **/
	public String signUp(@ModelAttribute User user) {
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

	/* AJAX */
	/** 사용자 등록 수 **/
	public ModelAndView userEnrollCount(ModelAndView modelAndView) {

		return modelAndView;
	}

}
