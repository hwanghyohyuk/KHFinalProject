package com.kh.everycvs.common.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ServiceCenter implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1300L;

	/* Field */
	private int service_no; //문의번호
	private String title; //제목
	private int writer; //작성자
	private String user_name; //사용자이름
	private String contents; //내용
	private Date write_date; //작성일
	private int readcount; //조회수
	private String original_file_name; //첨부파일기존명
	private String del_check; //삭제구분
	
	public ServiceCenter() {
		super();
	}

	public ServiceCenter(int service_no, String title, int writer, String user_name, String contents, Date write_date,
			int readcount, String original_file_name, String del_check) {
		super();
		this.service_no = service_no;
		this.title = title;
		this.writer = writer;
		this.user_name = user_name;
		this.contents = contents;
		this.write_date = write_date;
		this.readcount = readcount;
		this.original_file_name = original_file_name;
		this.del_check = del_check;
	}
	
	/* Getter & Setter */
	public int getService_no() {
		return service_no;
	}

	public void setService_no(int service_no) {
		this.service_no = service_no;
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
		return service_no + ", " + title + ", " + writer + ", " + user_name + ", " + contents + ", " + write_date + ", " + readcount + ", " + 
			   original_file_name + ", " + del_check;
	}

}
