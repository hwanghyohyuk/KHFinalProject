package com.kh.everycvs.storeproduct.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.storeproduct.model.service.StoreProductService;
import com.kh.everycvs.common.model.vo.StoreProduct;

@Controller
public class StoreProductController {

	@Autowired
	private StoreProductService sproductService;

	// 지점상품 전체페이지 전체보기
	@RequestMapping(value = "/splist.do")
	public ModelAndView selectList(String page, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		int currentPage = 1;
		int limit = 8;

		if (page != null)
			currentPage = Integer.parseInt(page);

		int listCount = sproductService.getListCount();

		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>) sproductService.selectList(currentPage, limit);

		int maxPage = (int) ((double) listCount / limit + 0.92);

		int startPage = ((int) ((double) currentPage / limit + 0.92) - 1) * limit + 1;

		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
			endPage = maxPage;

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("storemain/storeListView");
		} else {
			mv.addObject("message", "게시글 조회 실패");
		}

		return mv;

	}

	// 지점상품 전체페이지 검색하기
	@RequestMapping(value = "/spsearch.do")
	public ModelAndView searchSproduct(String page, @RequestParam("keyword") String keyword,
			HttpServletRequest request) {

		ModelAndView mv = new ModelAndView();

		int currentPage = 1;
		int limit = 8;

		if (page != null)
			currentPage = Integer.parseInt(page);

		int listCount = sproductService.getListCount();

		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>)sproductService.searchSproduct(currentPage, limit,
				keyword);

		int maxPage = (int) ((double) listCount / limit + 0.92);

		int startPage = ((int) ((double) currentPage / limit + 0.92) - 1) * limit + 1;

		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
			endPage = maxPage;

		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("listCount", listCount);

			mv.setViewName("storemain/storeListView");
		} else {
			mv.addObject("message", "게시글 검색 실패");
		}

		return mv;
	}

	
	// 랭크뷰 전체보기
	@RequestMapping(value = "/sprank.do")
	public ModelAndView rankSproduct(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		
		
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>)sproductService.top3Sproduct();
		ArrayList<StoreProduct> list2 = (ArrayList<StoreProduct>)sproductService.new3Sproduct();
		ArrayList<StoreProduct> list3 = (ArrayList<StoreProduct>) sproductService.dcSproduct();
		
		mv.addObject("list",list);
		mv.addObject("list2",list2);
		mv.addObject("list3",list3);
		mv.setViewName("storemain/storeRankView");
		return mv;
	}
	
	//랭크뷰 top3
	@RequestMapping(value="/sptop3.do",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView top3Sproduct(){
		ModelAndView mv = new ModelAndView(); 
		
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>)sproductService.top3Sproduct();
		
		mv.addObject("list",list);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//랭크뷰 new3
	@RequestMapping(value="/spnew3.do",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView new3Sproduct(){
		ModelAndView mv = new ModelAndView(); 
		
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>)sproductService.new3Sproduct();
		
		mv.addObject("list2",list);
		mv.setViewName("jsonView");
		
		return mv;
	}
	
	//랭크뷰 할인상품
	@RequestMapping(value = "/spdc.do")
	public ModelAndView dcSproduct(String page, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();

		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>) sproductService.dcSproduct();

		mv.addObject("list3",list);
		mv.setViewName("jsonView");

		return mv;

	}
	
}
