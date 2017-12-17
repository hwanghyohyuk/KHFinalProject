package com.kh.everycvs.common.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Product implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1000L;

	/* Field */
	private int product_no; // 상품번호
	private String product_name; // 상품명
	private String manufacturer; // 제조사
	private int price; // 가격
	private int expiration_date; // 유통기한
	private int product_kind_no; // 상품종류번호
	private String product_kind_name; // 상품종류명
	private int brand_no; // 상호번호
	private String brand_name;// 상호명
	private String original_file_name; // 첨부파일기존명
	private String stored_file_name; // 첨부파일변경명
	private String del_check; // 삭제구분
	private int purchase_count; // 구매횟수

	public Product() {
		super();
	}

	public Product(int product_no, String product_name, String manufacturer, int price, int expiration_date,
			int product_kind_no, String product_kind_name, int brand_no, String brand_name, String original_file_name,
			String stored_file_name, String del_check, int purchase_count) {
		super();
		this.product_no = product_no;
		this.product_name = product_name;
		this.manufacturer = manufacturer;
		this.price = price;
		this.expiration_date = expiration_date;
		this.product_kind_no = product_kind_no;
		this.product_kind_name = product_kind_name;
		this.brand_no = brand_no;
		this.brand_name = brand_name;
		this.original_file_name = original_file_name;
		this.stored_file_name = stored_file_name;
		this.del_check = del_check;
		this.purchase_count = purchase_count;
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

	public String getManufacturer() {
		return manufacturer;
	}

	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getExpiration_date() {
		return expiration_date;
	}

	public void setExpiration_date(int expiration_date) {
		this.expiration_date = expiration_date;
	}

	public int getProduct_kind_no() {
		return product_kind_no;
	}

	public void setProduct_kind_no(int product_kind_no) {
		this.product_kind_no = product_kind_no;
	}

	public String getProduct_kind_name() {
		return product_kind_name;
	}

	public void setProduct_kind_name(String product_kind_name) {
		this.product_kind_name = product_kind_name;
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

	public int getPurchase_count() {
		return purchase_count;
	}

	public void setPurchase_count(int purchase_count) {
		this.purchase_count = purchase_count;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Product [product_no=" + product_no + ", product_name=" + product_name + ", manufacturer=" + manufacturer
				+ ", price=" + price + ", expiration_date=" + expiration_date + ", product_kind_no=" + product_kind_no
				+ ", product_kind_name=" + product_kind_name + ", brand_no=" + brand_no + ", brand_name=" + brand_name
				+ ", original_file_name=" + original_file_name + ", stored_file_name=" + stored_file_name
				+ ", del_check=" + del_check + ", purchase_count=" + purchase_count + "]";
	}

}
