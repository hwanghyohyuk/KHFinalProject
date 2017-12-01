package com.kh.everycvs.common.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Gifticon implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 900L;

	/* Field */
	private int gifticon_no; //기프티콘번호
	private int user_no; //사용자번호
	private String stored_file_name; //첨부파일변경명
	private int brand_no; //상호번호
	private String store_no; //지점번호
	private String store_name; //지점명
	private int product_no; //상품번호
	private String product_name; //상품명
	private int purchase_quantity; //구매수량
	private Date extinction_date; //만료일
	private String is_use; //사용여부
	private String barcode_img_name; //바코드이미지명 
	
	public Gifticon() {
		super();
	}

	public Gifticon(int gifticon_no, int user_no, String stored_file_name, int brand_no, String store_no,
			String store_name, int product_no, String product_name, int purchase_quantity, Date extinction_date,
			String is_use, String barcode_img_name) {
		super();
		this.gifticon_no = gifticon_no;
		this.user_no = user_no;
		this.stored_file_name = stored_file_name;
		this.brand_no = brand_no;
		this.store_no = store_no;
		this.store_name = store_name;
		this.product_no = product_no;
		this.product_name = product_name;
		this.purchase_quantity = purchase_quantity;
		this.extinction_date = extinction_date;
		this.is_use = is_use;
		this.barcode_img_name = barcode_img_name;
	}
	
	/* Getter & Setter */
	public int getGifticon_no() {
		return gifticon_no;
	}

	public void setGifticon_no(int gifticon_no) {
		this.gifticon_no = gifticon_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
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

	public int getPurchase_quantity() {
		return purchase_quantity;
	}

	public void setPurchase_quantity(int purchase_quantity) {
		this.purchase_quantity = purchase_quantity;
	}

	public Date getExtinction_date() {
		return extinction_date;
	}

	public void setExtinction_date(Date extinction_date) {
		this.extinction_date = extinction_date;
	}

	public String getIs_use() {
		return is_use;
	}

	public void setIs_use(String is_use) {
		this.is_use = is_use;
	}

	public String getBarcode_img_name() {
		return barcode_img_name;
	}

	public void setBarcode_img_name(String barcode_img_name) {
		this.barcode_img_name = barcode_img_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/* ToString */
	@Override
	public String toString() {
		return gifticon_no + ", " + user_no + ", " + stored_file_name + ", " + brand_no + ", " + store_no + ", " + store_name + ", " + 
			   product_no + ", " + product_name + ", " + purchase_quantity + ", " + extinction_date + ", " + is_use + ", " + barcode_img_name;
	}

}
