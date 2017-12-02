package com.kh.everycvs.common.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Favorite implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 800L;

	/* Field */
	private int user_no; //사용자번호
	private int brand_no; //상호번호
	private String brand_name; //상호명
	private String store_no; //지점번호 
	private String store_name; //지점명
	private int product_no; //상품번호
	private String product_name; //상품명
	private String stored_file_name; //첨부파일변경명
	private int store_product_no; //지점상품번호
	private int min_expiration_hour; //최소유통기한
	
	public Favorite() {
		super();
	}

	public Favorite(int user_no, int brand_no, String brand_name, String store_no, String store_name, int product_no,
			String product_name, String stored_file_name, int store_product_no, int min_expiration_day) {
		super();
		this.user_no = user_no;
		this.brand_no = brand_no;
		this.brand_name = brand_name;
		this.store_no = store_no;
		this.store_name = store_name;
		this.product_no = product_no;
		this.product_name = product_name;
		this.stored_file_name = stored_file_name;
		this.store_product_no = store_product_no;
		this.min_expiration_hour = min_expiration_day;
	}
	
	/* Getter & Setter */
	
	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getBrand_no() {
		return brand_no;
	}

	public void setBrand_no(int brand_no) {
		this.brand_no = brand_no;
	}

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	public String getStore_no() {
		return store_no;
	}

	public void setStore_no(String store_no) {
		this.store_no = store_no;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getStored_file_name() {
		return stored_file_name;
	}

	public void setStored_file_name(String stored_file_name) {
		this.stored_file_name = stored_file_name;
	}

	public int getStore_product_no() {
		return store_product_no;
	}

	public void setStore_product_no(int store_product_no) {
		this.store_product_no = store_product_no;
	}

	public int getMin_expiration_hour() {
		return min_expiration_hour;
	}

	public void setMin_expiration_hour(int min_expiration_hour) {
		this.min_expiration_hour = min_expiration_hour;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/* ToString */
	@Override
	public String toString() {
		return user_no + ", " + brand_no + ", " + brand_name + ", " + store_no + ", " + store_name + ", " + product_no + ", " + product_name + ", " + 
			   stored_file_name + ", " + store_product_no + ", " + min_expiration_hour;
	}

}
