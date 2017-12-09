package com.kh.everycvs.storeproduct.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.storeproduct.model.service.StoreProductService;
import com.kh.everycvs.common.model.vo.StoreProduct;

@Controller
public class StoreProductController {
	
	@Autowired
	private StoreProductService sproductService;
	
	//테스트중
	@RequestMapping(value="/test.do")
	public ModelAndView test(String page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("storemain/storeListView");
		return mv;
	}
	
	@RequestMapping(value="/test2.do")
	public ModelAndView test2(String page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("storemain/storeRankView");
		return mv;
	}
	
	@RequestMapping(value="/test3.do")
	public ModelAndView test3(String page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("admin/storemanager/storeProduct");
		return mv;
	}
	
	@RequestMapping(value="/test4.do")
	public ModelAndView test4(String page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView("admin/storemanager/allProduct");
		return mv;
	} //테스트중
	
	//지점상품 전체페이지 전체보기
	@RequestMapping(value="/splist.do")
	public ModelAndView selectList(String page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		int currentPage = 1;
		int limit = 8;
				
		if(page != null)
			currentPage = Integer.parseInt(page);
				
		int listCount = sproductService.getListCount(); 
				
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>)sproductService.selectList(currentPage,limit);
				
		int maxPage = (int)((double)listCount / limit + 0.92);
				
		int startPage = ((int)((double)currentPage / limit + 0.92) - 1) * limit + 1;
				
		int endPage = startPage + limit - 1;
		if(maxPage < endPage)
			endPage = maxPage;
				
		if(list != null){
			mv.addObject("list", list);
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("listCount", listCount);
			mv.setViewName("storemain/storeListView");
		}else{
			mv.addObject("message", "게시글 조회 실패");
		}
		
		return mv;
		
	}
	
	//지점상품 전체페이지 검색하기
	@RequestMapping(value="/spsearch.do")
	public ModelAndView searchSproduct(String page,@RequestParam("keyword") String keyword, HttpServletRequest request){
		
		ModelAndView mv = new ModelAndView();
		
		int currentPage = 1;
		int limit = 8;
				
		if(page != null)
			currentPage = Integer.parseInt(page);
				
		int listCount = sproductService.getListCount(); 
		
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>)sproductService.searchSproduct(currentPage,limit,keyword);
		
		int maxPage = (int)((double)listCount / limit + 0.92);
				
		int startPage = ((int)((double)currentPage / limit + 0.92) - 1) * limit + 1;
				
		int endPage = startPage + limit - 1;
		if(maxPage < endPage)
			endPage = maxPage;
		
		if(list != null){
			mv.addObject("list", list);
			mv.addObject("currentPage", currentPage);
			mv.addObject("maxPage", maxPage);
			mv.addObject("startPage", startPage);
			mv.addObject("endPage", endPage);
			mv.addObject("listCount", listCount);
			
			mv.setViewName("storemain/storeListView");
		}else{
			mv.addObject("message", "게시글 검색 실패");
		}
		
		return mv;
	}
	
	//지점상품 전체페이지 상세보기
	@RequestMapping(value="/spdetail.do")
	public ModelAndView detailSproduct(int spnum, int page){
		
		ModelAndView mv = new ModelAndView();
		
		StoreProduct storeproduct = sproductService.detailSproduct(spnum);
		
		if(storeproduct != null){
			mv.addObject("storeproduct", storeproduct);
			mv.addObject("currentPage",page);
			mv.setViewName("storemain/storeDetailView");
		}else{
			mv.addObject("message", "게시글 상세조회 실패");
		}
		
		return mv;
	}
	
}
