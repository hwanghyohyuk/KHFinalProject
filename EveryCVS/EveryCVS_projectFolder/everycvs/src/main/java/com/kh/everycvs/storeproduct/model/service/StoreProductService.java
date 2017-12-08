package com.kh.everycvs.storeproduct.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.everycvs.common.model.vo.StoreProduct;

public interface StoreProductService {

	public int getListCount();

	public List<StoreProduct> selectList(int currentPage, int limit);
	
	public List<StoreProduct> searchSproduct(int currentPage, int limit, String keyword);
	
	public StoreProduct detailSproduct(int spnum);

	public ArrayList<StoreProduct> rankList();

	public int insertSproduct(StoreProduct sp);

	public int deleteSproduct(int spnum);

	public int updateSproduct(StoreProduct sp);

}
