package com.kh.everycvs.storeproduct.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
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
	
	/*사용자*/
	/**storeListView 전체보기, 검색하기**/
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
	
	/*사용자*/
	/**storeRankView 전체보기**/
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
	
	/*사용자*/
	/**storeRankView 인기상품**/
	@RequestMapping(value="/sptop3.do",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView top3Sproduct(HttpSession session, ModelAndView mv){
		Store store = (Store)session.getAttribute("store");
		
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>)sproductService.top3Sproduct(store.getStore_no());
		
		mv.addObject("list",list);
		mv.setViewName("storemain/storeRankView");
		
		return mv;
	}
	
	/*사용자*/
	/**storeRankView 신상품**/
	@RequestMapping(value="/spnew3.do",method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView new3Sproduct(HttpSession session, ModelAndView mv){

		Store store = (Store)session.getAttribute("store");
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>)sproductService.new3Sproduct(store.getStore_no());
		
		mv.addObject("list2",list);
		mv.setViewName("storemain/storeRankView");
		
		return mv;
	}
	
	/*사용자*/
	/**storeRankView 할인상품**/
	@RequestMapping(value = "/spdc.do")
	public ModelAndView dcSproduct(HttpSession session, ModelAndView mv) {

		Store store = (Store)session.getAttribute("store");
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>) sproductService.dcSproduct(store.getStore_no());

		mv.addObject("list3",list);
		mv.setViewName("storemain/storeRankView");

		return mv;
	}
	
	/*사용자*/
	/**storeRankView 유통기한 임박상품**/
	@RequestMapping(value = "/spexp.do")
	public ModelAndView expSproduct(HttpSession session, ModelAndView mv) {

		Store store = (Store)session.getAttribute("store");
		ArrayList<StoreProduct> list = (ArrayList<StoreProduct>) sproductService.expSproduct(store.getStore_no());

		mv.addObject("list4",list);
		mv.setViewName("storemain/storeRankView");

		return mv;
	}
	
	/*지점관리자*/
	/**storeProduct 전체보기, 검색하기**/
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
	
	/*지점관리자*/
	/**storeProduct 삭제하기**/
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
	
	/*지점관리자*/
	/**storeProduct 수정하기**/
	@RequestMapping(value="/ajax/spmupdate.do")
	@ResponseBody
	public int updateSpmanager( @RequestParam("spno") int spno,
			 @RequestParam("mdate") Date mdate,
			 @RequestParam("quantity") int quantity) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("spno", spno);
		map.put("mdate", mdate);
		map.put("quantity", quantity);
		int result = sproductService.updateSpmanager(map);
		
		return result;
	}
	
	/*지점관리자*/
	/**allProduct 전체보기, 검색하기**/
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
	
	/*지점관리자*/
	/**allProduct 상품추가**/
	@RequestMapping(value="/apminsert.do")
	@ResponseBody
	public int insertApmanager(@RequestParam("sno") String sno, @RequestParam("page") int currentPage,@RequestParam("jlists")String jlists ) {
		List<StoreProduct> spList = new ArrayList<StoreProduct>();
		 JSONParser jsonParser = new JSONParser();
         //JSON데이터를 넣어 JSON Object 로 만들어 준다.
		try {
			JSONArray plist = (JSONArray) jsonParser.parse(jlists);
			for(int i=0; i<plist.size(); i++){
				 JSONObject p = (JSONObject) plist.get(i);
				 int productNo = Integer.parseInt((String)p.get("product_no"));
				 Date manufactureDate = Date.valueOf((String)p.get("manufacture_date"));
				 int quantity = Integer.parseInt((String)p.get("quantity"));
                 StoreProduct sp = new StoreProduct(sno,productNo,manufactureDate,quantity);
                 spList.add(sp);
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
        int result = sproductService.insertApmanager(spList); 
        return result;
	}
	
}
