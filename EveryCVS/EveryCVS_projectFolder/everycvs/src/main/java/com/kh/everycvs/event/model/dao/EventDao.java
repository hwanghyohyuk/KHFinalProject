package com.kh.everycvs.event.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.Event;

@Repository("EventDao")
public class EventDao {
	
	public EventDao(){}
	
	public List selectEventList() {
		// 이벤트 조회 : 모든 공식이벤트를 조회
		return null;
	}

	public Event selectEventOne() {
		// 이벤트 조회 : 선택한 이벤트 상세조회
		return null;
	}

	public List searchEventList() {
		// 이벤트 검색 : 제목으로 검색
		return null;
	}
	
	public int insertEvent() {
		// 이벤트 등록
		return 0;
	}
	
	public int updateEvent() {
		// 이벤트 수정
		return 0;
	}
	
	public int deleteEvent() {
		// 이벤트 삭제
		return 0;
	}
}
