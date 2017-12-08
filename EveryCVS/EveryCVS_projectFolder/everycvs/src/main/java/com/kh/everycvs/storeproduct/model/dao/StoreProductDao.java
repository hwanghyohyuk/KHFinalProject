package com.kh.everycvs.storeproduct.model.dao;

import java.util.ArrayList;
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
		System.out.println("keyword : "+"%"+keyword+"%");
		return sqlSession.selectList("storeProduct.searchSproduct", map);
	}

	public ArrayList<StoreProduct> rankList() {
		return null;
	}

	public StoreProduct detailSproduct() {
		return null;
	}

	public int insertSproduct() {
		return 0;
	}

	public int deleteSproduct() {
		return 0;
	}

	public int updateSproduct() {
		return 0;
	}
	
}
