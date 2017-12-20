package com.kh.everycvs.user.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
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

import com.kh.everycvs.common.model.vo.EmailCertification;
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
	@RequestMapping(value = "/sign/signin.do", method = RequestMethod.GET)
	public ModelAndView intercepterSignin(ModelAndView mv,@RequestParam(value = "sign", required=false, defaultValue="true") boolean sign) {
		mv.setViewName("user/sign/signin");
		if(!sign){
			mv.addObject("sign", sign);
		}		
		return mv;
	}

	/** 로그인 **/
	@RequestMapping(value = "/user/signinpost.do", method = RequestMethod.POST)
	public ModelAndView signIn(@RequestParam("email") String email, @RequestParam("pwd") String pwd,
			@RequestParam(value = "usecookie", defaultValue = "false", required = false) boolean useCookie,
			HttpSession session, HttpServletResponse response) {
		String returnURL = "";
		ModelAndView mv = null;
		
		if (session.getAttribute("user") != null) {
			// 기존에 user이란 세션 값이 존재한다면
			session.removeAttribute("user"); // 기존값을 제거해 준다.
		}
		User signin = new User(email, pwd, useCookie);

		// 로그인이 성공하면 UserVO 객체를 반환함.
		User user = userService.signIn(signin);

		if (user != null) { // 로그인 성공
			session.setAttribute("user", user); // 세션에 user란 이름으로 User 객체를 저장한다.
				
			switch(user.getJob()){
			case "customer":
				returnURL = "redirect:/main/main.do"; // 로그인 성공시 사용자 메인페이지 이동
				break;
			case "storemanager":
				returnURL = "redirect:/page/storemain.do";
				break;
			case "cvsmanager":
				returnURL = "redirect:/main/cvsmain.do";
				break;
			case "sitemanager":
				returnURL = "redirect:/main/sitemain.do";
				break;
			}			
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

				int amount = 60 * 60 * 24 * 7;
				cookie.setMaxAge(amount); // 단위는 (초)임으로 7일정도로 유효시간을
											// 설정해 준다.
				// 쿠키를 적용해 준다.
				response.addCookie(cookie);

				// currentTimeMills()가 1/1000초 단위임으로 1000곱해서 더해야함
				Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
				// 현재 세션 id와 유효시간을 사용자 테이블에 저장한다.
				try {
					userService.keepSignIn(user.getEmail(), session.getId(), sessionLimit);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			mv = new ModelAndView(returnURL);
		} else { // 로그인에 실패한 경우
			returnURL = "user/sign/signin"; // 로그인 폼으로 다시 가도록 함
			mv = new ModelAndView(returnURL);
			mv.addObject("result",false);
		}		
		return mv; // 위에서 설정한 returnURL 을 반환해서 이동시킴
	}

	/** 마이 페이지 **/
	@RequestMapping(value="mypage.do")
	public ModelAndView myPage(HttpSession session, ModelAndView mv) {
		String month="0";
		User user = (User) session.getAttribute("user");
		ArrayList<Purchase> list = purchaseService.purchaseList(user.getUser_no(),month);
		ArrayList<Favorite> flist = (ArrayList<Favorite>) favoriteService.favoriteList();
		
		mv.addObject("list", list);		
		mv.addObject("flist", flist); 
		System.out.println(list);
				
		mv.setViewName("user/mypage/main");
		return mv;
	}
	
	/** 잔고 충전  **/
	@RequestMapping(value="increMoney.do", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView userIncreMoney(
			@RequestParam (value="increMoney", required=false) String increMoney,
			@RequestParam(value="user_no", required=false) String user_no, 
			@RequestParam(value="cash", required=false) String cash,
			HttpSession session,
			HttpServletRequest request, 
			ModelAndView mv,
		    Map<String, Object> map) throws IOException {
				
		//파라미터 값 넘어왔는지 확인
		System.out.println("parameter값 controller로 넘어왔는지 확인 : " + increMoney + ", " + user_no + ", " + cash);
		
		//form input태그 값 int형으로 parsing 처리
		int incre = Integer.parseInt(increMoney);
		int uno = Integer.parseInt(user_no);
		int c = Integer.parseInt(cash);
		
		//parsing후 넘어왔는지 확인
		System.out.println("parameter값 parse후 넘어왔는지 확인 : " + increMoney + ", " + user_no + ", " + cash);

	    map.put("increMoney", incre);
	    map.put("user_no", uno);
	    map.put("cash", c);
	    
	    int result = userService.increMoney(map);
	    
	    User user = (User) session.getAttribute("user");
	    user.setCash(c + incre);
	    
	    session.setAttribute("user", user);
	    
	    mv.setViewName("jsonView");
	    mv.addObject(result);
	    
	    System.out.println("결과 : " + user.getCash());

	    return mv;
	}


	/** 로그아웃 **/
	@RequestMapping(value = "/user/signout.do", method = RequestMethod.GET)
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
	@RequestMapping("/sign/signupintro.do")
	public String moveToSignupIntro() {
		return "user/signup/signupintro";
	}

	/* 일반 사용자 회원가입 페이지 이동 */
	@RequestMapping("/sign/signup.do")
	public String moveToSignup() {
		return "user/signup/signup";
	}
	
	/* 지점 관리자 회원가입 페이지 이동 */
	@RequestMapping("/sign/signupadmin.do")
	public String moveToSignupAdmin() {
		return "user/signup/signupadmin";
	}

	/** 회원가입 **/
	@RequestMapping("/sign/signuppost.do")
	public String signUp(@ModelAttribute User user) {
		return null;
	}

	/** 이메일 중복 검사 **/
	@RequestMapping("/sign/checkemail.do")
	public int checkEmail(@RequestParam("email") String email,HttpSession session) {
		//이메일 중복체크 - 같은 이메일의 수 반환
		int result = userService.checkEmail(email);
		if(result>0){
			//이메일 중복O
			return result; //결과 : 중복
		}else{
			//이메일 중복X
			String certifyNo = userService.createCertifyNo();
			if(certifyNo!=null){
			int insertCertify = userService.insertCertify(new EmailCertification(email, session.getId(), certifyNo));
			if(insertCertify>0){
				boolean sendMail = userService.sendCertifyMail(email,certifyNo);
				if(!sendMail){
					return -3;//이메일 전송 오류
				}
			}else{
				return -2;//DB insert 오류
			}
			}else{
				return -1;//인증번호 생성 오류
			}
			return result;//결과 : 오류없음
		}
	}

	/** 인증번호 확인 **/
	@RequestMapping("/sign/checkcertification.do")
	public int checkCertification(@RequestParam("email") String email,@RequestParam("certifyNo") String certifyNo,HttpSession session) {
		int result=userService.certificationCheck(new EmailCertification(email, session.getId(), certifyNo));
		return result;
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
	@RequestMapping("/user/findemail.do")
	public String moveToFindEmail() {
		return "user/find/findemail";
	}

	/** 이메일찾기 **/
	@RequestMapping("/user/findemailpost.do")
	public ModelAndView findEmail(ModelAndView mv/*,@RequestParam("email") String email*/) {
		mv.setViewName("user/find/findname");
		/* 성공시 이름 확인 */

		/* 실패시 오류페이지 */

		return mv;
	}

	/** 이름 확인 **/
	@RequestMapping("/user/findnamepost.do")
	public ModelAndView findName(ModelAndView mv/*,@RequestParam("name") String name*/) {
		mv.setViewName("user/find/findphone");
		/* 성공시 전화번호 확인 */

		/* 실패시 오류페이지 */

		return mv;
	}

	/** 전화번호 확인 **/
	@RequestMapping("/user/findphonepost.do")
	public ModelAndView findPhone(ModelAndView mv/*,@RequestParam("phone") String phone*/) {
		mv.setViewName("user/find/findsuccess");
		/* 성공시 비밀번호 임시 비밀번호 이메일 보내기 */
		/** Service : 임시비밀번호 생성 및 DB update **/

		/** Service : 임시비밀번호를 포함한 이메일 보내기 **/

		/* 실패시 오류페이지 */

		return mv;
	}

	/* 사이트 관리자 */

	/** 회원 목록 및 검색 **/
	@RequestMapping("/admin/manageUser.do")
	public ModelAndView userList(@RequestParam(value = "p", required = false, defaultValue = "1") String page,
			@RequestParam(value = "kwd", required = false, defaultValue = "") String keyword) {
			ModelAndView mv = new ModelAndView("admin/sitemanager/usermanage");
		return mv;
	}

	/** 사용자 등록 수 **/
	public ModelAndView userEnrollCount(ModelAndView modelAndView) {

		return modelAndView;
	}

}
