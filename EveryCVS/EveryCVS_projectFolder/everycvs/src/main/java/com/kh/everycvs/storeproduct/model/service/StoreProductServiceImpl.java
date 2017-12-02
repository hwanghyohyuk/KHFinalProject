package com.kh.everycvs.storeproduct.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everycvs.storeproduct.model.dao.StoreProductDao;
import com.kh.everycvs.common.model.vo.StoreProduct;

@Service("sproductService")
public class StoreProductServiceImpl implements StoreProductService {
	
	@Autowired
	private StoreProductDao sproductDao;

	@Override
	public int getListCount() {
		return sproductDao.getListCount();
	}

	@Override
	public ArrayList<StoreProduct> selectList(int currentPage, int limit) {
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
		return sproductDao.selectList(startRow,endRow);  
	}
	
	@Override
	public ArrayList<StoreProduct> searchList() {
		return sproductDao.searchList();
	}

	@Override
	public ArrayList<StoreProduct> rankList() {
		return sproductDao.rankList();
	}

	@Override
	public StoreProduct detailSproduct(int spnum) {
		return sproductDao.detailSproduct();
	}

	@Override
	public int insertSproduct(StoreProduct sp) {
		return sproductDao.insertSproduct();
	}

	@Override
	public int deleteSproduct(int spnum) {
		return sproductDao.deleteSproduct();
	}

	@Override
	public int updateSproduct(StoreProduct sp) {
		return sproductDao.updateSproduct();
	}

}
