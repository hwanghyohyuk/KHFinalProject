package com.kh.everycvs.common.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class ProductKind implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1100L;

	/* Field */
	private int product_kind_no; //상품종류번호
	private String product_kind_name; //상품종류명
	
	public ProductKind() {
		super();
	}

	public ProductKind(int product_kind_no, String product_kind_name) {
		super();
		this.product_kind_no = product_kind_no;
		this.product_kind_name = product_kind_name;
	}
	
	/* Getter & Setter */
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/* ToString */
	@Override
	public String toString() {
		return product_kind_no + ", " + product_kind_name;
	}

}
