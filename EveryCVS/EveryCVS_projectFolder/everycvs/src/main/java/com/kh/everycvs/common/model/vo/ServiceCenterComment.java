package com.kh.everycvs.common.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class ServiceCenterComment implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1400L;

	/* Field */
	private int service_comment_no; //댓글번호
	private int service_no; //문의번호
	private int writer; //작성자
	private String user_name; //사용자이름
	private String contents; //내용
	private Date write_date; //작성일
	private String del_check; //삭제구분
	
	public ServiceCenterComment() {
		super();
	}

	public ServiceCenterComment(int service_comment_no, int service_no, int writer, String user_name, String contents,
			Date write_date, String del_check) {
		super();
		this.service_comment_no = service_comment_no;
		this.service_no = service_no;
		this.writer = writer;
		this.user_name = user_name;
		this.contents = contents;
		this.write_date = write_date;
		this.del_check = del_check;
	}
	
	/* Getter & Setter */
	public int getService_comment_no() {
		return service_comment_no;
	}

	public void setService_comment_no(int service_comment_no) {
		this.service_comment_no = service_comment_no;
	}

	public int getService_no() {
		return service_no;
	}

	public void setService_no(int service_no) {
		this.service_no = service_no;
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
		return service_comment_no + ", " + service_no + ", " + writer + ", " + user_name + ", " + 
			   contents + ", " + write_date + ", " + del_check;
	}

}
