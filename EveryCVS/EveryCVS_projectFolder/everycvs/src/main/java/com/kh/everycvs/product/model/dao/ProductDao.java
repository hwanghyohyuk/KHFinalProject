package com.kh.everycvs.product.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.Product;
import com.kh.everycvs.common.model.vo.ProductKind;
import com.kh.everycvs.common.model.vo.StoreProduct;

@Repository("ProductDao")
public class ProductDao {

	@Autowired
	private SqlSession sqlSession;

	/*사용자*/
	/*실시간 인기상품 top3*/
	public List<Product> popularTop3(int brand_no) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("brand_no", brand_no);
		return sqlSession.selectList("product.popularTop3",map);
	}
	
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
	public List popularCvsProductTop5(int brand_no) {
		return sqlSession.selectList("product.popularProductTop5", brand_no);
	}
	
	/** 상품 조회 : 모든 상품 조회 */
	public List selectProductList(int brand_no) {
		return sqlSession.selectList("product.productList", brand_no);
	}

	/** 한 상품의 정보를 조회
	 * @param product */
	public Product selectProductOne(Product product) {
		return sqlSession.selectOne("product.selectProduct", product);
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
		else if(product.getProduct_kind_name() != null)
			list = sqlSession.selectList("product.productSearch3", product);
		
		return list;
	}
	
	/** 상품 등록 
	 * @param product */
	public void insertProduct(Product product) {
		sqlSession.insert("product.insertProduct", product);
	}
	
	/** 상품 수정
	 * @param product */
	public void updateProduct(Product product) {
		sqlSession.update("product.updateProduct", product);
	}

	/** 상품 삭제 : 편의점 상품 삭제할 때 지점 상품도 연쇄 삭제
	 * @param product */
	public void deleteProduct(Product product) {
		sqlSession.update("product.deleteProduct", product);
	}

	
	/*지점관리자*/
	/**allProduct 개수 조회**/
	public int getListCount(String keyword, int brand_no) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("brand_no", brand_no);
		if(!keyword.equals("")){
			map.put("keyword", "%"+keyword+"%");
			return sqlSession.selectOne("product.getSearchListCount",map);
		}else{
			return sqlSession.selectOne("product.getListCount",map);
		}	
	}
	
	/*지점관리자*/
	/**allProduct 전체보기, 검색하기**/
	public List<StoreProduct> listApmanager(int startRow, int endRow, String keyword, int brand_no) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startRow", startRow); 
		map.put("endRow", endRow); 
		map.put("brand_no", brand_no);
		if(!keyword.equals("")){
			map.put("keyword", "%"+keyword+"%");
			return sqlSession.selectList("product.searchApmanager", map);
		}else{
			return sqlSession.selectList("product.listApmanager", map);
		}	
	}

	public List<ProductKind> productKindList() {
			return sqlSession.selectList("product.productKindList");
	}
	
}
