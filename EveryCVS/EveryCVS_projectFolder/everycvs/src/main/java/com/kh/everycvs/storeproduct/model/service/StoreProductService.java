package com.kh.everycvs.storeproduct.model.service;

import java.util.List;

import com.kh.everycvs.common.model.vo.StoreProduct;

public interface StoreProductService {

	public int getListCount();

	public List<StoreProduct> selectList(int currentPage, int limit);
	
	public List<StoreProduct> searchSproduct(int currentPage, int limit, String keyword);

	public List<StoreProduct> top3Sproduct();

	public List<StoreProduct> new3Sproduct();

	public int getdcCount();

	public List<StoreProduct> dcSproduct();

}
