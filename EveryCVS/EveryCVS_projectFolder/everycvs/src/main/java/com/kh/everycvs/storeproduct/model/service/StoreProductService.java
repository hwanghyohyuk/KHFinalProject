package com.kh.everycvs.storeproduct.model.service;

import java.util.List;
import java.util.Map;

import com.kh.everycvs.common.model.vo.StoreProduct;

public interface StoreProductService {

	public int getListCount(String keyword);

	public List<StoreProduct> selectList(int currentPage, int limit, String keyword);

	public List<StoreProduct> top3Sproduct();

	public List<StoreProduct> new3Sproduct();

	public List<StoreProduct> dcSproduct();

	public List<StoreProduct> expSproduct();

	public List<StoreProduct> listSpmanager(int currentPage, int limit, String keyword);

	public void deleteSpmanager(int spnum, String toggle);
	
	public int updateSpmanager(Map<String, Object> map);

	public List<StoreProduct> listApmanager(int currentPage, int limit, String keyword);

}
