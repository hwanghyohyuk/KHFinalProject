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
	
}
