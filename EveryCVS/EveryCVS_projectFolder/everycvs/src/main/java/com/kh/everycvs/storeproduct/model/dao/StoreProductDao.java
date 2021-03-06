package com.kh.everycvs.storeproduct.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.StoreProduct;

@Repository("sproductDao")
public class StoreProductDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int getListCount(String keyword, String store_no) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("store_no", store_no);
		if(!keyword.equals("")){
			map.put("keyword", "%"+keyword+"%");
			return sqlSession.selectOne("storeProduct.getSearchListCount",map);
		}else{
			return sqlSession.selectOne("storeProduct.getListCount",map);
		}	
	}

	public List<StoreProduct> selectList(int startRow, int endRow, String keyword, String store_no) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startRow", startRow); 
		map.put("endRow", endRow); 
		map.put("store_no", store_no);
		if(!keyword.equals("")){
			map.put("keyword", "%"+keyword+"%");
			return sqlSession.selectList("storeProduct.searchSproduct", map);
		}else{
			return sqlSession.selectList("storeProduct.selectList", map);
		}		
	}

	public List<StoreProduct> top3Sproduct(String store_no) {
		return sqlSession.selectList("storeProduct.top3Sproduct",store_no);
	}

	public List<StoreProduct> new3Sproduct(String store_no) {
		return sqlSession.selectList("storeProduct.new3Sproduct",store_no);
	}

	public List<StoreProduct> dcSproduct(String store_no) {
		return sqlSession.selectList("storeProduct.dcSproduct",store_no);
	}

	public List<StoreProduct> expSproduct(String store_no) {
		return sqlSession.selectList("storeProduct.expSproduct",store_no);
	}
	
	public List<StoreProduct> listSpmanager(int startRow, int endRow, String keyword, String store_no) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startRow", startRow); 
		map.put("endRow", endRow); 
		map.put("store_no", store_no);
		if(!keyword.equals("")){
			map.put("keyword", "%"+keyword+"%");
			return sqlSession.selectList("storeProduct.searchSpmanager", map);
		}else{
			return sqlSession.selectList("storeProduct.listSpmanager", map);
		}		
	}

	public void deleteSpmanager(int spnum, String toggle) {
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("spnum", spnum);
		map.put("toggle", toggle);
		 sqlSession.update("storeProduct.deleteSpmanager", map);
	}
	
	public int updateSpmanager(Map<String, Object> map) {
		return sqlSession.update("storeProduct.updateSpmanager", map); 
	}
	
	public int insertProduct(List<StoreProduct> spList) {
		int result=0;
		int insertResult=0;
		for(int i=0;i<spList.size();i++){
			int count = sqlSession.selectOne("storeProduct.selectCountSp", spList.get(i));
			if(count>0){ //같은 상품이 존재하면 업데이트
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("sp", spList.get(i));
				map.put("store_no", spList.get(i).getStore_no());
				map.put("product_no", spList.get(i).getProduct_no());
				map.put("manufacture_date", spList.get(i).getManufacture_date());
				insertResult = sqlSession.update("storeProduct.updateSp", map);
				
				if(insertResult>0){
					result++;
				}
			
			}else{ //같은상품이 없으면 추가
				insertResult = sqlSession.insert("storeProduct.insertSp", spList.get(i));
				if(insertResult>0){
				result++;
				}	
			}					
		}		
		return result;
	}

	/*지점관리자*/
	/** 금일 등록된 상품수 **/
	public int registProducts(String store_no) {
		return sqlSession.selectOne("storeProduct.registProducts",store_no);
	}
	
	public List<StoreProduct> spTop5(String store_no) {
		return sqlSession.selectList("storeProduct.spTop5", store_no);
	}
	
	/*편의점관리자*/
	/** 금일 등록된 상품수 **/
	public int registProducts(int brand_no) {
		return sqlSession.selectOne("storeProduct.cvsRegistProducts",brand_no);
	}

	public List<StoreProduct> storeProductInfo(String storeNo, int tabNo) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("store_no", storeNo);
		if(tabNo==1){
			return sqlSession.selectList("storeProduct.newSplist5",map);
		}else if(tabNo==2){
			return sqlSession.selectList("storeProduct.expSplist5",map);
		}else{
			return null;
		}
	}
	
}
