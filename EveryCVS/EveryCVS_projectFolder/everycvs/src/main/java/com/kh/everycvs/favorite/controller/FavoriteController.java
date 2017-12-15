package com.kh.everycvs.favorite.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Favorite;
import com.kh.everycvs.common.model.vo.StoreProduct;
import com.kh.everycvs.favorite.model.service.FavoriteService;
import com.kh.everycvs.storeproduct.model.service.StoreProductService;

@Controller("FavoriteController")
public class FavoriteController {

	@Autowired
	private FavoriteService favoriteService;
	@Autowired
	private StoreProductService sproductService;
	
	//관심상품 목록 조회 : 마이페이지에서 관심상품 목록을 조회함
	@RequestMapping("favoriteList.do")
	public ModelAndView favoriteList(ModelAndView mv) {
		ArrayList<Favorite> flist = (ArrayList<Favorite>)favoriteService.favoriteList();
		mv.addObject("flist", flist);
		System.out.println(flist);
		return mv;
	}
	
	//관심상품 등록 : 해당상품을 클릭하면 관심상품등록이 실행
	public ModelAndView favoriteInsert(HttpServletRequest request) {
		return null;
	}
	
	//관심상품 삭제 : 등록되어있는 관심상품을 해제하면 목록에서 삭제
	public void favoriteDelete() {
		
	}
	
	//관심상품 페이지 이동
	@RequestMapping("favoritePage.do")
	public ModelAndView favoritePage(ModelAndView mv){
		
		ArrayList<Favorite> flist = (ArrayList<Favorite>) favoriteService.favoriteList();
		//지점상품 상세보기 모달 리스트 가져오기
		mv.addObject("flist", flist);
		mv.setViewName("user/mypage/favoritePage"); 
		return mv;
	}
	
	
}
