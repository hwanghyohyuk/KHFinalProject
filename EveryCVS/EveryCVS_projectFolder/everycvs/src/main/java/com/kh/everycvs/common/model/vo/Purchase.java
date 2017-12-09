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
	private int user_no; //사용자번호
	private String product_name; //상품명
	private String store_name; //지점명
	private int purchase_quantity; //구매수량
	private int calculated_price; //계산가격
	private int accumulate_point; //적립포인트
	
	public Purchase() {
		super();
	}

	public Purchase(int user_no, String product_name, String store_name, int purchase_quantity, int calculated_price,
			int accumulate_point) {
		super();
		this.user_no = user_no;
		this.product_name = product_name;
		this.store_name = store_name;
		this.purchase_quantity = purchase_quantity;
		this.calculated_price = calculated_price;
		this.accumulate_point = accumulate_point;
	}
	
	/* Getter & Setter */
	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
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

	public int getAccumulate_point() {
		return accumulate_point;
	}

	public void setAccumulate_point(int accumulate_point) {
		this.accumulate_point = accumulate_point;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/* ToString */
	@Override
	public String toString() {
		return user_no + ", " + product_name + ", " + store_name + ", " + purchase_quantity + ", " + calculated_price + ", " + accumulate_point;
	}

}
