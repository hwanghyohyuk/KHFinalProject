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
	
	@RequestMapping(value="/splist.do")
	public ModelAndView selectList(String page, HttpServletRequest request){
		ModelAndView mv = new ModelAndView();
		
		int currentPage = 1;
		int limit = 10;
		
		int listCount = sproductService.getListCount(); 
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>)sproductService.selectList(currentPage,limit);
		
		return mv;
	}
	
	@RequestMapping(value="/sprank.do",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView rankList(){
		ModelAndView mv = new ModelAndView(); 
		
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>)sproductService.rankList();
		
		return mv;
	}

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
	
	@RequestMapping(value="spdelete.do")
	public ModelAndView deleteSproduct(int spnum){
		ModelAndView mv = new ModelAndView();
		
		int result = sproductService.deleteSproduct(spnum);
		
		return mv;
	}
	
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
