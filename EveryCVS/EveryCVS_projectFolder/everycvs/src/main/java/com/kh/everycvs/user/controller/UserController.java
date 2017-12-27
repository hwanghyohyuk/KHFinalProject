package com.kh.everycvs.user.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.kh.everycvs.common.model.vo.EmailCertification;
import com.kh.everycvs.common.model.vo.Favorite;
import com.kh.everycvs.common.model.vo.PassLink;
import com.kh.everycvs.common.model.vo.Purchase;
import com.kh.everycvs.common.model.vo.Store;
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
	public ModelAndView intercepterSignin(ModelAndView mv,@RequestParam(value = "sign", required=false, defaultValue="true") boolean sign,HttpSession session) {
		Object object = session.getAttribute("email");//email찾기시 저장해둔 세션
		if(object!=null){
			session.removeAttribute("email");
		}
		object = session.getAttribute("name");//이름 찾기시 저장해둔 세션
		if(object!=null){
			session.removeAttribute("name");
		}
		
		mv.setViewName("user/sign/signin");
		if(!sign){
			mv.addObject("sign", sign);
		}		
		return mv;
	}

	/** 로그인 **/
	@RequestMapping(value = "/user/signinpost.do", method = RequestMethod.POST)
	@ResponseBody
	public int signIn(@RequestParam("email") String email, @RequestParam("pwd") String pwd,
			@RequestParam(value = "usecookie", defaultValue = "false", required = false) boolean useCookie,
			HttpSession session, HttpServletResponse response) {
		int result = 0;
		
		if (session.getAttribute("user") != null) {
			// 기존에 user이란 세션 값이 존재한다면
			session.removeAttribute("user"); // 기존값을 제거해 준다.
		}
		User signin = new User(email, pwd, useCookie);

		// 로그인이 성공하면 UserVO 객체를 반환함.
		User user = userService.encSignIn(signin);

		if (user != null) { // 로그인 성공
			session.setAttribute("user", user); // 세션에 user란 이름으로 User 객체를 저장한다.
				
			switch(user.getJob()){
			case "customer":
				result = 1;
				break;
			case "storemanager":
				result = 2;
				break;
			case "cvsmanager":
				result = 3;
				break;
			case "sitemanager":
				result = 4;
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

		} else { // 로그인에 실패한 경우
			result=0;
		}	
		return result; 
	}

	/** 마이 페이지 **/
	@RequestMapping(value="/page/mypage.do")
	public ModelAndView myPage(HttpSession session, ModelAndView mv) {
		String month="0";
		User user = (User) session.getAttribute("user");
		ArrayList<Purchase> list = purchaseService.purchaseList(user.getUser_no(),month);
		
		mv.addObject("list", list);		
		System.out.println(list);
				
		mv.setViewName("user/mypage/main");
		return mv;
	}
	
	/** 잔고 충전  **/
	@RequestMapping(value="/page/increMoney.do", method=RequestMethod.POST)
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
	    mv.addObject("result", result);
	    mv.addObject("increMoney", incre);
	    
	    System.out.println("결과 : " + user.getCash());

	    return mv;
	}


	/** 로그아웃 **/
	@RequestMapping(value = "/user/signout.do", method=RequestMethod.POST)
	@ResponseBody
	public int signOut(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
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
		return 1;
	}
	
	@RequestMapping(value = "/user/signout.do", method=RequestMethod.GET)
	public String signOutGET(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
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
	public ModelAndView signUp(ModelAndView mv,User user) {
		mv.setViewName("user/sign/signin");
		int insertUser = userService.encInsertUser(user);
		mv.addObject("signup",insertUser);
		return mv;
	}
	
	@RequestMapping("/sign/signupadminpost.do")
	public ModelAndView signUpAdmin(ModelAndView mv,User user) {
		mv.setViewName("user/sign/signin");
		int insertAdmin = userService.encInsertAdmin(user);
		mv.addObject("signup",insertAdmin);
		return mv;
	}
	/*지점 관리자 회원가입 시 가입번호 체크*/
	@RequestMapping("/sign/enrollcompare.do")
	@ResponseBody
	public Store enrollCompare(@RequestParam("enrollNo") String enrollNo) {
		Store store = userService.enrollCompare(enrollNo);
		return store;
	}
	
	/*인증기록 확인*/
	@RequestMapping("/sign/checkcertify.do")
	@ResponseBody
	public int checkCertify(@RequestParam("email") String email) {
		//사용자의 중복요청을 처리하기 위한 메소드
		int checkCertify = userService.checkCertify(email);
		System.out.println("checkCertify : " + checkCertify);
		if(checkCertify>0){
			return 1;//이미 인증번호 요청이 있었음
		}else{		
			return 0;//최초 인증번호 요청
		}
	}
	
	/** 이메일 중복 검사 **/
	@RequestMapping("/sign/checkemail.do")
	@ResponseBody
	public int checkEmail(@RequestParam("email") String email,HttpSession session,@RequestParam("cValue")int checkCertify) {
		//이메일 중복체크 - 같은 이메일의 수 반환
		int result = userService.checkEmail(email);
		if(result>0){
			//이메일 중복O
			return result; //결과 : 중복
		}else{
			//이메일 중복X	
			String certifyNo = userService.createCertifyNo();
			EmailCertification ec = new EmailCertification(email, session.getId(), certifyNo);
			if(certifyNo!=null){
				int insertCertify=0;
				if(checkCertify>0){
					insertCertify = userService.updateCertify(ec);
				}else{
					insertCertify = userService.insertCertify(ec);
				}	
				if(insertCertify>0){
					boolean sendMail = userService.sendCertifyMail(email,certifyNo);
					if(sendMail){//결과 : 오류없음,0
						return result;
					}else{//이메일 전송 오류
						userService.deleteCertify(email);
						return -3;
					}
				}else{//DB insert 오류
					return -2;
				}
			}else{//인증번호 생성 오류
				return -1;
			}
		}
	}

	/** 인증번호 확인 **/
	@RequestMapping("/sign/checkcertification.do")
	@ResponseBody
	public int checkCertification(@RequestParam("email") String email,@RequestParam("certifyno") String certifyNo,HttpSession session) {
		int result=userService.certificationCheck(new EmailCertification(email, session.getId(), certifyNo));
		if(result>0){
			userService.deleteCertify(email);
		}		
		return result;
	}

	/** 회원탈퇴 **/
	public String deleteUser(HttpSession session) {

		return null;
	}

	/** 정보수정페이지 이동**/
	@RequestMapping("/user/infointro.do")
	public ModelAndView infoIntro(ModelAndView mv,HttpSession session) {
		mv.setViewName("user/mypage/infointro");
		return mv;
	}
	
	@RequestMapping("/user/infoin.do")
	@ResponseBody
	public int infoIn(ModelAndView mv,HttpSession session,@RequestParam("pwd")String pwd) {
		User user = (User)session.getAttribute("user");
		user.setUser_pwd(pwd);
		int checkUser = userService.encCheckUser(user);
		return checkUser;
	}
		
	
	@RequestMapping("/user/userinfo.do")
	public ModelAndView userInfo(ModelAndView mv,HttpSession session) {
		mv.setViewName("user/mypage/userinfo");
		return mv;
	}

	/* 이메일 찾기 페이지 이동 */
	@RequestMapping("/user/findemail.do")
	public String moveToFindEmail() {
		return "user/find/findemail";
	}

	/** 이메일찾기 **/
	@RequestMapping("/user/findemailpost.do")
	@ResponseBody
	public int findEmail(@RequestParam("email") String email,HttpSession session) {
		int result = userService.checkEmail(email);
		if(result>0){
			Object object = session.getAttribute("email");
			if(object!=null){
				session.removeAttribute("email");
			}
			session.setAttribute("email", email);			
		}
		return result;
	}
	
	/* 이름 찾기 페이지 이동 */
	@RequestMapping("/user/findname.do")
	public String moveToFindName() {
		return "user/find/findname";
	}
	
	/** 이름 확인 **/
	@RequestMapping("/user/findnamepost.do")
	@ResponseBody
	public int findName(@RequestParam("name") String name,HttpSession session) {
		String email = (String) session.getAttribute("email");			
		int result = userService.checkName(email,name);
		if(result>0){
			Object object = session.getAttribute("name");
			if(object!=null){
				session.removeAttribute("name");
			}
			session.setAttribute("name", name);			
		}
		return result;
	}

	/* 휴대폰 번호 찾기 페이지 이동 */
	@RequestMapping("/user/findphone.do")
	public String moveToFindPhone() {
		return "user/find/findphone";
	}
	
	/** 전화번호 확인 **/
	@RequestMapping("/user/findphonepost.do")
	@ResponseBody
	public int findPhone(@RequestParam("phone") String phone,HttpSession session) {
		String email = (String) session.getAttribute("email");	
		String name = (String) session.getAttribute("name");	
		int result = userService.checkPhone(email,name,phone);
		if(result>0){
			session.removeAttribute("name");
		}			
		return result;
	}
	
	@RequestMapping("/user/checkpasslink.do")
	@ResponseBody
	public int checkPasslink(HttpSession session){
		//사용자의 중복요청을 처리하기 위한 메소드
		String email = (String) session.getAttribute("email");
		int checkPasslink = userService.checkPasslink(email);
		if(checkPasslink>0){
			return 1;//이미 재설정 링크가 있음
		}else{		
			return 0;//최초 재설정
		}
	}
	
	@RequestMapping("/user/sendresetpwd.do")
	@ResponseBody
	public int sendResetPwd(HttpSession session,@RequestParam("pValue")int checkPasslink){
		String email = (String) session.getAttribute("email");
		//비밀번호 재설정 키 만들고
		String resetKey = userService.createResetKey();
		if(resetKey!=null){
			//데이터베이스에 저장하고
			PassLink passlink = new PassLink(email, resetKey);
			int insertKey=0;
			if(checkPasslink>0){
				insertKey = userService.updateKey(passlink);
			}else{
				insertKey = userService.insertKey(passlink);
			}			
			if(insertKey>0){//이메일 보냄
				boolean isSuccess = userService.sendResetPwd(email, resetKey);//수정
				if (isSuccess){			
					return 1;//성공, 오류없음
				}else{//email send error
					userService.deleteResetKey(email);
					return -3;
				}
			}else{//DB insert error
				return -2;
			}
		}else{//key create error
			return -1;
		}		
	}
	
	/* 비밀번호재설정 성공 페이지 이동 */
	@RequestMapping("/user/findsuccess.do")
	public String moveToFindSuccess() {
		return "user/find/findsuccess";
	}
	
	/* 비밀번호 재설정 페이지 이동*/
	@RequestMapping(value="/user/resetpwd.do", method = RequestMethod.GET)
	public ModelAndView moveToResetPwd(ModelAndView mv,@RequestParam("key") String key) {
		mv.setViewName("user/find/resetpwd");
		PassLink passlink = userService.selectPasslink(key);
		if(passlink!=null){
			mv.addObject("passlink",passlink);
		}else{
			mv.addObject("result",false);
		}		
		return mv;
	}
	
	/* 비밀번호 재설정 제출 */
	@RequestMapping("/user/resetpwdpost.do")
	@ResponseBody
	public int resetPwdPost(@RequestParam("email")String email, @RequestParam("pwd")String pwd){//email,pwd
		User user = new User(email, pwd);
		int resetPwd = userService.resetPwd(user);		
		if(resetPwd>0){
			int deleteResetKey = userService.deleteResetKey(user.getEmail());
			if(deleteResetKey>0){
				return 2; //성공, 오류없음
			}else{
				return 1; //성공, key 삭제 오류
			}
		}else{
			return 0;//실패
		}
	}	
	
	/*** 사이트 관리자 ***/

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
