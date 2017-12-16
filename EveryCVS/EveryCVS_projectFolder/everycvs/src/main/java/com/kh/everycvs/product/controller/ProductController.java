package com.kh.everycvs.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import com.kh.everycvs.sale.model.service.SaleService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private SaleService saleService;

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
	@RequestMapping("cvsproductList.do")
	/** 상품 조회 : 모든 상품 조회 */
	public ModelAndView selectProductList(
			HttpSession session, HttpServletRequest request, ModelAndView mv) {
		int brand_no = ((User) session.getAttribute("user")).getBrand_no();
		
		ArrayList<Product> list = (ArrayList<Product>) productService.selectProductList(brand_no);
		
		setMVProductList(brand_no, mv, list);
		return mv;
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
		
		setMVProductList(user.getBrand_no(), mv, list);
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
	public ModelAndView insertProduct(
			HttpSession session, HttpServletRequest request, ModelAndView mv)
					throws Exception {
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
			
		setMVProductList(brand_no, mv, list);
		return mv;
	}
	
	/** 상품 수정 페이지 이동 */
	@RequestMapping("cvsproductmodifyview.do")
	public ModelAndView cvsProductModifyView(
			HttpSession session, HttpServletRequest request, ModelAndView mv) {
		Product sendProduct = new Product();
		sendProduct.setBrand_no(((User)session.getAttribute("user")).getBrand_no());
		sendProduct.setProduct_no(Integer.parseInt(request.getParameter("product_no")));
		
		Product resultProduct = productService.selectProductOne(sendProduct);
		
		mv.addObject("product", resultProduct);
		mv.setViewName("admin/cvsmanager/productModifyForm");
		return mv;
	}
	
	/** 상품 수정 
	 * @throws Exception */
	@RequestMapping("cvsproductmodify.do")
	public ModelAndView modifyProduct(
			HttpSession session, HttpServletRequest request, ModelAndView mv)
					throws Exception {
		int brand_no = ((User)session.getAttribute("user")).getBrand_no();
		
		String fileName = new FileUtils().InsertFile(session, request);
		String[] fName = fileName.split("/");
		
		String prevFileName = request.getParameter("prevfile");
		
		Product product = new Product();
		product.setProduct_no(Integer.parseInt(request.getParameter("productno")));
		product.setProduct_name(request.getParameter("productname"));
		product.setManufacturer(request.getParameter("manufacturer"));
		product.setPrice(Integer.parseInt(request.getParameter("price")));
		product.setExpiration_date(Integer.parseInt(request.getParameter("deadline")));
		product.setProduct_kind_no(Integer.parseInt(request.getParameter("kind")));
		product.setOriginal_file_name(fName[0]);
		product.setStored_file_name(fName[1]);
		
		productService.updateProduct(product);
		new FileUtils().deleteFile(request);	// 기존에 있던 저장파일 삭제
		
		ArrayList<Product> list = (ArrayList<Product>) productService.selectProductList(brand_no);
		
		setMVProductList(brand_no, mv, list);
		return mv;
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
		
		setMVProductList(brand_no, mv, list);
		return mv;
	}

	/** ModelAndView 에 리스트 3개 addObject 해주고, 뷰네임(리스트로) 지정해주는 메소드 **/
	public void setMVProductList(int brand_no, ModelAndView mv, ArrayList<Product> plist) {
		List<Map<String,Object>> list2 = saleService.kindCvsSale(brand_no);
		ArrayList<Product> list3 = (ArrayList<Product>) productService.popularCvsProductTop5(brand_no);
		
		HashMap map = new HashMap();
		int productCount = 0;
		
		for(int i = 0; i<list2.size(); i++) {
			String s = String.valueOf(list2.get(i).get("PRODUCT_KIND_NO"));
			String p = String.valueOf(list2.get(i).get("SALE_QUANTITY"));
			
			if(s.equals("1"))	map.put("1", p);
			else if(s.equals("2"))	map.put("2", p);
			else if(s.equals("3"))	map.put("3", p);
			else if(s.equals("4"))	map.put("4", p);
			else if(s.equals("5"))	map.put("5", p);
			else if(s.equals("6"))	map.put("6", p);
			else if(s.equals("7"))	map.put("7", p);
			else if(s.equals("8"))	map.put("8", p);
			else if(s.equals("9"))	map.put("9", p);
			else if(s.equals("10"))	map.put("10", p);
			
			productCount += Integer.parseInt(p);
		}
		
		for(int i=1; i<11; i++) {
			if(map.get(Integer.toString(i)) == null)
				map.put(Integer.toString(i), "0");
		}
		
		mv.addObject("plist", plist);
		mv.addObject("tlist", list3);
		mv.addObject("tmap", map);
		mv.addObject("count", productCount);
		
		mv.setViewName("admin/cvsmanager/productList");
	}
	
}
