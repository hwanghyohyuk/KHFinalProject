package com.kh.everycvs.store.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.everycvs.common.model.vo.NaverMap;
import com.kh.everycvs.common.model.vo.Store;

public interface StoreService {
	
	/*사용자*/
	/**지도에 표시할 데이터리스트**/
	ArrayList<Store> cvsMapList(NaverMap location);
	
	/**지점 방문횟수증가**/
	public void increamentJoinCount(String store_no);

	/*지점정보 조회*/
	public Store selectStore(String sno);
	
	/* 편의점 관리자 */
	/** 방문자 수 top5 지점 
	 * @param brand_no **/
	public List joinCountTop5(int brand_no);
	
	/** 판매량 top5 지점
	 * @param brand_no */
	public List saleQuantityTop5(int brand_no);
	
	/** 지점 조회 : 모든 지점을 조회
	 * @param brand_no */
	public List selectStoreList(int brand_no);
	
	/** 지점 검색 : 입력한 키워드와 필터링으로 지점을 검색
	*	필터링 : 지점번호/지점명/시도명/구군명/법정동명
	* @param store */
	public List searchStoreList(Store store);
	
	/** 지점 삭제
	 * @param store */
	public void DeleteStore(Store store);
	
	/* 사이트 관리자 */
	/** 편의점별 방문자 수 통계 **/
	public Map cvsJoinCount();
}
