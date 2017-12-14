package com.kh.everycvs.product.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Product;
import com.kh.everycvs.product.model.dao.ProductDao;

@Service("ProductService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;

	/*사용자*/
	/**실시간 인기상품(전체) top 5**/
	@Override
	public Map popularProductTop5() {
		return productDao.popularProductTop5();
	}

	/*지점관리자*/
	/**주간 인기상품 top 5**/
	@Override
	public Map popularStoreProductTop5(String store_no) {
		return productDao.popularStoreProductTop5(store_no);
	}

	
	/*편의점관리자*/
	/**주간 인기상품 top 5**/
	@Override
	public Map popularCvsProductTop5(int brand_no) {
		return productDao.popularCvsProductTop5(brand_no);
	}
	
	/** 상품 조회 : 모든 상품 조회 */
	@Override
	public List selectProductList(int brand_no) {
		return productDao.selectProductList(brand_no);
	}

	/** 한 상품의 정보를 조회
	 * @param product */
	@Override
	public Product selectProductOne(Product product) {
		return productDao.selectProductOne(product);
	}

	/** 상품 검색 : 입력한 키워드와 필터링으로 상품을 검색
	 * 필터링 : 상품명/제조사
	 * @param product */
	@Override
	public List searchProductList(Product product) {
		return productDao.searchProductList(product);
	}

	/** 상품 등록
	 * @param product */
	@Override
	public void insertProduct(Product product) {
		productDao.insertProduct(product);
	}

	/** 상품 수정
	 * @param product */
	@Override
	public void updateProduct(Product product) {
		productDao.updateProduct(product);
	}

	/** 상품 삭제 : 편의점 상품 삭제할 때 지점 상품도 연쇄 삭제
	 * @param product */
	@Override
	public void deleteProduct(Product product) {
		productDao.deleteProduct(product);
	}
	
	
}
