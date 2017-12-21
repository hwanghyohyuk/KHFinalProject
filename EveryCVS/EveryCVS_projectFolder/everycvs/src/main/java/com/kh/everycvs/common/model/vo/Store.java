package com.kh.everycvs.common.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class Store implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1500L;

	/* Field */
	private String store_no; //지점번호
	private String store_name; //지점명
	private String loc_l_code; //시도코드
	private String loc_l_name; //시도명
	private String loc_m_code; //구군코드
	private String loc_m_name; //구군명
	private String loc_s_code; //법정동코드
	private String loc_s_name; //법정동명
	private String road_address; //도로명주소
	private String num_address; //지번주소
	private String lat; //위도
	private String lng; //경도
	private int brand_no; //상호번호
	private int join_count; //방문횟수
	private String brand_name; //상호명
	private int salequantity; //판매량
	private String del_check; // 삭제구분
	private String enroll_no; // 가입번호
	
	public Store() {
		super();
	}

	public Store(String store_no, String store_name, String loc_l_code, String loc_l_name, String loc_m_code,
			String loc_m_name, String loc_s_code, String loc_s_name, String road_address, String num_address,
			String lat, String lng, int brand_no, int join_count, String brand_name, int salequantity,
			String del_check) {
		super();
		this.store_no = store_no;
		this.store_name = store_name;
		this.loc_l_code = loc_l_code;
		this.loc_l_name = loc_l_name;
		this.loc_m_code = loc_m_code;
		this.loc_m_name = loc_m_name;
		this.loc_s_code = loc_s_code;
		this.loc_s_name = loc_s_name;
		this.road_address = road_address;
		this.num_address = num_address;
		this.lat = lat;
		this.lng = lng;
		this.brand_no = brand_no;
		this.join_count = join_count;
		this.brand_name = brand_name;
		this.salequantity = salequantity;
		this.del_check = del_check;
	}
	

	public Store(String store_no, String store_name, String loc_l_code, String loc_l_name, String loc_m_code,
			String loc_m_name, String loc_s_code, String loc_s_name, String road_address, String num_address,
			String lat, String lng, int brand_no, int join_count, String brand_name, int salequantity, String del_check,
			String enroll_no) {
		super();
		this.store_no = store_no;
		this.store_name = store_name;
		this.loc_l_code = loc_l_code;
		this.loc_l_name = loc_l_name;
		this.loc_m_code = loc_m_code;
		this.loc_m_name = loc_m_name;
		this.loc_s_code = loc_s_code;
		this.loc_s_name = loc_s_name;
		this.road_address = road_address;
		this.num_address = num_address;
		this.lat = lat;
		this.lng = lng;
		this.brand_no = brand_no;
		this.join_count = join_count;
		this.brand_name = brand_name;
		this.salequantity = salequantity;
		this.del_check = del_check;
		this.enroll_no = enroll_no;
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

	public String getLoc_l_code() {
		return loc_l_code;
	}

	public void setLoc_l_code(String loc_l_code) {
		this.loc_l_code = loc_l_code;
	}

	public String getLoc_l_name() {
		return loc_l_name;
	}

	public void setLoc_l_name(String loc_l_name) {
		this.loc_l_name = loc_l_name;
	}

	public String getLoc_m_code() {
		return loc_m_code;
	}

	public void setLoc_m_code(String loc_m_code) {
		this.loc_m_code = loc_m_code;
	}

	public String getLoc_m_name() {
		return loc_m_name;
	}

	public void setLoc_m_name(String loc_m_name) {
		this.loc_m_name = loc_m_name;
	}

	public String getLoc_s_code() {
		return loc_s_code;
	}

	public void setLoc_s_code(String loc_s_code) {
		this.loc_s_code = loc_s_code;
	}

	public String getLoc_s_name() {
		return loc_s_name;
	}

	public void setLoc_s_name(String loc_s_name) {
		this.loc_s_name = loc_s_name;
	}

	public String getRoad_address() {
		return road_address;
	}

	public void setRoad_address(String road_address) {
		this.road_address = road_address;
	}

	public String getNum_address() {
		return num_address;
	}

	public void setNum_address(String num_address) {
		this.num_address = num_address;
	}

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public int getBrand_no() {
		return brand_no;
	}

	public void setBrand_no(int brand_no) {
		this.brand_no = brand_no;
	}

	public int getJoin_count() {
		return join_count;
	}

	public void setJoin_count(int join_count) {
		this.join_count = join_count;
	}

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}

	public int getSalequantity() {
		return salequantity;
	}

	public void setSalequantity(int salequantity) {
		this.salequantity = salequantity;
	}

	public String getDel_check() {
		return del_check;
	}

	public void setDel_check(String del_check) {
		this.del_check = del_check;
	}
	
	public String getEnroll_no() {
		return enroll_no;
	}

	public void setEnroll_no(String enroll_no) {
		this.enroll_no = enroll_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Store [store_no=" + store_no + ", store_name=" + store_name + ", loc_l_code=" + loc_l_code
				+ ", loc_l_name=" + loc_l_name + ", loc_m_code=" + loc_m_code + ", loc_m_name=" + loc_m_name
				+ ", loc_s_code=" + loc_s_code + ", loc_s_name=" + loc_s_name + ", road_address=" + road_address
				+ ", num_address=" + num_address + ", lat=" + lat + ", lng=" + lng + ", brand_no=" + brand_no
				+ ", join_count=" + join_count + ", brand_name=" + brand_name + ", salequantity=" + salequantity
				+ ", del_check=" + del_check + ", enroll_no=" + enroll_no + "]";
	}

	
}