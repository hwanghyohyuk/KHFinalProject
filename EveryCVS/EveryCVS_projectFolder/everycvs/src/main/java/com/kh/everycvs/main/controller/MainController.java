package com.kh.everycvs.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.NaverMap;
import com.kh.everycvs.common.model.vo.Product;
import com.kh.everycvs.common.model.vo.Store;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.event.model.service.EventService;
import com.kh.everycvs.product.model.service.ProductService;
import com.kh.everycvs.store.model.service.StoreService;

@Controller
public class MainController {

	@Autowired
	private StoreService storeService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private EventService eventService;

	// 인터셉터를 거치는 페이지이동 메소드
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

	// 페이지이동 및 서비스 로드 메소드
	@RequestMapping("main.do")
	public ModelAndView main(ModelAndView mv, HttpSession session) {
		mv.setViewName("main/main");
		Object store = session.getAttribute("store");
		// 현재 세션에 store정보가 있다면
		if (store != null) {
			session.setAttribute("store", null); // 정보를 삭제한다
		}
		// 이벤트 top 3 편의점별 서비스 불러오기
		List<Product> eveTop3 = eventService.eventTop3();
		mv.addObject("evetop3",eveTop3);
		// 인기상품 top 3 서비스 불러오기
		List<Product> popTop3 = productService.popularTop3();
		mv.addObject("poptop3",popTop3);
		
		return mv;
	}

	/* ajax로 보여줄 지도 데이터 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ajax/brandmap.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView brandMap(ModelAndView mv, NaverMap location) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<Store> list = storeService.cvsMapList(location);// 전체 브랜드 조회
		JSONArray jar = new JSONArray();
		for (Store store : list) {
			JSONObject jstore = new JSONObject();
			jstore.put("brand_no", store.getBrand_no());
			jstore.put("brand_name", store.getBrand_name());
			jstore.put("store_no", store.getStore_no());
			jstore.put("store_name", store.getStore_name());
			jstore.put("road_address", store.getRoad_address());
			jstore.put("lat", store.getLat());
			jstore.put("lng", store.getLng());

			jar.add(jstore);
		}
		map.put("storelist", jar);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;
	}
	
	/* ajax로 보여줄 가장 가까운 편의점 */
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ajax/neareststore.do", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView nearestStore(ModelAndView mv,@RequestParam("brand_no") int brand_no,@RequestParam("lat") double lat,@RequestParam("lng") double lng) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("brand_no", brand_no);
		params.put("lat", lat);
		params.put("lng", lng);
		Map<String, Object> map = new HashMap<String, Object>();//보낼맵
		Store store = storeService.nearestStore(params);// 전체 브랜드 조회
		JSONObject jstore = new JSONObject();
			jstore.put("brand_no", store.getBrand_no());
			jstore.put("brand_name", store.getBrand_name());
			jstore.put("store_no", store.getStore_no());
			jstore.put("store_name", store.getStore_name());
			jstore.put("road_address", store.getRoad_address());
			jstore.put("lat", store.getLat());
			jstore.put("lng", store.getLng());
		map.put("store", jstore);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;
	}
	
	

	/* 사용자가 지점메인에 접속 */
	@RequestMapping("/page/storemain.do")
	public String userStoreMain(HttpSession session,
			@RequestParam(value = "sno", defaultValue = "", required = false) String sno) {
		Object sessionStore = session.getAttribute("store");
		// 현재 세션에 store정보가 있다면
		if (sessionStore != null) {
			session.setAttribute("store", null); // 정보를 삭제한다
		}
		if (sno.equals("")) {
			return "redirect:/main/main.do";
		}
		storeService.increamentJoinCount(sno);
		Store store = storeService.selectStore(sno);
		session.setAttribute("store", store);
		return "storemain/storeRankView";
	}

	/* 지점관리자가 지점메인에 접속 */
	@RequestMapping("storemain.do")
	public String StoreMain(HttpSession session) {
		Object sessionStore = session.getAttribute("store");
		// 현재 세션에 store정보가 있다면
		if (sessionStore != null) {
			session.setAttribute("store", null); // 정보를 삭제한다
		}
		User user = (User) session.getAttribute("user");
		if (user.getStore_no() == null) {// 지점관리자인지 아닌지 확인하는 조건문
			return "redirect:/main/main.do";
		} else {
			Store store = storeService.selectStore(user.getStore_no());
			session.setAttribute("store", store);
			return "admin/storemanager/main";
		}
	}

	/* 편의점 관리자가 편의점 관리 메인에 접속 */
	@RequestMapping("cvsmain.do")
	public String CvsMain() {
		return "admin/cvsmanager/main";
	}

	/* 사이트 관리자가 사이트 관리 메인에 접속 */
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
