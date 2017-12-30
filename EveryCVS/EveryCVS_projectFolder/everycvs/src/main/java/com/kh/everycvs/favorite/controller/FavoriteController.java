package com.kh.everycvs.favorite.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.common.model.vo.Favorite;
import com.kh.everycvs.favorite.model.service.FavoriteService;

@Controller("FavoriteController")
public class FavoriteController {

	@Autowired
	private FavoriteService favoriteService;

	// 관심상품 리스트
	@RequestMapping("/user/favoriteList.do")
	public ModelAndView favoriteList(ModelAndView mv,HttpSession session,
			@RequestParam(value="category",required=false,defaultValue="0")int category,
			@RequestParam(value="keyword",required=false,defaultValue="")String keyword) {
		
		int user_no = ((User) session.getAttribute("user")).getUser_no();
		setMV(mv, user_no, category, keyword);
		
		return mv;
	}

	// 관심상품 등록 : 해당상품을 클릭하면 관심상품등록이 실행
	@RequestMapping("favoriteInsert.do")
	public ModelAndView favoriteInsert(
			HttpSession session, HttpServletRequest request, ModelAndView mv,
			@RequestParam(value="category",required=false,defaultValue="0")int category,
			@RequestParam(value="keyword",required=false,defaultValue="")String keyword) {
		int user_no = ((User) session.getAttribute("user")).getUser_no();
		int product_no = Integer.parseInt(request.getParameter("product_no"));
		String store_no = request.getParameter("store_no");

		Favorite favorite = new Favorite();
		favorite.setUser_no(user_no);
		favorite.setProduct_no(product_no);
		favorite.setStore_no(store_no);
		System.out.println(user_no + ", " + product_no + ", " + store_no);
		if (favoriteService.favoriteSelectOne(favorite) != null) { // 이미 있으면
		} else {
			favoriteService.favoriteInsert(favorite);
		}
		
		setMV(mv, user_no, category, keyword);
		return mv;
	}

	// 관심상품 삭제 : 등록되어있는 관심상품을 해제하면 목록에서 삭제
	@RequestMapping("favoriteDelete.do")
	public ModelAndView favoriteDelete(
			HttpSession session, HttpServletRequest request, ModelAndView mv,
			@RequestParam(value="category",required=false,defaultValue="0")int category,
			@RequestParam(value="keyword",required=false,defaultValue="")String keyword) {
		int user_no = ((User) session.getAttribute("user")).getUser_no();
		int product_no = Integer.parseInt(request.getParameter("product_no"));
		String store_no = request.getParameter("store_no");

		Favorite favorite = new Favorite();
		favorite.setUser_no(user_no);
		favorite.setProduct_no(product_no);
		favorite.setStore_no(store_no);

		favoriteService.favoriteDelete(favorite);

		setMV(mv, user_no, category, keyword);
		return mv;
	}

	// ModelAndView에 리스트, 뷰 네임 SET 해주는 메소드
	private ModelAndView setMV(ModelAndView mv, int user_no, int category, String keyword) {
		
		List<Favorite> flist = favoriteService.favoriteList(user_no,category,keyword);
		mv.addObject("flist", flist);
		mv.setViewName("user/mypage/favoritePage");
		
		return mv;
	}
}
