package com.kh.everycvs.common.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class StoreProduct implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1600L;

	/* Field */
	private int store_product_no; // 지점상품번호
	private String store_no; // 지점번호
	private int product_no; // 상품번호
	private String product_name; // 상품명
	private String manufacturer; // 제조사
	private int price; // 가격
	private Date manufacture_date; // 제조일
	private int expiration_date; // 유통기한
	private int expiration_hour; // 유통시간
	private int quantity; // 수량
	private int product_kind_no; // 상품종류번호
	private String product_kind_name; // 상품종류명
	private int brand_no; // 상호번호
	private String original_file_name; // 첨부파일기존명
	private String stored_file_name; // 첨부파일변경명
	private String del_check; // 삭제구분
	private int purchase_count; // 구매횟수
	private int discount_no;
	private String discount_info;

	public StoreProduct() {
		super();
	}

	public StoreProduct(int store_product_no, String store_no, int product_no, String product_name, String manufacturer,
			int price, Date manufacture_date, int expiration_date, int expiration_hour, int quantity,
			int product_kind_no, String product_kind_name, int brand_no, String original_file_name,
			String stored_file_name, String del_check, int purchase_count) {
		super();
		this.store_product_no = store_product_no;
		this.store_no = store_no;
		this.product_no = product_no;
		this.product_name = product_name;
		this.manufacturer = manufacturer;
		this.price = price;
		this.manufacture_date = manufacture_date;
		this.expiration_date = expiration_date;
		this.expiration_hour = expiration_hour;
		this.quantity = quantity;
		this.product_kind_no = product_kind_no;
		this.product_kind_name = product_kind_name;
		this.brand_no = brand_no;
		this.original_file_name = original_file_name;
		this.stored_file_name = stored_file_name;
		this.del_check = del_check;
		this.purchase_count = purchase_count;
	}

	public StoreProduct(int store_product_no, String store_no, int product_no, String product_name, String manufacturer,
			int price, Date manufacture_date, int expiration_date, int expiration_hour, int quantity,
			int product_kind_no, String product_kind_name, int brand_no, String original_file_name,
			String stored_file_name, String del_check, int purchase_count, int discount_no, String discount_info) {
		super();
		this.store_product_no = store_product_no;
		this.store_no = store_no;
		this.product_no = product_no;
		this.product_name = product_name;
		this.manufacturer = manufacturer;
		this.price = price;
		this.manufacture_date = manufacture_date;
		this.expiration_date = expiration_date;
		this.expiration_hour = expiration_hour;
		this.quantity = quantity;
		this.product_kind_no = product_kind_no;
		this.product_kind_name = product_kind_name;
		this.brand_no = brand_no;
		this.original_file_name = original_file_name;
		this.stored_file_name = stored_file_name;
		this.del_check = del_check;
		this.purchase_count = purchase_count;
		this.discount_no = discount_no;
		this.discount_info = discount_info;
	}

	/* Getter & Setter */
	public int getStore_product_no() {
		return store_product_no;
	}

	public void setStore_product_no(int store_product_no) {
		this.store_product_no = store_product_no;
	}

	public String getStore_no() {
		return store_no;
	}

	public void setStore_no(String store_no) {
		this.store_no = store_no;
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

	public Date getManufacture_date() {
		return manufacture_date;
	}

	public void setManufacture_date(Date manufacture_date) {
		this.manufacture_date = manufacture_date;
	}

	public int getExpiration_date() {
		return expiration_date;
	}

	public void setExpiration_date(int expiration_date) {
		this.expiration_date = expiration_date;
	}

	public int getExpiration_hour() {
		return expiration_hour;
	}

	public void setExpiration_hour(int expiration_hour) {
		this.expiration_hour = expiration_hour;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
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

	public int getDiscount_no() {
		return discount_no;
	}

	public void setDiscount_no(int discount_no) {
		this.discount_no = discount_no;
	}

	public String getDiscount_info() {
		return discount_info;
	}

	public void setDiscount_info(String discount_info) {
		this.discount_info = discount_info;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/* ToString */
	@Override
	public String toString() {
		return "StoreProduct [store_product_no=" + store_product_no + ", store_no=" + store_no + ", product_no="
				+ product_no + ", product_name=" + product_name + ", manufacturer=" + manufacturer + ", price=" + price
				+ ", manufacture_date=" + manufacture_date + ", expiration_date=" + expiration_date
				+ ", expiration_hour=" + expiration_hour + ", quantity=" + quantity + ", product_kind_no="
				+ product_kind_no + ", product_kind_name=" + product_kind_name + ", brand_no=" + brand_no
				+ ", original_file_name=" + original_file_name + ", stored_file_name=" + stored_file_name
				+ ", del_check=" + del_check + ", purchase_count=" + purchase_count + ", discount_no=" + discount_no
				+ ", discount_info=" + discount_info + "]";
	}

}
