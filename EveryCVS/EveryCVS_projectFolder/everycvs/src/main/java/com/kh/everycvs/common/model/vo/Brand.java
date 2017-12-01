package com.kh.everycvs.common.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Brand implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 200L;

	/* Field */
	private int brand_no; //상호번호
	private String brand_name; //상호명
	
	public Brand() {
		super();
	}

	public Brand(int brand_no, String brand_name) {
		super();
		this.brand_no = brand_no;
		this.brand_name = brand_name;
	}
	
	/* Getter & Setter */
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	/* ToString */
	@Override
	public String toString() {
		return brand_no + ", " + brand_name;
	}
	
}
