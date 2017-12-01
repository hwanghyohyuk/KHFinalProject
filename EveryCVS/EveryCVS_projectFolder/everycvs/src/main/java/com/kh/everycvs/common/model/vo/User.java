package com.kh.everycvs.common.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1700L;

	/* Field */
	private int user_no; //사용자번호
	private String email; //이메일
	private String user_pwd; //비밀번호
	private String user_name; //이름
	private Date birth_date; //생년월일
	private String gender; //성별
	private String phone; //연락처
	private String address; //주소
	private Date enroll_date; //가입일
	private String original_file_name; //첨부파일기존명
	private String stored_file_name; //첨부파일변경명
	private int user_state; //상태
	private String job; //직책
	private int cash; //잔고
	private int point; //포인트
	private String store_no; //지점번호
	private int brand_no; //상호번호
	
	public User() {
		super();
	}

	public User(int user_no, String email, String user_pwd, String user_name, Date birth_date, String gender,
			String phone, String address, Date enroll_date, String original_file_name, String stored_file_name,
			int user_state, String job, int cash, int point, String store_no, int brand_no) {
		super();
		this.user_no = user_no;
		this.email = email;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.birth_date = birth_date;
		this.gender = gender;
		this.phone = phone;
		this.address = address;
		this.enroll_date = enroll_date;
		this.original_file_name = original_file_name;
		this.stored_file_name = stored_file_name;
		this.user_state = user_state;
		this.job = job;
		this.cash = cash;
		this.point = point;
		this.store_no = store_no;
		this.brand_no = brand_no;
	}
	
	/* Getter & Setter */
	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUser_pwd() {
		return user_pwd;
	}

	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Date getBirth_date() {
		return birth_date;
	}

	public void setBirth_date(Date birth_date) {
		this.birth_date = birth_date;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getEnroll_date() {
		return enroll_date;
	}

	public void setEnroll_date(Date enroll_date) {
		this.enroll_date = enroll_date;
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

	public int getUser_state() {
		return user_state;
	}

	public void setUser_state(int user_state) {
		this.user_state = user_state;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public int getCash() {
		return cash;
	}

	public void setCash(int cash) {
		this.cash = cash;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getStore_no() {
		return store_no;
	}

	public void setStore_no(String store_no) {
		this.store_no = store_no;
	}

	public int getBrand_no() {
		return brand_no;
	}

	public void setBrand_no(int brand_no) {
		this.brand_no = brand_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/* ToString */
	@Override
	public String toString() {
		return user_no + ", " + email + ", " + user_pwd + ", " + user_name + ", " + birth_date + ", " + gender + ", " + phone + ", " + address + ", " + 
			   enroll_date + ", " + original_file_name + ", " + stored_file_name + ", " + user_state + ", " + job + ", " + cash + ", " + point + ", " + 
			   store_no + ", " + brand_no;
	}

}
