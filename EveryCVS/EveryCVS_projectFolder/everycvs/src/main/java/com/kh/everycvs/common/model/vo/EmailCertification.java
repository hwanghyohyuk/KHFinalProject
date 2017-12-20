package com.kh.everycvs.common.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component
public class EmailCertification implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2000L;
	private String email;
	private String session_key; // 세션id
	private String certification_no;

	public EmailCertification() {
		super();
	}

	public EmailCertification(String email, String session_key, String certification_no) {
		super();
		this.email = email;
		this.session_key = session_key;
		this.certification_no = certification_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSession_key() {
		return session_key;
	}

	public void setSession_key(String session_key) {
		this.session_key = session_key;
	}

	public String getCertification_no() {
		return certification_no;
	}

	public void setCertification_no(String certification_no) {
		this.certification_no = certification_no;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "EmailCertification [email=" + email + ", session_key=" + session_key + ", certification_no="
				+ certification_no + "]";
	}

}
