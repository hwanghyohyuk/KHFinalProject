package com.kh.everycvs.purchase.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Gifticon;
import com.kh.everycvs.common.model.vo.Purchase;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.gifticon.model.service.GifticonService;
import com.kh.everycvs.purchase.model.service.PurchaseService;


@Controller
public class PurchaseController {
	
	@Autowired
	private PurchaseService purchaseService;
	
	@Autowired GifticonService gifticonService;

	// 판매내역 조회 : 해당 지점의 사용자의 구매내역을 전체 조회
	public ModelAndView selectPurchaseList(HttpServletRequest request) {
		return null;
	}
	
	// 판매내역 조회 : 해당 지점의 사용자 구매내역을 상세조회
	public ModelAndView selectPurchaseOne(HttpServletRequest request) {
		return null;
	}
	
	//사용자 구매 영역
	//사용자 잔고 금액 감소 : 사용자가 상품을 잔고로 결제 시 차감, 포인트 자동적립
	@RequestMapping("/page/userDecreMoney.do")
	public ModelAndView userDecreMoney(ModelAndView mv,
									   HttpSession session,
									   Purchase purchase,
									   @RequestParam ("price") int price,
									   @RequestParam ("cash") String cash,
									   @RequestParam ("user_no") String user_no,
									   @RequestParam ("point") String point,
									   @RequestParam ("store_product_no") int store_product_no,
									   @RequestParam ("purchase_quantity") int purchase_quantity,
									   @RequestParam ("calculated_price") int calculated_price,
									   @RequestParam ("using_point") int using_point,
									   @RequestParam ("store_no") int store_no
									  ) {

		//입력받은 금액만큼 잔고에서 차감후 리턴
		System.out.println("결제하기 전 cash : " + cash);
		System.out.println("point : " + point);
		System.out.println("store_no : " + store_no);
		
		int c = Integer.parseInt(cash);
		int uno = Integer.parseInt(user_no);
		int p = Integer.parseInt(point);
		
		int cprice = (price * purchase_quantity);
		int addPoint = (int) (cprice * 0.01);
		
		Gifticon gifticon = new Gifticon();
		
		int intNum = (int)(Math.random() * 9999999) + 1000000;
		String result = String.valueOf(intNum);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("price", cprice);
		map.put("cash", c);
		map.put("user_no", uno);
		map.put("point", p);
		map.put("addPoint", addPoint);
		map.put("store_product_no", store_product_no);
		map.put("purchase_quantity", purchase_quantity);
		map.put("calculated_price", cprice);
		map.put("using_point", using_point);
		map.put("accumulate_point", addPoint);
		map.put("barcode_img_name", result);
		map.put("store_no", store_no);
		
		//구매 시 작동하는 기능들을 service로 보냄
		int resultCash = purchaseService.userDecreMoney(map); //잔고결제
		int resultPoint = purchaseService.userIncrePoint(map); //포인트결제
		int insertPurchaseList = purchaseService.userInsertPurchaseList(map); //구매내역 생성
		int insertGifticon = gifticonService.createGifticon(map); //기프티콘 생성
		int adminResultCash = purchaseService.increaseMoney(map);
		
		 User user = (User) session.getAttribute("user");
		 user.setCash(c - cprice);
		 user.setPoint(p + addPoint);
		 
		 session.setAttribute("user", user);
		 
		mv.addObject("resultCash", resultCash);
		mv.addObject("resultPoint", resultPoint);
		mv.addObject("insertPurchaseList", insertPurchaseList);
		mv.addObject("insertGifticon", insertGifticon);
		mv.addObject("barcode_img_name", result);
		mv.addObject("adminResultCash", adminResultCash);
		mv.addObject("price", cprice);
		
		mv.setViewName("redirect:/page/splist.do");
		
		/*System.out.println("결제 후 : " + user.getCash());
		System.out.println("결제 후 포인트 증가 : " + user.getPoint());
		System.out.println(purchase);*/
		System.out.println("cprice : " + cprice);
		return mv;
	}
	
	//포인트 감소 : 포인트로 결제할 시 포인트 차감
	@RequestMapping("/page/userDecrePoint.do")
	public ModelAndView userDecrePoint( @RequestParam ("price") int price,
										@RequestParam ("point") String point,
										@RequestParam ("user_no") String user_no,
										@RequestParam ("store_product_no") int store_product_no,
										@RequestParam ("purchase_quantity") int purchase_quantity,
										@RequestParam ("calculated_price") int calculated_price,
										@RequestParam ("store_no") int store_no,
										ModelAndView mv,
										HttpSession session) {
		int dp = Integer.parseInt(point);
		int uno = Integer.parseInt(user_no);
		
		int usingPoint = (price * purchase_quantity);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("point", dp);
		map.put("user_no", uno);
		map.put("price", price);
		map.put("store_product_no", store_product_no);
		map.put("purchase_quantity", purchase_quantity);
		map.put("calculated_price", usingPoint);
		map.put("using_point", usingPoint);
		map.put("accumulate_point", 0);
		map.put("store_no", store_no);
		
		int result = purchaseService.userDecrePoint(map);
		int insertPurchaseList = purchaseService.userInsertPurchaseList(map);
		int insertGifticon = gifticonService.createGifticon(map); //기프티콘 생성
		int adminResultCash = purchaseService.increaseMoney(map);
		
		 User user = (User) session.getAttribute("user");
		 user.setPoint(dp - usingPoint);
		 session.setAttribute("user", user);
		 
		mv.addObject("result", result);
		mv.addObject("insertPurchaseList", insertPurchaseList);
		mv.addObject("insertGifticon", insertGifticon);
		mv.addObject("adminResultCash", adminResultCash);
		
		mv.setViewName("redirect:/page/splist.do");
		
		System.out.println("포인트 결제 결과 : " + user.getPoint());
		return mv;
	}
	
	//전체거래내역 조회 : 3개월, 1개월, 1주일 단위로 조회(해당 리스트 목록조회)
	@SuppressWarnings("unchecked")
	@RequestMapping(value="purchaseList.do", method=RequestMethod.POST)
	@ResponseBody
	public ModelAndView purchaseList(ModelAndView mv,
			                        @RequestParam (value="month", required=false,defaultValue="0") String month, 
			                        HttpSession session){
		
		User user = (User)session.getAttribute("user");
		//구매내역 조회를 요청하면 가지고 있는 구매내역 리스트를 리턴함
		ArrayList<Purchase> list =purchaseService.purchaseList(user.getUser_no(),month);

		JSONArray jplist = new JSONArray();
		for(Purchase p : list) {
			JSONObject jp = new JSONObject();			
			jp.put("purchase_no",p.getPurchase_no());
			jp.put("store_product_no",p.getStore_product_no());
			jp.put("store_no",p.getStore_no());
			jp.put("store_name",p.getStore_name());
			jp.put("product_no",p.getProduct_no());
			jp.put("product_name",p.getProduct_name());
			jp.put("purchase_quantity",p.getPurchase_quantity());
			jp.put("calculated_price",p.getCalculated_price());
			jp.put("using_point",p.getUsing_point());
			jp.put("accumulate_point",p.getAccumulate_point());
			jp.put("purchase_date",p.getPurchase_date().toString());
			jplist.add(jp);
		}
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("plist", jplist);
		mv.addAllObjects(map);
		mv.setViewName("jsonView");
		return mv;
	}
	
}
