package com.kh.everycvs.storeproduct.model.service;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everycvs.storeproduct.model.dao.StoreProductDao;
import com.kh.everycvs.common.model.vo.StoreProduct;

@Service("sproductService")
public class StoreProductServiceImpl implements StoreProductService {
	
	@Autowired
	private StoreProductDao sproductDao;

	@Override
	public int getListCount(String keyword) {
		return sproductDao.getListCount(keyword);
	}

	@Override
	public List<StoreProduct> selectList(int currentPage, int limit, String keyword) {
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
		return sproductDao.selectList(startRow,endRow,keyword);  
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
	public List<StoreProduct> dcSproduct() {
		return sproductDao.dcSproduct();
	}

	@Override
	public List<StoreProduct> expSproduct() {
		return sproductDao.expSproduct();
	}

	@Override
	public List<StoreProduct> listSpmanager(int currentPage, int limit, String keyword) {
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
		return sproductDao.listSpmanager(startRow,endRow,keyword);  
	}

	@Override
	public void deleteSpmanager(int spnum,String toggle) {
		sproductDao.deleteSpmanager(spnum,toggle);
	}

	@Override
	public List<StoreProduct> listApmanager(int currentPage, int limit, String keyword) {
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
		return sproductDao.listApmanager(startRow,endRow,keyword);
	}

	@Override
	public int updateSpmanager(Map<String, Object> map) {
			return sproductDao.updateSpmanager(map); 
	}
	
}
