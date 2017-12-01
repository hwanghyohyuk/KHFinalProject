package com.kh.everycvs.common.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Board implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 100L;

	/* Field */

	private int board_no;
	private String title;
	private int writer;
	private String user_name;
	private String contents;
	private Date write_date;
	private int readcount;
	private String original_file_name;
	private String stored_file_name;
	private String del_check;

	/* Constructer */
	public Board() {
		super();
	}

	public Board(int board_no, String title, int writer, String user_name, String contents, Date write_date,
			int readcount, String original_file_name, String stored_file_name, String del_check) {
		super();
		this.board_no = board_no;
		this.title = title;
		this.writer = writer;
		this.user_name = user_name;
		this.contents = contents;
		this.write_date = write_date;
		this.readcount = readcount;
		this.original_file_name = original_file_name;
		this.stored_file_name = stored_file_name;
		this.del_check = del_check;
	}

	/* Getter & Setter */
	
	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
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
		return "Board [board_no=" + board_no + ", title=" + title + ", writer=" + writer + ", user_name=" + user_name
				+ ", contents=" + contents + ", write_date=" + write_date + ", readcount=" + readcount
				+ ", original_file_name=" + original_file_name + ", stored_file_name=" + stored_file_name
				+ ", del_check=" + del_check + "]";
	}
}
