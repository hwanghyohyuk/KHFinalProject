package com.kh.everycvs.common.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component
public class PassLink implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2200L;

	private String email;
	private String key;
	private Date end_time;

	public PassLink() {
		super();
	}

	public PassLink(String email, String key) {
		super();
		this.email = email;
		this.key = key;
	}

	public PassLink(String email, String key, Date end_time) {
		super();
		this.email = email;
		this.key = key;
		this.end_time = end_time;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public Date getEnd_time() {
		return end_time;
	}

	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "PassLink [email=" + email + ", key=" + key + ", end_time=" + end_time + "]";
	}

}
