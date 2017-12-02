package com.kh.everycvs.storeproduct.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.storeproduct.model.service.StoreProductService;
import com.kh.everycvs.common.model.vo.StoreProduct;

@Controller
public class StoreProductController {
	
	@Autowired
	private StoreProductService sproductService;
	
	// 지점 상품 조회
	@RequestMapping(value="/splist.do")
	public ModelAndView selectList(String page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		int currentPage = 1;
		int limit = 10;
		
		int listCount = sproductService.getListCount(); 
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>)sproductService.selectList(currentPage,limit);
		
		return mv;
	}
	
	// 지점 상품 검색 : 입력한 키워드와 필터링으로 지점상품을 검색
	// 필터링 : 상품명/상품코드
	public ModelAndView searchList(HttpServletRequest request) {
		return null;
	}
	
	@RequestMapping(value="/sprank.do",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView rankList(){
		ModelAndView mv = new ModelAndView(); 
		
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>)sproductService.rankList();
		
		return mv;
	}

	// 지점 상품 조회 : 선택한 상품을 상세조회
	@RequestMapping(value="/spdetail.do")
	public ModelAndView detailSproduct(int spnum, int page){
		ModelAndView mv = new ModelAndView();
		
		StoreProduct storeproduct = sproductService.detailSproduct(spnum);
		
		return mv;
	}
	
	@RequestMapping(value="/spwriteform.do")
	public ModelAndView writeFormSproduct(){
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("storeproduct/storeproductWriteForm"); 
		
		return mv;
	}
	
	// 지점 상품 추가 : 해당 상호 편의점의 전체 상품 목록에서 수량이 1이상인 상품들을 지점상품에 추가
	@RequestMapping(value="/spinsert.do", method=RequestMethod.POST)
	public ModelAndView insertSproduct(MultipartHttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView();
			
			StoreProduct sp = null;
			if(sproductService.insertSproduct(sp) > 0){
			}else{
			}
		
		return mv;
	}
	
	@RequestMapping(value="spfdown.do")
	public ModelAndView fileDownSproduct(HttpServletRequest request, HttpServletResponse response) throws IOException{
		ModelAndView mv = new ModelAndView();
		return mv;
	}
	
	// 지점 상품 삭제
	@RequestMapping(value="spdelete.do")
	public ModelAndView deleteSproduct(int spnum){
		ModelAndView mv = new ModelAndView();
		
		int result = sproductService.deleteSproduct(spnum);
		
		return mv;
	}
	
	// 지점 상품 수정 : 변경사항(제조일/수량/이벤트)
	@RequestMapping(value="spupdate.do", method=RequestMethod.POST)
	public ModelAndView updateSproduct(MultipartHttpServletRequest request) throws IOException{
		ModelAndView mv = new ModelAndView();
		
		StoreProduct sp = null;
		if(sproductService.updateSproduct(sp) > 0){
		}else{
		}
		
		return mv;
	}
	
	@RequestMapping(value="spupview.do")
	public ModelAndView updateViewSproduct(int spnum, int page){
		ModelAndView mv = new ModelAndView();
		
		StoreProduct storeproduct = sproductService.detailSproduct(spnum);
		
		return mv;
	}
}
