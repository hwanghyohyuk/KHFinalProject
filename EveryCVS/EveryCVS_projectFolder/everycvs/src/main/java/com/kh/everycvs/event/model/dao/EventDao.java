package com.kh.everycvs.event.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.Event;
<<<<<<< HEAD
=======
import com.kh.everycvs.common.model.vo.EventResult;
>>>>>>> master



@Repository("eventDao")
public class EventDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public EventDao(){}
<<<<<<< HEAD
	
	public List<Event> selectEventList() throws Exception{
		return sqlSession.selectList("event.cvseventlist");
=======
	//관리자 검색 및 페이징

	/*사용자 : 이벤트 목록*/
	public List<Event> eventList() {
		return sqlSession.selectList("event.eventList");
	}

	/*사용자 : 메인화면 이벤트 top3*/
	public List<Event> eventTop3() {
		return sqlSession.selectList("event.eventTop3");
	}
>>>>>>> master
	
	}
<<<<<<< HEAD

=======
	//사용자 이벤트 결과 리스트 불러오기
	public List<EventResult> resultEventList(String keyword, int startRow, int endRow) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startRow", startRow); 
		map.put("endRow", endRow);
		
		return sqlSession.selectList("event.resulteventlist",map);
	}
	//관리자 검색 후 게시글 갯수
	public int listCount(String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		if(!keyword.equals("")){
			map.put("mainkeyword", "%"+keyword+"%");
			map.put("subkeyword", "%"+keyword+"%");
			return sqlSession.selectOne("event.getSearchCount",map);
		}else{
			return sqlSession.selectOne("event.getListCount");
		}	
	}
	
	
>>>>>>> master
	public Event selectEventOne(int no) {
		// 이벤트 조회 : 선택한 이벤트 상세조회
		Event event = sqlSession.selectOne("event.eventDetail",no);
		return event;
	}
	
	//조회수 증가
	public int eventReadCount(int no) {
		return sqlSession.update("event.eventReadCount",no);
	}
	
	public int eventDelete(int no) {
		//이벤트 삭제
		return sqlSession.delete("event.eventDelete", no);
	}
	
	//글쓰기
	public void cvseventwriteview(Event vo) {
		System.out.println("dao : "+vo);
		  sqlSession.insert("event.cvseventwrite", vo); 
	}
	
	public int updateEvent() {
		// 이벤트 수정
		return 0;
	}

	public Event cvsEventDetail(int eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("event.cvsEventDetail", eno);
	}
<<<<<<< HEAD
	
	
=======

	//수정하기 페이지로 이동
	public Event updateEvent(int no) {
		Event event = sqlSession.selectOne("event.cvseventmodifyview", no);
		return event;
	}
	//수정하기 완료
	public int updateEventPage(Event event) {
		int result = sqlSession.update("event.cvseventmodifywrite", event);
		System.out.println("수정dao : "+event);
		System.out.println("result : "+result);
		return result;
	}
	
	
	
	//이거는 사용자에 써야하나?
	public List searchEventList() {
		// 이벤트 검색 : 제목으로 검색
		return null;
	}
	public int eventResultReadCount(int rno) {
		// 결과페이지 조회수 증가
		return sqlSession.update("event.eventResultReadCount",rno);
	}
	public EventResult eventResultDetail(int rno) {
		// 이벤트 조회 : 선택한 이벤트 상세조회
		EventResult eventresult = sqlSession.selectOne("event.eventResultDetail",rno);
		return eventresult;
	}


>>>>>>> master
}
