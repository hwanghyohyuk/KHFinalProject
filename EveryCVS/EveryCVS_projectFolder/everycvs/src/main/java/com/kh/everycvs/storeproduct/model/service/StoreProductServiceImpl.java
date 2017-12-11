package com.kh.everycvs.storeproduct.model.service;

import java.util.List;

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
	public List<StoreProduct> selectList(int currentPage, int limit) {
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
		return sproductDao.selectList(startRow,endRow);  
	}
	
	@Override
	public List<StoreProduct> searchSproduct(int currentPage, int limit, String keyword) {
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
		return sproductDao.searchSproduct(startRow,endRow,keyword);
	}

	@Override
	public List<StoreProduct> top3Sproduct() {
		return sproductDao.top3Sproduct();
	}

	@Override
	public List<StoreProduct> new3Sproduct() {
		return sproductDao.new3Sproduct();
	}

	@Override
	public int getdcCount() {
		return sproductDao.getdcCount();
	}

	@Override
	public List<StoreProduct> dcSproduct() {
		return sproductDao.dcSproduct();
	}
	
}
