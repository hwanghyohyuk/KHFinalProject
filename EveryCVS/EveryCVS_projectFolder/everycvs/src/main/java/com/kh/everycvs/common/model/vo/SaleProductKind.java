package com.kh.everycvs.common.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class SaleProductKind implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1900L;

	private String store_no;
	private int brand_no;
	private int product_kind_no;
	private String product_kind_name;
	private int sale_quantity;

	public SaleProductKind() {
		super();
	}

	public SaleProductKind(String store_no, int brand_no, int product_kind_no, String product_kind_name,
			int sale_quantity) {
		super();
		this.store_no = store_no;
		this.brand_no = brand_no;
		this.product_kind_no = product_kind_no;
		this.product_kind_name = product_kind_name;
		this.sale_quantity = sale_quantity;
	}

	public String getStore_no() {
		return store_no;
	}

	public void setStore_no(String store_no) {
		this.store_no = store_no;
	}

	public int getBrand_no() {
		return brand_no;
	}

	public void setBrand_no(int brand_no) {
		this.brand_no = brand_no;
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

	public int getSale_quantity() {
		return sale_quantity;
	}

	public void setSale_quantity(int sale_quantity) {
		this.sale_quantity = sale_quantity;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "SaleProductKind [store_no=" + store_no + ", brand_no=" + brand_no + ", product_kind_no="
				+ product_kind_no + ", product_kind_name=" + product_kind_name + ", sale_quantity=" + sale_quantity
				+ "]";
	}

}
