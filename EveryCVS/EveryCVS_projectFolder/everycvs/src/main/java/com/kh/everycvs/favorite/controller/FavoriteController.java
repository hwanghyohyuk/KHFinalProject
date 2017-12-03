package com.kh.everycvs.favorite.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.favorite.model.service.FavoriteService;

@Controller("FavoriteController")
public class FavoriteController {

	@Autowired
	private FavoriteService favoriteService;
	
	//관심상품 목록 조회 : 마이페이지에서 관심상품 목록을 조회함
	public ModelAndView favoriteList(HttpServletRequest request) {
		return null;
	}
	
	//관심상품 등록 : 해당상품을 클릭하면 관심상품등록이 실행
	public ModelAndView favoriteInsert(HttpServletRequest request) {
		return null;
	}
	
	//관심상품 삭제 : 등록되어있는 관심상품을 해제하면 목록에서 삭제
	public void favoriteDelete() {
		
	}
	
	
}
