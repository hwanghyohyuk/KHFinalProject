package com.kh.everycvs.storeproduct.model.service;

import java.util.List;

import com.kh.everycvs.common.model.vo.StoreProduct;

public interface StoreProductService {

	public int getListCount(String keyword, String store_no);

	public List<StoreProduct> selectList(int currentPage, int limit, String keyword, String store_no);

	public List<StoreProduct> top3Sproduct(String string);

	public List<StoreProduct> new3Sproduct(String string);

	public List<StoreProduct> dcSproduct(String string);

	public List<StoreProduct> expSproduct(String string);

	public List<StoreProduct> listSpmanager(int currentPage, int limit, String keyword, String store_no);

	public void deleteSpmanager(int spnum);

<<<<<<< HEAD
	public List<StoreProduct> listApmanager(int currentPage, int limit, String keyword);


=======
	public int insertApmanager(List<StoreProduct> spList);
>>>>>>> master
}
