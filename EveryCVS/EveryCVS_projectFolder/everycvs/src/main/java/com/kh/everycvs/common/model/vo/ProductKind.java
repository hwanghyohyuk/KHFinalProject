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
	private int product_kind_no; // 상품종류번호
	private String product_kind_name; // 상품종류명
	private int brand_no; // 상호번호
	private String store_no; // 지점번호
	private int sale_quantity; // 판매량

	public ProductKind() {
		super();
	}

	public ProductKind(int product_kind_no, String product_kind_name, int brand_no, String store_no,
			int sale_quantity) {
		super();
		this.product_kind_no = product_kind_no;
		this.product_kind_name = product_kind_name;
		this.brand_no = brand_no;
		this.store_no = store_no;
		this.sale_quantity = sale_quantity;
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

	public int getSale_quantity() {
		return sale_quantity;
	}

	public void setSale_quantity(int sale_quantity) {
		this.sale_quantity = sale_quantity;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/* ToString */
	@Override
	public String toString() {
		return "ProductKind [product_kind_no=" + product_kind_no + ", product_kind_name=" + product_kind_name
				+ ", brand_no=" + brand_no + ", store_no=" + store_no + ", sale_quantity=" + sale_quantity + "]";
	}

}
