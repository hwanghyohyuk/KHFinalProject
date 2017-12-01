package com.kh.everycvs.common.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class DcInfo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 300L;

	/* Field */
	private int discount_no; //할인번호
	private String discount_name; //할인명
	
	public DcInfo() {
		super();
	}
	
	public DcInfo(int discount_no, String discount_name) {
		super();
		this.discount_no = discount_no;
		this.discount_name = discount_name;
	}
	
	/* Getter & Setter */
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
	
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/* ToString */
	@Override
	public String toString() {
		return discount_no + ", " + discount_name;
	}

}
