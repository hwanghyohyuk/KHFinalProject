package com.kh.everycvs.common.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class EventResult implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 700L;

	/* Field */
	private int event_result_no; //글번호
	private int event_no; //이벤트번호
	private String title; //제목
	private int writer; //작성자
	private String user_name; //사용자이름
	private String contents; //내용
	private Date write_date; //작성일
	private int readcount; //조회수
	private String original_file_name; //첨부파일기존명
	private String stored_file_name; //첨부파일변경명
	private int brand_no; //상호번호
	private String del_check; //삭제구분
	
	public EventResult() {
		super();
	}
	

	public EventResult(int event_result_no, int event_no, String title, int writer, String contents, Date write_date,
			int readcount, String original_file_name, String stored_file_name, String del_check) {
		super();
		this.event_result_no = event_result_no;
		this.event_no = event_no;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.write_date = write_date;
		this.readcount = readcount;
		this.original_file_name = original_file_name;
		this.stored_file_name = stored_file_name;
		this.del_check = del_check;
	}


	public EventResult(int event_result_no, int event_no, String title, int writer, String user_name, String contents,
			Date write_date, int readcount, String original_file_name, String stored_file_name, int brand_no,
			String del_check) {
		super();
		this.event_result_no = event_result_no;
		this.event_no = event_no;
		this.title = title;
		this.writer = writer;
		this.user_name = user_name;
		this.contents = contents;
		this.write_date = write_date;
		this.readcount = readcount;
		this.original_file_name = original_file_name;
		this.stored_file_name = stored_file_name;
		this.brand_no = brand_no;
		this.del_check = del_check;
	}
	
	/* Getter & Setter */
	public int getEvent_result_no() {
		return event_result_no;
	}

	public void setEvent_result_no(int event_result_no) {
		this.event_result_no = event_result_no;
	}

	public int getEvent_no() {
		return event_no;
	}

	public void setEvent_no(int event_no) {
		this.event_no = event_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getWriter() {
		return writer;
	}

	public void setWriter(int writer) {
		this.writer = writer;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getOriginal_file_name() {
		return original_file_name;
	}

	public void setOriginal_file_name(String original_file_name) {
		this.original_file_name = original_file_name;
	}

	public String getStored_file_name() {
		return stored_file_name;
	}

	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}

	public int getBrand_no() {
		return brand_no;
	}

	public void setBrand_no(int brand_no) {
		this.brand_no = brand_no;
	}

	public String getDel_check() {
		return del_check;
	}

	public void setDel_check(String del_check) {
		this.del_check = del_check;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/* ToString */
	@Override
	public String toString() {
		return event_result_no + ", " + event_no + ", " + title + ", " + writer + ", " + user_name + ", " + contents + ", " + write_date + ", " + 
			   readcount + ", " + original_file_name + ", " + stored_file_name + ", " + brand_no + ", " + del_check;
	}

}
