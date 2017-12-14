package com.kh.everycvs.purchase.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Purchase;
import com.kh.everycvs.purchase.model.service.PurchaseService;


@Controller
public class PurchaseController {
	
	@Autowired
	private PurchaseService purchaseService;
	
	// 판매내역 조회 : 해당 지점의 사용자의 구매내역을 전체 조회
	public ModelAndView selectPurchaseList(HttpServletRequest request) {
		return null;
	}
	
	// 판매내역 조회 : 해당 지점의 사용자 구매내역을 상세조회
	public ModelAndView selectPurchaseOne(HttpServletRequest request) {
		return null;
	}
	
	// 잔고 금액 증가 : 사용자가 상품을 구매 시 결제되는 금액만큼 증가
	public String increaseMoney(HttpServletRequest request) {
		return null;
	}
	
	// 잔고 금액 감소 : 사용자가 상품을 구매 시 사용한 포인트만큼 감소
	public String decreaseMoney(HttpServletRequest request) {
		return null;
	}
	
	
	//사용자 구매 영역
	//사용자 잔고 금액 감소 : 사용자가 상품을 잔고로 결제 시 차감, 포인트 자동적립
	public String userDecreMoney(HttpServletRequest request) {
		//입력받은 금액만큼 잔고에서 차감후 리턴
		return null;
	}
	
	//포인트 감소 : 포인트로 결제할 시 포인트 차감
	public String userDecrePoint(HttpServletRequest request) {
		//입력받은 금액만큼 잔고의 포인트를 차감 후 리턴
		return null;
	}
	
	//전체거래내역 조회 : 3개월, 1개월, 1주일 단위로 조회(해당 리스트 목록조회)
	@RequestMapping(value="purchaseList.do", method=RequestMethod.POST)
	@ResponseBody
	public List<Map<String, Object>> purchaseList(ModelAndView mv, HttpServletRequest request, 
			HttpServletResponse response,
			Map<String, Object> map, Purchase purchase,
			@RequestParam (value="month", required=false) String month){
		response.setContentType("text/html; charset=utf-8");
		
		map.put("month", month);
		map.put("purchase", purchase);
		
		//구매내역 조회를 요청하면 가지고 있는 구매내역 리스트를 리턴함
		List<Map<String, Object>> list =purchaseService.purchaseList(map);
		
		mv.addObject("list", list);
		System.out.println(list);
		System.out.println(month);
		//mv.setViewName("jsonView");
		return list;
	}
	
	/*사이트관리자*/
	/**월간 구매 이용 횟수**/
	public ModelAndView monthlyPurchaseCount(ModelAndView modelAndView){
		int purchaseCount = purchaseService.monthlyPurchaseCount();
		return modelAndView;
	}

}
