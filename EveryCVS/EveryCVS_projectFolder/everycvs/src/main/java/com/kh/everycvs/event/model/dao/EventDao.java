package com.kh.everycvs.event.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.Event;
import com.kh.everycvs.common.model.vo.EventJoin;
import com.kh.everycvs.common.model.vo.EventResult;



@Repository("eventDao")
public class EventDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public EventDao(){}
	//관리자 검색 및 페이징

	/*사용자 : 이벤트 목록*/
	public List<Event> eventList() {
		return sqlSession.selectList("event.eventList");
	}

	/*사용자 : 메인화면 이벤트 top3*/
	public List<Event> eventTop3() {
		return sqlSession.selectList("event.eventTop3");
	}
	
	public List<Event> selectEventList(String keyword, int startRow, int endRow, int user_no) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startRow", startRow); 
		map.put("endRow", endRow);
		map.put("user_no", user_no);
		if(user_no==2 && keyword.equals("")) {//gs관리자
			return sqlSession.selectList("event.cvseventlist1",map);
		}else if(user_no==3 && keyword.equals("")) {//cu
			return sqlSession.selectList("event.cvseventlist2",map);
		}else if(user_no==4 && keyword.equals("")) {//event
			return sqlSession.selectList("event.cvseventlist3",map);
		}else if(user_no >4 && keyword.equals("")) {
			return sqlSession.selectList("event.cvseventlist",map);
		}
		else{
			//왜인진 모르겠지만 제목으로 만 검색됨 ...
			map.put("mainkeyword","%"+keyword+"%");
			map.put("subkeyword","%"+keyword+"%");
			System.out.println("keyword"+ keyword);
			return sqlSession.selectList("event.cvseventsearch",map);
		}
		
		/*if(keyword.equals("")) {
		return sqlSession.selectList("event.cvseventlist",map);
	}*/
}
	//사용자 이벤트 결과 리스트 불러오기
	public List<EventResult> resultEventList(String keyword, int startRow, int endRow) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startRow", startRow); 
		map.put("endRow", endRow);
		
		return sqlSession.selectList("event.resulteventlist",map);
	}
	//관리자 검색 후 게시글 갯수
	public int listCount(String keyword, int user_no) {
		Map<String,Object> map = new HashMap<String,Object>();
		
		if(!keyword.equals("")){
			map.put("mainkeyword", "%"+keyword+"%");
			map.put("subkeyword", "%"+keyword+"%");
			return sqlSession.selectOne("event.getSearchCount",map);
		}else if(user_no==2) {
			return sqlSession.selectOne("event.gsListCount");
			
		}else if(user_no==3) {
			return sqlSession.selectOne("event.cuListCount");
		}else if(user_no==4) {
			return sqlSession.selectOne("event.sevenListCount");
		}
		else{
			return sqlSession.selectOne("event.getListCount");
		}
	}
	
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
		return sqlSession.update("event.eventDelete", no);
	}
	
	//글쓰기
	public void cvseventwriteview(Event vo) {
		  sqlSession.insert("event.cvseventwrite", vo); 
	}

	public Event cvsEventDetail(int eno) {
		// 이벤트 상세보기
		return sqlSession.selectOne("event.cvsEventDetail", eno);
	}

	//수정하기 페이지로 이동
	public Event updateEvent(int no) {
		Event event = sqlSession.selectOne("event.cvseventmodifyview", no);
		return event;
	}
	//수정하기 완료
	public int updateEventPage(Event event) {
		int result = sqlSession.update("event.cvseventmodifywrite", event);
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
	
	
	//이벤트 참여 dao
	public ArrayList<EventJoin> selectEventJoinList() {
		// TODO Auto-generated method stub
		  ArrayList<EventJoin> list = (ArrayList)sqlSession.selectList("event.selectEventJoinList");
	      return list;
	}

	public EventJoin selectEventJoin(EventJoin eventjoin) {
		// TODO Auto-generated method stub
		 return sqlSession.selectOne("event.selectEventJoin",eventjoin);
	}

	public int eventJoinCount(int event_no) {
		// TODO Auto-generated method stub
		 return sqlSession.selectOne("event.eventJoinCount",event_no);
	}
	
	

	public void insertEventJoin(EventJoin eventjoin) {
		System.out.println(eventjoin);
		sqlSession.insert("event.insertEventJoin",eventjoin);
		
		
	}

	public void deleteEventJoin(EventJoin eventjoin) {
		sqlSession.delete("event.deleteEventJoin",eventjoin);
		
	}
	//이벤트 결과 글쓰기
	public void cvseventResultView(EventResult eventResult) {
		// TODO Auto-generated method stub
		System.out.println("dao"+eventResult);
		sqlSession.insert("event.cvseventResultwrite", eventResult); 
		
	}
	//이벤트 참여----------------------------------------------------------
	public int eventJoincheck(EventJoin eventjoin) {
		return sqlSession.selectOne("event.eventJoincheck", eventjoin);
	}

	public List<Event> cvsEvent(int startRow, int endRow, int brand_no) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("startRow", startRow); 
		map.put("endRow", endRow);
		map.put("brand_no",brand_no);
		return sqlSession.selectList("event.cvsEvent", map);
	}

	public int cvsGetListCount(int brand_no, int user_no) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("brand_no",brand_no);
		map.put("user_no",user_no);
		return sqlSession.selectOne("event.cvsGetListCount",map);
	}
//-------------------------------------------------------------------
	//진행중,종료된 이벤트 리스트 출력
	public List<Event> selectEventList(int startRow, int endRow, int edno) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("edno", edno);
		return sqlSession.selectList("event.cvsEventDate",map);
	}

	public int edlistCount(int edno) {
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("endo", edno);
		return sqlSession.selectOne("event.edlistCount",map);
	}
	

	
}
