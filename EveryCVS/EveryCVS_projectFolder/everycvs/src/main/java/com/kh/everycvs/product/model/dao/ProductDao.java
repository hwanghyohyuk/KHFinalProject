package com.kh.everycvs.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.Product;

@Repository("ProductDao")
public class ProductDao {

	@Autowired
	private SqlSession sqlSession;
	
	/** 상품 조회 : 모든 상품 조회 */
	public List selectProductList(int brand_no) {
		return sqlSession.selectList("product.productList", brand_no);
	}

	
	public Product selectProductOne() {
		// 상품 조회 : 선택한 상품 상세조회
		return null;
	}

	/** 상품 검색 : 입력한 키워드와 필터링으로 상품을 검색
	 * 필터링 : 상품명/제조사
	 * @param product */
	public List searchProductList(Product product) {
		List list = null;
		
		if(product.getProduct_name() != null)
			list = sqlSession.selectList("product.productSearch1", product);
		else if(product.getManufacturer() != null)
			list = sqlSession.selectList("product.productSearch2", product);
		
		return list;
	}

	
	public int insertProduct() {
		// 상품 등록
		return 0;
	}

	
	public int updateProduct() {
		// 상품 수정
		return 0;
	}

	/** 상품 삭제 : 편의점 상품 삭제할 때 지점 상품도 연쇄 삭제
	 * @param product */
	public void deleteProduct(Product product) {
		sqlSession.delete("product.deleteProduct1", product);
		sqlSession.delete("product.deleteProduct2", product);
		sqlSession.delete("product.deleteProduct3", product);
	}

	/*사용자*/
	/**실시간 인기상품(전체) top 5**/
	public Map popularProductTop5() {
		// TODO Auto-generated method stub
		return null;
	}

	/*지점관리자*/
	/**주간 인기상품 top 5**/
	public Map popularStoreProductTop5(String store_no) {
		// TODO Auto-generated method stub
		return null;
	}

	/*편의점관리자*/
	/**주간 인기상품 top 5**/
	public Map popularCvsProductTop5(int brand_no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
	
	
}
