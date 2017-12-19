package com.kh.everycvs.storeproduct.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.storeproduct.model.service.StoreProductService;
import com.kh.everycvs.common.model.vo.Store;
import com.kh.everycvs.common.model.vo.StoreProduct;
import com.kh.everycvs.product.model.service.ProductService;

@Controller
public class StoreProductController {

	@Autowired
	private StoreProductService sproductService;

	@Autowired
	private ProductService productService;
	
	//storeListView 전체보기, 검색하기
	@RequestMapping(value = "/page/splist.do")
	public ModelAndView selectList(String page, @RequestParam(value="keyword", required=false, defaultValue="") String keyword, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String store_no = ((Store)session.getAttribute("store")).getStore_no();
		
		int currentPage = 1;
		int limit = 8;

		if (page != null)
			currentPage = Integer.parseInt(page);

		int listCount = sproductService.getListCount(keyword,store_no);

		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>) sproductService.selectList(currentPage, limit, keyword,store_no);

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
	
	//storeRankView 전체보기
	@RequestMapping(value = "/page/sprank.do")
	public ModelAndView rankSproduct(HttpSession session, ModelAndView mv) {
		Store store = (Store)session.getAttribute("store");
			
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>)sproductService.top3Sproduct(store.getStore_no());
		ArrayList<StoreProduct> list2 = (ArrayList<StoreProduct>)sproductService.new3Sproduct(store.getStore_no());
		ArrayList<StoreProduct> list3 = (ArrayList<StoreProduct>) sproductService.dcSproduct(store.getStore_no());
		ArrayList<StoreProduct> list4 = (ArrayList<StoreProduct>) sproductService.expSproduct(store.getStore_no());
			
		mv.addObject("list",list);
		mv.addObject("list2",list2);
		mv.addObject("list3",list3);
		mv.addObject("list4",list4);
		mv.addObject("count", list.size());
		mv.setViewName("storemain/storeRankView");	
		
		return mv;
	}
	
	//storeRankView 인기상품
	@RequestMapping(value="/sptop3.do",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView top3Sproduct(HttpSession session, ModelAndView mv){
		Store store = (Store)session.getAttribute("store");
		
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>)sproductService.top3Sproduct(store.getStore_no());
		
		mv.addObject("list",list);
		mv.setViewName("storemain/storeRankView");
		
		return mv;
	}
	
	//storeRankView 신상품
	@RequestMapping(value="/spnew3.do",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView new3Sproduct(HttpSession session, ModelAndView mv){

		Store store = (Store)session.getAttribute("store");
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>)sproductService.new3Sproduct(store.getStore_no());
		
		mv.addObject("list2",list);
		mv.setViewName("storemain/storeRankView");
		
		return mv;
	}
	
	//storeRankView 할인상품
	@RequestMapping(value = "/spdc.do")
	public ModelAndView dcSproduct(HttpSession session, ModelAndView mv) {

		Store store = (Store)session.getAttribute("store");
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>) sproductService.dcSproduct(store.getStore_no());

		mv.addObject("list3",list);
		mv.setViewName("storemain/storeRankView");

		return mv;
	}
	
	//storeRankView 유통기한 임박상품
	@RequestMapping(value = "/spexp.do")
	public ModelAndView expSproduct(HttpSession session, ModelAndView mv) {

		Store store = (Store)session.getAttribute("store");
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>) sproductService.expSproduct(store.getStore_no());

		mv.addObject("list4",list);
		mv.setViewName("storemain/storeRankView");

		return mv;
	}
	
	//storeProduct 전체보기, 검색하기
	@RequestMapping(value = "/spmlist.do")
	public ModelAndView listSpmanager(String page, @RequestParam(value="keyword", required=false, defaultValue="") String keyword, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		String store_no = ((Store)session.getAttribute("store")).getStore_no();
		
		int currentPage = 1;
		int limit = 10;

		if (page != null)
			currentPage = Integer.parseInt(page);

		int listCount = sproductService.getListCount(keyword,store_no);

		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>) sproductService.listSpmanager(currentPage, limit,keyword,store_no);

		int maxPage = (int) ((double) listCount / limit + 0.9);

		int startPage = ((int) ((double) currentPage / limit + 0.9) - 1) * limit + 1;

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
			mv.setViewName("admin/storemanager/storeProduct");
		} else {
			mv.addObject("message", "게시글 조회 실패");
		}

		return mv;
	}
	
	//storeProduct 삭제하기
	@RequestMapping(value="/spmdelete.do")
	public ModelAndView deleteSpmanager(@RequestParam("spnum") int spnum,@RequestParam("toggle") String toggle){
		ModelAndView mv = new ModelAndView();
		if(toggle.equals("N")){
			toggle="Y";
		}else{
			toggle="N";
		}
		sproductService.deleteSpmanager(spnum,toggle);
		
		mv.setViewName("redirect:/spmlist.do?page=1");
		
		return mv;
	}
	
	//storeProduct 수정하기
	@RequestMapping(value="/spmupdate.do")
	public ModelAndView updateSpmanager(ModelAndView mv, 
			 @RequestParam("page") int currentPage,
			 @RequestParam("spnum") int spnum,
			 @RequestParam("mdate") Date manufacturedate,
			 @RequestParam("quantity") int quantity) {
		
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("spnum", spnum);
		map.put("manufacturedate", manufacturedate);
		map.put("quantity", quantity);
		
		if(sproductService.updateSpmanager(map) > 0){
			mv.setViewName("redirect:/spmlist.do?page="+currentPage);
		}else{
			mv.addObject("message", "수정 실패!");
		}
		
		return mv;
	}
	
	//allProduct 전체보기, 검색하기
	@RequestMapping(value = "/apmlist.do")
	public ModelAndView listApmanager(String page, @RequestParam(value="keyword", required=false, defaultValue="") String keyword, HttpSession session) {
		ModelAndView mv = new ModelAndView();

		int brand_no = ((Store)session.getAttribute("store")).getBrand_no();
		
		int currentPage = 1;
		int limit = 10;

		if (page != null)
			currentPage = Integer.parseInt(page);

		int listCount = productService.getListCount(keyword,brand_no);

		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>) productService.listApmanager(currentPage, limit,keyword,brand_no);

		int maxPage = (int) ((double) listCount / limit + 0.9);

		int startPage = ((int) ((double) currentPage / limit + 0.9) - 1) * limit + 1;

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
			mv.setViewName("admin/storemanager/allProduct");
		} else {
			mv.addObject("message", "게시글 조회 실패");
		}
		
		return mv;
	}
	
	//allProduct 상품추가
	@RequestMapping(value="/apminsert.do")
	public ModelAndView insertApmanager(ModelAndView mv,
			 @RequestParam("pnum") int pnum,
			 @RequestParam("mdate") Date manufacturedate,
			 @RequestParam("quantity") int quantity) {

		Map<String, Object> map = new HashMap<String,Object>();
		map.put("pnum", pnum);
		map.put("manufacturedate", manufacturedate);
		map.put("quantity", quantity);
		
		if(productService.insertApmanager(map) > 0){
			mv.setViewName("redirect:/spmlist.do?page=1");
		}else{
			mv.addObject("message", "등록 실패!");
		}
		
		return mv;
	}
	
}
