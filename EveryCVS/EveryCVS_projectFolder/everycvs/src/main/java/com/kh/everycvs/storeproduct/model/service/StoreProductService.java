package com.kh.everycvs.storeproduct.model.service;

import java.util.List;
import java.util.Map;

import com.kh.everycvs.common.model.vo.StoreProduct;

public interface StoreProductService {

	public int getListCount(String keyword, String store_no);

	public List<StoreProduct> selectList(int currentPage, int limit, String keyword, String store_no);

	public List<StoreProduct> top3Sproduct(String string);

	public List<StoreProduct> new3Sproduct(String string);

	public List<StoreProduct> dcSproduct(String string);

	public List<StoreProduct> expSproduct(String string);

	public List<StoreProduct> listSpmanager(int currentPage, int limit, String keyword, String store_no);

	public void deleteSpmanager(int spnum, String toggle);
	
	public int updateSpmanager(Map<String, Object> map);

	public int insertApmanager(List<StoreProduct> spList);
	
}
