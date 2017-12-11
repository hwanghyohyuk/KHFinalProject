package com.kh.everycvs.store.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Store;

public interface StoreService {
	
	/*사용자*/
	/**지도에 표시할 데이터리스트**/
	public Map cvsMapList();
	/**지점 방문횟수증가**/
	public void increamentJoinCount(String store_no);

	/* 편의점 관리자 */
	/** 방문자 수 top5 지점 
	 * @param brand_no **/
	public Map joinCountTop5(int brand_no);
	
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
