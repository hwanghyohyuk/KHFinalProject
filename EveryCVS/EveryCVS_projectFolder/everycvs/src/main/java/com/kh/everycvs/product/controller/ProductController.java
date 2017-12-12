package com.kh.everycvs.product.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Product;
import com.kh.everycvs.common.model.vo.Store;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.product.model.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;

	/** 상품 조회 : 전체 상품 조회 */
	public ModelAndView selectProductList(HttpServletRequest request) {
		return null;
	}
	
	/** 상품 조회 : 선택한 상품 상세 조회 */
	public ModelAndView selectProductOne(HttpServletRequest request) {
		return null;
	}
	
	/** 상품 검색 : 입력한 키워드와 필터링으로 상품을 검색
	* 필터링 : 상품명/상품코드 */
	public ModelAndView searchProductList(HttpServletRequest request) {
		return null;
	}
	
	/** 상품 등록 */
	public String insertProduct(HttpServletRequest request) {
		return null;
	}
	
	/** 상품 수정 */
	public String updateProduct(HttpServletRequest request) {
		return null;
	}
	
	/** 상품 삭제 : 편의점 상품 삭제할 때 지점 상품도 연쇄 삭제 */
	public String deleteProduct(HttpServletRequest request) {
		return null;
	}

	/*사용자*/
	/**실시간 인기상품(전체) top 5**/
	public ModelAndView popularProductTop5(ModelAndView modelAndView){
		Map map = productService.popularProductTop5();
		return modelAndView;
	}
	
	/*지점관리자*/
	/**주간 인기상품 top 5**/
	public ModelAndView popularStoreProductTop5(ModelAndView modelAndView){
		String store_no="";
		Map map = productService.popularStoreProductTop5(store_no);
		return modelAndView;
	}
	
	/*편의점관리자*/
	/**주간 인기상품 top 5**/
	public ModelAndView popularCvsProductTop5(ModelAndView modelAndView){
		int brand_no = 0;
		Map map = productService.popularCvsProductTop5(brand_no);
		return modelAndView;
	}
	
	@RequestMapping("cvsproductList.do")
	/** 상품 조회 : 모든 상품 조회 */
	public ModelAndView selectProductList(
			HttpSession session, HttpServletRequest request, ModelAndView mv) {
		int brand_no = ((User) session.getAttribute("user")).getBrand_no();
		
		ArrayList<Product> list = (ArrayList<Product>) productService.selectProductList(brand_no);
		
		mv.addObject("plist", list);
		mv.setViewName("admin/cvsmanager/productList");
		return mv;
		
		/*map.put("0", (ArrayList<Product>) productService.searchProductList(productInfo));
		map.put("1", (ArrayList<Product>) productService.searchProductList1(productInfo));
		map.put("2", (ArrayList<Product>) productService.searchProductList2(productInfo));
		map.put("3", (ArrayList<Product>) productService.searchProductList3(productInfo));
		map.put("4", (ArrayList<Product>) productService.searchProductList4(productInfo));
		map.put("5", (ArrayList<Product>) productService.searchProductList5(productInfo));
		map.put("6", (ArrayList<Product>) productService.searchProductList6(productInfo));
		map.put("7", (ArrayList<Product>) productService.searchProductList7(productInfo));
		map.put("8", (ArrayList<Product>) productService.searchProductList8(productInfo));
		map.put("9", (ArrayList<Product>) productService.searchProductList9(productInfo));
		map.put("10", (ArrayList<Product>) productService.searchProductList10(productInfo));
		map.put("11", (ArrayList<Product>) productService.searchProductList11(productInfo));
		
		mv.addObject("map", map);
		mv.setViewName("admin/cvsmanager/productList");*/
	}
	
	/** 상품 조회 : 선택한 상품 상세 조회 */
	public ModelAndView selectProductOne() {
		return null;
	}
	
	/** 상품 검색 : 입력한 키워드와 필터링으로 상품을 검색
	* 필터링 : 상품명/제조사 */
	@RequestMapping("cvsproductSearch.do")
	public ModelAndView searchProductList(
			HttpSession session, HttpServletRequest request, ModelAndView mv) {
		User user = (User) session.getAttribute("user");
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		keyword = "%" + keyword + "%";
		
		Product productInfo = new Product();
		productInfo.setBrand_no(user.getBrand_no());
	
		switch(category) {
		case "상품명" :
			productInfo.setProduct_name(keyword);
			break;
		case "제조사" :
			productInfo.setManufacturer(keyword);
			break;
		}
		
		ArrayList<Product> list = (ArrayList<Product>) productService.searchProductList(productInfo);
		
		mv.addObject("plist", list);
		mv.setViewName("admin/cvsmanager/productList");
		return mv;
	}
	
	/** 상품 등록 */
	@RequestMapping("cvsproductwriteview.do")
	public String cvsProductWriteView() {
		return "admin/cvsmanager/productWriteForm";
	}
	
	/** 상품 수정 */
	@RequestMapping("cvsproductmodifyview.do")
	public String cvsProductModifyView() {
		return "admin/cvsmanager/productModifyForm";
	}
	
	@RequestMapping(value = "cvsproductDelete.do", method = RequestMethod.GET)
	/** 상품 삭제 : 편의점 상품 삭제할 때 지점 상품도 연쇄 삭제 */
	public ModelAndView deleteProduct(
			HttpSession session, HttpServletRequest request, ModelAndView mv) {
		int brand_no = ((User)session.getAttribute("user")).getBrand_no();
		
		Product product = new Product();
		product.setBrand_no(brand_no);
		product.setProduct_no(Integer.parseInt(request.getParameter("product_no")));
		
		productService.deleteProduct(product);
		ArrayList<Product> list = (ArrayList<Product>) productService.selectProductList(brand_no);
		
		mv.addObject("plist", list);
		mv.setViewName("admin/cvsmanager/productList");
		return mv;
	}
	
	
}
