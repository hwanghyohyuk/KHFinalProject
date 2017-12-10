package com.kh.everycvs.store.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

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
	
	/* 지점관리자 */

	// 지점 조회 : 모든 지점을 조회
	public ModelAndView selectStoreList(HttpServletRequest request) {
		return null;
	}

	// 지점 검색 : 입력한 키워드와 필터링으로 지점을 검색
	// 필터링 : 지점명/주소
	public ModelAndView searchStoreList(HttpServletRequest request) {
		return null;
	}

	// 지점 삭제
	public String DeleteStore(HttpServletRequest request) {
		return null;
	}

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
	public String cvsStoreList() {
		return "admin/cvsmanager/storeList";
	}
	
	/* 사이트 관리자 */

	/** 편의점별 방문자 수 통계 **/
	public ModelAndView cvsJoinCount(ModelAndView modelAndView) {
		int brand_no=0;
		Map map = storeService.cvsJoinCount();
		return null;
	}
}
