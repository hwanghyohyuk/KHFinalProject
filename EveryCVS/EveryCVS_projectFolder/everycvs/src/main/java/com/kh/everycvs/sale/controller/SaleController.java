package com.kh.everycvs.sale.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.SaleProductKind;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.sale.model.service.SaleService;

@Controller
public class SaleController {

	@Autowired
	private SaleService saleService;
	
	/*지점관리자*/
	/*AJAX*/
	/**지점 상품 종류별 판매량**/
	public ModelAndView kindStoreSale(ModelAndView modelAndView){
		String store_no = "";
		Map map = saleService.kindStoreSale(store_no);
		return modelAndView;		
	}
	/** 판매수익 차트 **/
	public ModelAndView saleBenefit(ModelAndView modelAndView){
		String store_no = "";
		Map map = saleService.saleBenefit(store_no);
		return modelAndView;		
	}
	
	/**시간대 별 판매량**/
	public ModelAndView timeSale(ModelAndView modelAndView){
		String store_no = "";
		Map map = saleService.timeSale(store_no);
		return modelAndView;		
	}
	/**판매내역**/
	public ModelAndView saleRecode(ModelAndView modelAndView){
		String store_no = "";
		Map map = saleService.saleRecode(store_no);
		return modelAndView;		
	}
	
	/*편의점관리자*/
	/** 편의점 상품 종류별 판매량**/
	public void kindCvsSale(HttpSession session, ModelAndView mv){
		int brand_no = ((User)session.getAttribute("user")).getBrand_no();
		
		ArrayList<SaleProductKind> list = (ArrayList<SaleProductKind>) saleService.kindCvsSale(brand_no);
		
		Map<String, SaleProductKind> map =  null;
		
		for(SaleProductKind s : list) {
			if(s.getProduct_kind_no() == 1) map.put(Integer.toString(1), s);
			if(s.getProduct_kind_no() == 2) map.put(Integer.toString(2), s);
			if(s.getProduct_kind_no() == 3) map.put(Integer.toString(3), s);
			if(s.getProduct_kind_no() == 4) map.put(Integer.toString(4), s);
			if(s.getProduct_kind_no() == 5) map.put(Integer.toString(5), s);
			if(s.getProduct_kind_no() == 6) map.put(Integer.toString(6), s);
			if(s.getProduct_kind_no() == 7) map.put(Integer.toString(7), s);
			if(s.getProduct_kind_no() == 8) map.put(Integer.toString(8), s);
			if(s.getProduct_kind_no() == 9) map.put(Integer.toString(9), s);
			if(s.getProduct_kind_no() == 10) map.put(Integer.toString(10), s);
		}
		
		mv.addObject("tmap", map);
	}
	
	/**판매량 Top5 지점**/
	public ModelAndView saleTop5Store(ModelAndView modelAndView){
		int brand_no = 0;
		Map map = saleService.saleTop5Store(brand_no);
		return modelAndView;		
	}	
}
