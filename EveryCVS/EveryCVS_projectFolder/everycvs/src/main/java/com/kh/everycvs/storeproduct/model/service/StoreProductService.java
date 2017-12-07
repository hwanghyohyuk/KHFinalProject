package com.kh.everycvs.storeproduct.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.everycvs.common.model.vo.StoreProduct;

public interface StoreProductService {

	public int getListCount();

	public List<StoreProduct> selectList(int currentPage, int limit);

	public ArrayList<StoreProduct> rankList();

	public StoreProduct detailSproduct(int spnum);

	public int insertSproduct(StoreProduct sp);

	public int deleteSproduct(int spnum);

	public int updateSproduct(StoreProduct sp);

}
