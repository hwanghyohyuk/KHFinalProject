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

	public void deleteSpmanager(int spnum) {
		 sqlSession.delete("deleteSpmanager1");
		 sqlSession.delete("deleteSpmanager2");
		 sqlSession.delete("deleteSpmanager3");
		 sqlSession.delete("deleteSpmanager4", spnum);
	}
<<<<<<< HEAD

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
=======
	
	public int updateSpmanager(Map<String, Object> map) {
		return sqlSession.update("storeProduct.updateSpmanager", map); 
	}
	
	 /*지점 상품등록 spList */
		public int insertProduct(List<StoreProduct> spList) {
			int result=0;
			int insertResult=0;
			for(int i=0;i<spList.size();i++){
				int count = sqlSession.selectOne("storeProduct.selectCountSp", spList.get(i));
				if(count>0){//같은 상품이 존재하면 업데이트
					Map<String,Object> map = new HashMap<String,Object>();
					map.put("sp", spList.get(i));
					map.put("store_no", spList.get(i).getStore_no());
					map.put("product_no", spList.get(i).getProduct_no());
					map.put("manufacture_date", spList.get(i).getManufacture_date());
					insertResult = sqlSession.update("storeProduct.updateSp", map);
					if(insertResult>0){
						result++;
					}
				}else{//같은상품이 없으면 추가
					insertResult = sqlSession.insert("storeProduct.insertSp", spList.get(i));
					if(insertResult>0){
						result++;
					}	
				}					
			}		
			return result;
		}
>>>>>>> master
	
}
