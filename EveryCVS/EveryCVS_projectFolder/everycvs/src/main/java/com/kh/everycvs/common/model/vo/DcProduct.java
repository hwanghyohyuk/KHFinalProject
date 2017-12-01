package com.kh.everycvs.common.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class DcProduct implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 400L;

	/* Field */
	private String store_no; //지점번호
	private int product_no; //상품번호
	private int discount_no; //할인번호
	private String discount_name; //할인명
	private String discount_info; //할인정보
	
	public DcProduct() {
		super();
	}

	public DcProduct(String store_no, int product_no, int discount_no, String discount_name, String discount_info) {
		super();
		this.store_no = store_no;
		this.product_no = product_no;
		this.discount_no = discount_no;
		this.discount_name = discount_name;
		this.discount_info = discount_info;
	}
	
	/* Getter & Setter */
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

	public int getDiscount_no() {
		return discount_no;
	}

	public void setDiscount_no(int discount_no) {
		this.discount_no = discount_no;
	}

	public String getDiscount_name() {
		return discount_name;
	}

	public void setDiscount_name(String discount_name) {
		this.discount_name = discount_name;
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
		return store_no + ", " + product_no + ", " + discount_no + ", " + discount_name + ", " + discount_info;
	}
	
}
