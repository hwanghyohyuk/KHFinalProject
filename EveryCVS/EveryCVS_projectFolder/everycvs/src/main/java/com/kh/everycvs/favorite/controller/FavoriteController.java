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
		setFavoriteList(user_no, mv);
		return mv;
	}
	
	//관심상품 검색
	@RequestMapping("favoriteSearch.do")
	public ModelAndView favoriteSearch(
			HttpSession session, HttpServletRequest request, ModelAndView mv){
		int user_no = ((User)session.getAttribute("user")).getUser_no();
		String category = request.getParameter("category");
		String keyword = "%" + request.getParameter("keyword") + "%";
		
		Favorite favorite = new Favorite();
		favorite.setUser_no(user_no);
		
		switch(category) {
		case "상호명" :
			favorite.setBrand_name(keyword);
			break;
		case "지점명" :
			favorite.setStore_name(keyword);
			break;
		case "상품명" :
			favorite.setProduct_name(keyword);
			break;
		}
		
		ArrayList<Favorite> flist = (ArrayList<Favorite>)favoriteService.favoriteSearch(favorite);
		mv.addObject("flist", flist);
		mv.setViewName("user/mypage/favoritePage");
		return mv;
	}
	
	//관심상품 등록 : 해당상품을 클릭하면 관심상품등록이 실행
	@RequestMapping("favoriteInsert.do")
	public ModelAndView favoriteInsert(
			HttpSession session, HttpServletRequest request, ModelAndView mv) {
		int user_no = ((User)session.getAttribute("user")).getUser_no();
		int product_no = Integer.parseInt(request.getParameter("product_no"));
		String store_no = request.getParameter("store_no");
		
		Favorite favorite = new Favorite();
		favorite.setUser_no(user_no);
		favorite.setProduct_no(product_no);
		favorite.setStore_no(store_no);
		System.out.println(user_no + ", " + product_no + ", " + store_no);
		if(favoriteService.favoriteSelectOne(favorite) != null){	// 이미 있으면
			System.out.println("이미 있음!");
		}else{
			favoriteService.favoriteInsert(favorite);
			setFavoriteList(user_no, mv);
		}
		return mv;
	}
	
	//관심상품 삭제 : 등록되어있는 관심상품을 해제하면 목록에서 삭제
	@RequestMapping("favoriteDelete.do")
	public ModelAndView favoriteDelete(
			HttpSession session, HttpServletRequest request, ModelAndView mv) {
		int user_no = ((User)session.getAttribute("user")).getUser_no();
		int product_no = Integer.parseInt(request.getParameter("product_no"));
		String store_no = request.getParameter("store_no");
		
		Favorite favorite = new Favorite();
		favorite.setUser_no(user_no);
		favorite.setProduct_no(product_no);
		favorite.setStore_no(store_no);
		
		favoriteService.favoriteDelete(favorite);
		
		setFavoriteList(user_no, mv);
		return mv;
	}
	
	// 관심상품 리스트 조회 후 리스트와 뷰네임을 set하는 메소드
	public ModelAndView setFavoriteList(int user_no, ModelAndView mv){
		ArrayList<Favorite> flist = (ArrayList<Favorite>)favoriteService.favoriteList(user_no);
		mv.addObject("flist", flist);
		mv.setViewName("user/mypage/favoritePage");
		return mv;
	}
	
	
}
