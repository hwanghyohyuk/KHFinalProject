package com.kh.everycvs.storeproduct.model.service;

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
	public int getListCount(String keyword, String store_no) {
		return sproductDao.getListCount(keyword,store_no);
	}

	@Override
	public List<StoreProduct> selectList(int currentPage, int limit, String keyword, String store_no) {
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
		return sproductDao.selectList(startRow,endRow,keyword,store_no);  
	}

	@Override
	public List<StoreProduct> listSpmanager(int currentPage, int limit, String keyword, String store_no) {
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
		return sproductDao.listSpmanager(startRow,endRow,keyword,store_no);  
	}

	@Override
	public void deleteSpmanager(int spnum,String toggle) {
		sproductDao.deleteSpmanager(spnum,toggle);
	}
	
	@Override
	public int updateSpmanager(Map<String, Object> map) {
			return sproductDao.updateSpmanager(map); 
	}

	@Override
	public List<StoreProduct> top3Sproduct(String store_no) {
		return sproductDao.top3Sproduct(store_no);
	}

	@Override
	public List<StoreProduct> new3Sproduct(String store_no) {
		return sproductDao.new3Sproduct(store_no);
	}

	@Override
	public List<StoreProduct> dcSproduct(String store_no) {
		return sproductDao.dcSproduct(store_no);
	}

	@Override
	public List<StoreProduct> expSproduct(String store_no) {
		return sproductDao.expSproduct(store_no);
	}
	
	@Override
	public int insertApmanager(List<StoreProduct> spList) {
		return sproductDao.insertProduct(spList);
	}

	/*지점관리자*/
	/** 금일 등록된 상품수 **/
	@Override
	public int registProducts(String store_no) {
		return sproductDao.registProducts(store_no);
	}
	/**지점인기상품 top5**/
	@Override
	public List<StoreProduct> spTop5(String store_no) {
		return sproductDao.spTop5(store_no);
	}
	
	/*편의점관리자*/
	/** 금일 등록된 상품수 **/
	@Override
	public int registProducts(int brand_no) {
		return sproductDao.registProducts(brand_no);
	}
	
}
