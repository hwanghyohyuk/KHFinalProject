package com.kh.everycvs.common.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class EventJoin implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 600L;

	/* Field */
	private int event_no; //이벤트번호
	private int user_no; //사용자번호
	private String user_name; //사용자이름
	
	public EventJoin() {
		super();
	}

	public EventJoin(int event_no, int user_no, String user_name) {
		super();
		this.event_no = event_no;
		this.user_no = user_no;
		this.user_name = user_name;
	}
	
	
	public EventJoin(int event_no, int user_no) {
		super();
		this.event_no = event_no;
		this.user_no = user_no;
	}

	/* Getter & Setter */
	public int getEvent_no() {
		return event_no;
	}

	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/* ToString */
	@Override
	public String toString() {
		return event_no + ", " + user_no + ", " + user_name;
	}

}
