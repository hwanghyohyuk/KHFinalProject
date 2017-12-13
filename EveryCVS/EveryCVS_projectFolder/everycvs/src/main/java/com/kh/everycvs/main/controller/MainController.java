package com.kh.everycvs.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Store;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.store.model.service.StoreService;

@Controller
public class MainController {
	
	@Autowired
	private StoreService storeService;

	//인터셉터를 거치는 페이지이동 메소드
	@RequestMapping("main/main.do")
	public String intercepterMain() {
		return "main/main";
	}

	@RequestMapping("main/storemain.do")
	public String intercepterStoreMain() {
		return "admin/storemanager/main";
	}

	@RequestMapping("main/cvsmain.do")
	public String intercepterCvsMain() {
		return "admin/cvsmanager/main";
	}

	@RequestMapping("main/sitemain.do")
	public String intercepterSiteMain() {
		return "admin/sitemanager/main";
	}
	
	//페이지이동 및 서비스 로드 메소드
	@RequestMapping("main.do")
	public ModelAndView main(ModelAndView mv,HttpSession session) {
		mv.setViewName("main/main");
		Object store = session.getAttribute("store");
		// 현재 세션에 store정보가 있다면
		if(store!=null){
			session.setAttribute("store", null); //정보를 삭제한다
		}
		ArrayList<Store> list = storeService.cvsMapList(0);//전체 브랜드 조회
		mv.addObject("cvslist", list);
		
		return mv;
	}
	/* ajax로 보여줄 지도 데이터 */
	@RequestMapping("brandmap.do")
	public ModelAndView brandMap(ModelAndView mv,@RequestParam(value="bno",required=true) int bno){
		mv.setViewName("jasonView");
		ArrayList<Store> list = storeService.cvsMapList(bno);//전체 브랜드 조회
		
		
		mv.addObject("cvslist", list);
		return mv;		
	}

	/*사용자가 지점메인에 접속*/
	@RequestMapping("/page/storemain.do")
	public String userStoreMain(HttpSession session, @RequestParam(value="sno", defaultValue = "", required = false) String sno) {
		Object sessionStore = session.getAttribute("store");
		// 현재 세션에 store정보가 있다면
		if(sessionStore!=null){
			session.setAttribute("store", null); //정보를 삭제한다
		}
		if(sno.equals("")){
			return "redirect:/main/main.do";
		}
		storeService.increamentJoinCount(sno);
		Store store = storeService.selectStore(sno);		
		session.setAttribute("store", store);
		return "storemain/storeRankView";
	}

	/*지점관리자가 지점메인에 접속*/
	@RequestMapping("storemain.do")
	public String StoreMain(HttpSession session) {
		Object sessionStore = session.getAttribute("store");
		// 현재 세션에 store정보가 있다면
		if(sessionStore!=null){
			session.setAttribute("store", null); //정보를 삭제한다
		}
		User user = (User) session.getAttribute("user");
		if(user.getStore_no()==null){//지점관리자인지 아닌지 확인하는 조건문
			return "redirect:/main/main.do";
		}else{
			Store store = storeService.selectStore(user.getStore_no());
			session.setAttribute("store", store);
			return "admin/storemanager/main";
		}				
	}

	/*편의점 관리자가 편의점 관리 메인에 접속*/
	@RequestMapping("cvsmain.do")
	public String CvsMain() {
		return "admin/cvsmanager/main";
	}

	/*사이트 관리자가 사이트 관리 메인에 접속*/
	@RequestMapping("sitemain.do")
	public String SiteMain() {
		return "admin/sitemanager/main";
	}
	
	@RequestMapping("error404.do")
	public String error404() {
		return "error/404";
	}
	@RequestMapping("error500.do")
	public String error500() {
		return "error/500";
	}
	
}
