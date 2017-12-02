package com.kh.everycvs.common.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class Sale implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1800L;

	private int sale_no;
	private String store_no;
	private int brand_no;
	private int product_no;
	private String product_name;
	private int product_kind_no;
	private int sale_quantity;
	private int calculated_price;
	private int using_point;
	private Date sale_date;
	private int user_no;
	private String user_name;
	private String phone_nick;

	public Sale() {
		super();
	}

	public Sale(int sale_no, String store_no, int brand_no, int product_no, String product_name, int product_kind_no,
			int sale_quantity, int calculated_price, int using_point, Date sale_date, int user_no, String user_name,
			String phone_nick) {
		super();
		this.sale_no = sale_no;
		this.store_no = store_no;
		this.brand_no = brand_no;
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_kind_no = product_kind_no;
		this.sale_quantity = sale_quantity;
		this.calculated_price = calculated_price;
		this.using_point = using_point;
		this.sale_date = sale_date;
		this.user_no = user_no;
		this.user_name = user_name;
		this.phone_nick = phone_nick;
	}

	public int getSale_no() {
		return sale_no;
	}

	public void setSale_no(int sale_no) {
		this.sale_no = sale_no;
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

	public int getProduct_kind_no() {
		return product_kind_no;
	}

	public void setProduct_kind_no(int product_kind_no) {
		this.product_kind_no = product_kind_no;
	}

	public int getSale_quantity() {
		return sale_quantity;
	}

	public void setSale_quantity(int sale_quantity) {
		this.sale_quantity = sale_quantity;
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

	public Date getSale_date() {
		return sale_date;
	}

	public void setSale_date(Date sale_date) {
		this.sale_date = sale_date;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPhone_nick() {
		return phone_nick;
	}

	public void setPhone_nick(String phone_nick) {
		this.phone_nick = phone_nick;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Sale [sale_no=" + sale_no + ", store_no=" + store_no + ", brand_no=" + brand_no + ", product_no="
				+ product_no + ", product_name=" + product_name + ", product_kind_no=" + product_kind_no
				+ ", sale_quantity=" + sale_quantity + ", calculated_price=" + calculated_price + ", using_point="
				+ using_point + ", sale_date=" + sale_date + ", user_no=" + user_no + ", user_name=" + user_name
				+ ", phone_nick=" + phone_nick + "]";
	}

}
