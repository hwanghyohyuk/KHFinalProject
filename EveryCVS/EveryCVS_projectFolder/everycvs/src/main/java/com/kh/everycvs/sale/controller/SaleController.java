package com.kh.everycvs.sale.controller;

import java.util.ArrayList;
import java.util.List;
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
	public ModelAndView saleBenefitChart(ModelAndView modelAndView){
		String store_no = "";
		Map map = saleService.saleBenefitChart(store_no);
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
	public ModelAndView kindCvsSale(HttpSession session, ModelAndView mv){
		int brand_no = 0;
		return mv;
	}
	
	/**판매량 Top5 지점**/
	public ModelAndView saleTop5Store(ModelAndView modelAndView){
		int brand_no = 0;
		Map map = saleService.saleTop5Store(brand_no);
		return modelAndView;		
	}	
}
