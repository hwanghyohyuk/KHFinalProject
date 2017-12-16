package com.kh.everycvs.storeproduct.model.dao;

import java.sql.Date;
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
	
	public int getListCount(String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		if(!keyword.equals("")){
			map.put("keyword", "%"+keyword+"%");
			return sqlSession.selectOne("storeProduct.getSearchListCount",map);
		}else{
			return sqlSession.selectOne("storeProduct.getListCount");
		}	
		
	}

	public List<StoreProduct> selectList(int startRow, int endRow, String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startRow", startRow); 
		map.put("endRow", endRow); 
		if(!keyword.equals("")){
			map.put("keyword", "%"+keyword+"%");
			return sqlSession.selectList("storeProduct.searchSproduct", map);
		}else{
			return sqlSession.selectList("storeProduct.selectList", map);
		}		
	}

	public List<StoreProduct> top3Sproduct() {
		return sqlSession.selectList("storeProduct.top3Sproduct");
	}

	public List<StoreProduct> new3Sproduct() {
		return sqlSession.selectList("storeProduct.new3Sproduct");
	}

	public List<StoreProduct> dcSproduct() {
		return sqlSession.selectList("storeProduct.dcSproduct");
	}

	public List<StoreProduct> expSproduct() {
		return sqlSession.selectList("storeProduct.expSproduct");
	}
	
	public List<StoreProduct> listSpmanager(int startRow, int endRow, String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startRow", startRow); 
		map.put("endRow", endRow); 
		if(!keyword.equals("")){
			map.put("keyword", "%"+keyword+"%");
			return sqlSession.selectList("storeProduct.searchSpmanager", map);
		}else{
			return sqlSession.selectList("storeProduct.listSpmanager", map);
		}		
	}

	public void deleteSpmanager(int spnum) {
		 sqlSession.delete("deleteSpmanager1");
		 sqlSession.delete("deleteSpmanager2");
		 sqlSession.delete("deleteSpmanager3");
		 sqlSession.delete("deleteSpmanager4", spnum);
	}
	
	public int updateSpmanager(int spnum, Date manufacturedate, int quantity) {
		return sqlSession.update("updateSpmanager", spnum); 
	}

	public List<StoreProduct> listApmanager(int startRow, int endRow, String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startRow", startRow); 
		map.put("endRow", endRow); 
		if(!keyword.equals("")){
			map.put("keyword", "%"+keyword+"%");
			return sqlSession.selectList("storeProduct.searchApmanager", map);
		}else{
			return sqlSession.selectList("storeProduct.listApmanager", map);
		}	
	}
	
}
