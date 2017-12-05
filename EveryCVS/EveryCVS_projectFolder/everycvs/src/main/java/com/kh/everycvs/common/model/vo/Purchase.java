package com.kh.everycvs.common.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Purchase implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1200L;

	/* Field */
	private int purchase_no; // 구매번호
	private int user_no; // 사용자번호
	private int store_product_no; // 지점상품번호
	private String store_no; // 지점번호
	private String store_name; // 지점명
	private int product_no; // 상품번호
	private String product_name; // 상품명
	private int purchase_quantity; // 구매수량
	private int calculated_price; // 계산가격
	private int using_point; // 사용포인트
	private int accumulate_point; // 적립포인트
	private int purchase_date; // 구매날짜

	/* Constructer */
	public Purchase() {
		super();
	}

	public Purchase(int purchase_no, int user_no, int store_product_no, String store_no, String store_name,
			int product_no, String product_name, int purchase_quantity, int calculated_price, int using_point,
			int accumulate_point, int purchase_date) {
		super();
		this.purchase_no = purchase_no;
		this.user_no = user_no;
		this.store_product_no = store_product_no;
		this.store_no = store_no;
		this.store_name = store_name;
		this.product_no = product_no;
		this.product_name = product_name;
		this.purchase_quantity = purchase_quantity;
		this.calculated_price = calculated_price;
		this.using_point = using_point;
		this.accumulate_point = accumulate_point;
		this.purchase_date = purchase_date;
	}

	/* Getter & Setter */

	public int getPurchase_no() {
		return purchase_no;
	}

	public void setPurchase_no(int purchase_no) {
		this.purchase_no = purchase_no;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

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

	public int getCalculated_price() {
		return calculated_price;
	}

	public void setCalculated_price(int calculated_price) {
		this.calculated_price = calculated_price;
	}

	public int getUsing_point() {
		return using_point;
	}

	public void setUsing_point(int using_point) {
		this.using_point = using_point;
	}

	public int getAccumulate_point() {
		return accumulate_point;
	}

	public void setAccumulate_point(int accumulate_point) {
		this.accumulate_point = accumulate_point;
	}

	public int getPurchase_date() {
		return purchase_date;
	}

	public void setPurchase_date(int purchase_date) {
		this.purchase_date = purchase_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/* ToString */

	@Override
	public String toString() {
		return "Purchase [purchase_no=" + purchase_no + ", user_no=" + user_no + ", store_product_no="
				+ store_product_no + ", store_no=" + store_no + ", store_name=" + store_name + ", product_no="
				+ product_no + ", product_name=" + product_name + ", purchase_quantity=" + purchase_quantity
				+ ", calculated_price=" + calculated_price + ", using_point=" + using_point + ", accumulate_point="
				+ accumulate_point + ", purchase_date=" + purchase_date + "]";
	}

}
