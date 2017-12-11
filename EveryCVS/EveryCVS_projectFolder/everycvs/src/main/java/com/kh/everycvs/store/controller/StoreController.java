package com.kh.everycvs.store.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Store;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.store.model.service.StoreService;

@Controller
public class StoreController {

	@Autowired
	private StoreService storeService;

	/* 사용자 */
	
	/** 지도에 표시할 데이터**/
	public ModelAndView cvsMapList(ModelAndView modelAndView) {
		Map map = storeService.cvsMapList();
		return null;
	}
	
	/*지점메인으로 이동*/
	public ModelAndView moveToStoreMain(String store_no){
		/**지점방문횟수 증가**/
		storeService.increamentJoinCount(store_no);
		return null;
	}
	
	
	/* 지점관리자 */

	/** 해당 지점의 방문자 수 조회 **/
	public ModelAndView storeJoinCount(ModelAndView modelAndView) {

		return null;
	}
	
	
	/* 편의점 관리자 */

	/** 방문자 수 top5 지점 **/
	public ModelAndView joinCountTop5(ModelAndView modelAndView) {
		int brand_no=0;
		Map map = storeService.joinCountTop5(brand_no);
		return null;
	}
	
	/** 지점 조회 : 모든 지점을 조회 */
	@RequestMapping("cvsstorelist.do")
	public ModelAndView selectStoreList(HttpSession session, ModelAndView mv) {
		User user = (User) session.getAttribute("user");
		ArrayList<Store> list = (ArrayList<Store>) storeService.selectStoreList(user.getBrand_no());
		mv.addObject("slist", list);
		mv.setViewName("admin/cvsmanager/storeList");
		return mv;
	}
	
	/** 지점 검색 : 입력한 키워드와 필터링으로 지점을 검색
	*	필터링 : 지점번호/지점명/시도명/구군명/법정동명 */
	@RequestMapping("cvsstoreSearch.do")
	public ModelAndView searchStoreList(HttpSession session, HttpServletRequest request, ModelAndView mv) {
		User user = (User) session.getAttribute("user");
		
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		keyword = "%" + keyword + "%";
		
		Store storeInfo = new Store();
		storeInfo.setBrand_no(user.getBrand_no());
	
		switch(category) {
		case "지점번호" :
			storeInfo.setStore_no(keyword);
			break;
		case "지점명" :
			storeInfo.setStore_name(keyword);
			break;
		case "시도명" :
			storeInfo.setLoc_l_name(keyword);
			break;
		case "구군명" :
			storeInfo.setLoc_m_name(keyword);
			break;
		case "법정동명" :
			storeInfo.setLoc_s_name(keyword);
			break;
		}
		
		ArrayList<Store> list = (ArrayList<Store>) storeService.searchStoreList(storeInfo);
		
		mv.addObject("slist", list);
		mv.setViewName("admin/cvsmanager/storeList");
		return mv;
	}

	/** 지점 삭제 */
	@RequestMapping(value="cvsstoreDelete.do", method = RequestMethod.GET)
	public ModelAndView DeleteStore(HttpSession session, HttpServletRequest request, ModelAndView mv) {
		User user = (User) session.getAttribute("user");
		
		Store store = new Store();
		store.setBrand_no(user.getBrand_no());
		store.setStore_no(request.getParameter("store_no"));
		
		storeService.DeleteStore(store);
		
		ArrayList<Store> list = (ArrayList<Store>) storeService.selectStoreList(user.getBrand_no());
		mv.addObject("slist", list);
		mv.setViewName("admin/cvsmanager/storeList");
		
		return mv;
	}
	
	
	/* 사이트 관리자 */

	/** 편의점별 방문자 수 통계 **/
	public ModelAndView cvsJoinCount(ModelAndView modelAndView) {
		int brand_no=0;
		Map map = storeService.cvsJoinCount();
		return null;
	}
}
