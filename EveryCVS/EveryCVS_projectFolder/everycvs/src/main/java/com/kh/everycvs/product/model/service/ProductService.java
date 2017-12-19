package com.kh.everycvs.product.model.service;

import java.util.List;
import java.util.Map;
import com.kh.everycvs.common.model.vo.Product;
import com.kh.everycvs.common.model.vo.StoreProduct;

public interface ProductService {
	
	/*사용자 메인 : 인기상품 top3*/
	public List<Product> popularTop3();
	
	/** 상품 조회 : 모든 상품 조회 */
	public List selectProductList(int brand_no);
	
	/** 한 상품의 정보를 조회
	 * @param product */
	public Product selectProductOne(Product product);
	
	/** 상품 검색 : 입력한 키워드와 필터링으로 상품을 검색
	 * 필터링 : 상품명/제조사 */
	public List searchProductList(Product product);
	
	/** 상품 등록
	 * @param product */
	public void insertProduct(Product product);
	
	/** 상품 수정
	 * @param product */
	public void updateProduct(Product product);
	
	/** 상품 삭제 : 편의점 상품 삭제할 때 지점 상품도 연쇄 삭제
	 * @param product */
	public void deleteProduct(Product product);
	
	/*사용자*/
	/**실시간 인기상품(전체) top 5**/
	public Map popularProductTop5();
	
	/**주간 인기상품 top 5**/	
	public Map popularStoreProductTop5(String store_no);
	
	/*편의점관리자*/
	/**주간 인기상품 top 5**/
	public List popularCvsProductTop5(int brand_no);
	
	/*지점관리자*/
	/**상품 리스트 카운트**/
	public int getListCount(String keyword, int brand_no);
	
	public List<StoreProduct> listApmanager(int currentPage, int limit, String keyword, int brand_no);

}
