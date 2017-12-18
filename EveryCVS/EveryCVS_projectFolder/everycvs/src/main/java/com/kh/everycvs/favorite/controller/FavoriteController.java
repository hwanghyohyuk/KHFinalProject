package com.kh.everycvs.favorite.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.User;
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
	
	//관심상품 리스트
	@RequestMapping("favoriteList.do")
	public ModelAndView favoriteList(HttpSession session, ModelAndView mv) {
		int user_no = ((User)session.getAttribute("user")).getUser_no();
		System.out.println("Controller : " + user_no);
		setFavoriteList(user_no, mv);
		return mv;
	}
	
	//관심상품 등록 : 해당상품을 클릭하면 관심상품등록이 실행
	public ModelAndView favoriteInsert(HttpServletRequest request) {
		return null;
	}
	
	//관심상품 삭제 : 등록되어있는 관심상품을 해제하면 목록에서 삭제
	public void favoriteDelete() {
		
	}
	
	// 관심상품 리스트 조회 후 리스트와 뷰네임을 set하는 메소드
	public ModelAndView setFavoriteList(int user_no, ModelAndView mv){
		//지점상품 상세보기 모달 리스트 가져오기
		System.out.println("setFavoriteList() 실행됨!");
		ArrayList<Favorite> flist = (ArrayList<Favorite>)favoriteService.favoriteList(user_no);
		for(Favorite f : flist){
			System.out.println(f.getProduct_name());
		}
		
		mv.addObject("flist", flist);
		mv.setViewName("user/mypage/favoritePage");
		return mv;
	}
	
	
}
