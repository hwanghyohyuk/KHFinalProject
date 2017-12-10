package com.kh.everycvs.store.model.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Store;
import com.kh.everycvs.store.model.dao.StoreDao;

@Service("StoreService")
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDao storeDao;

	@Override
	public Store selectStore(String sno) {
		return storeDao.selectStore(sno);
	}	
	
	@Override
	public ModelAndView selectStoreList(HttpServletRequest request) {
		// 지점 조회 : 모든 지점을 조회
		return null;
	}

	@Override
	public ModelAndView searchStoreList(HttpServletRequest request) {
		// 지점 검색 : 입력한 키워드와 필터링으로 지점을 검색
		// 필터링 : 지점명/주소
		return null;
	}

	@Override
	public String DeleteStore(HttpServletRequest request) {
		// 지점 삭제
		return null;
	}

	/*사용자*/
	/**지도에 표시할 데이터리스트**/
	@Override
	public Map cvsMapList() {
		Map map = storeDao.cvsMapList();
		return null;
	}
	
	/**지점 방문횟수증가**/
	@Override
	public void increamentJoinCount(String store_no) {
		storeDao.increamentJoinCount(store_no);
	}

	/* 편의점 관리자 */
	/** 방문자 수 top5 지점 
	 * @param brand_no **/
	@Override
	public Map joinCountTop5(int brand_no) {
		Map map = storeDao.joinCountTop5(brand_no);
		return null;
	}
	
	/* 사이트 관리자 */
	/** 편의점별 방문자 수 통계 **/
	@Override
	public Map cvsJoinCount() {
		Map map = storeDao.cvsJoinCount();
		return null;
	}

	
	


}
