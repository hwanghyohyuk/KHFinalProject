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
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.common.util.FileUtils;
import com.kh.everycvs.product.model.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;

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
	
	/** 상품 등록 페이지 이동*/
	@RequestMapping("cvsproductwriteview.do")
	public String cvsProductWriteView() {
		return "admin/cvsmanager/productWriteForm";
	}
	
	/** 상품 등록 
	 * @throws Exception */
	@RequestMapping("cvsproductwrite.do")
	public ModelAndView insertProduct(HttpSession session, HttpServletRequest request, ModelAndView mv) throws Exception {
		int brand_no = ((User)session.getAttribute("user")).getBrand_no();
		
		// 파일을 저장하고, "원래 파일명 | 변환된 파일명" 리턴
		String fileName = new FileUtils().InsertFile(session, request);
		String[] fName = fileName.split("/");
		
		Product product = new Product();
		product.setProduct_name(request.getParameter("productname"));
		product.setManufacturer(request.getParameter("manufacturer"));
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		product.setExpiration_date(Integer.parseInt(request.getParameter("deadline")));
		product.setProduct_kind_no(Integer.parseInt(request.getParameter("kind")));
		product.setBrand_no(brand_no);
		product.setOriginal_file_name(fName[0]);
		product.setStored_file_name(fName[1]);
		
		productService.insertProduct(product);
		
		ArrayList<Product> list = (ArrayList<Product>) productService.selectProductList(brand_no);
			
		mv.addObject("plist", list);
		mv.setViewName("admin/cvsmanager/productList");
		return mv;
	}
	
	/** 상품 수정 페이지 이동 */
	@RequestMapping("cvsproductmodifyview.do")
	public String cvsProductModifyView() {
		return "admin/cvsmanager/productModifyForm";
	}
	
	/** 상품 수정 */
	public String updateProduct(HttpServletRequest request) {
		return null;
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
