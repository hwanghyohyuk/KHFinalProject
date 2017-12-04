package com.kh.everycvs.storeproduct.model.service;

import java.util.ArrayList;

import com.kh.everycvs.common.model.vo.StoreProduct;

public interface StoreProductService {

	public int getListCount();

	public ArrayList<StoreProduct> selectList(int currentPage, int limit);

	public ArrayList<StoreProduct> rankList();

	public StoreProduct detailSproduct(int spnum);

	public int insertSproduct(StoreProduct sp);

	public int deleteSproduct(int spnum);

	public int updateSproduct(StoreProduct sp);

}
