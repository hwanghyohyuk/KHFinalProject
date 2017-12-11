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
	
	public int getListCount() {
		return sqlSession.selectOne("storeProduct.getListCount");
	}

	public List<StoreProduct> selectList(int startRow, int endRow) {
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("startRow", startRow); 
		map.put("endRow", endRow); 
		return sqlSession.selectList("storeProduct.selectList", map);
	}
	
	public List<StoreProduct> searchSproduct(int startRow, int endRow, String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		String start =String.valueOf(startRow);
		String end =String.valueOf(endRow);
		map.put("start", start); 
		map.put("end", end);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectList("storeProduct.searchSproduct", map);
	}

	public List<StoreProduct> top3Sproduct() {
		return sqlSession.selectList("storeProduct.top3Sproduct");
	}

	public List<StoreProduct> new3Sproduct() {
		return sqlSession.selectList("storeProduct.new3Sproduct");
	}

	public int getdcCount() {
		return sqlSession.selectOne("storeProduct.getdcCount");
	}

	public List<StoreProduct> dcSproduct() {
		return sqlSession.selectList("storeProduct.dcSproduct");
	}
	
}
