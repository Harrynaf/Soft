package com.exerc;

import java.io.Serializable;


public class Multi implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String email;
	private String skillneed;
	private String skillneed1;
	private String skillneed2;
	private String payment;
	private String payment1;
	private String payment2;
	private String description;
	private Boolean remote;
	private int multtype;
	public String getemail() {
		return email;
	}
	public void setemail(String email) {
		this.email = email;
	}
	public String getskillneed() {
		return skillneed;
	}
	public void setskillneed(String skillneed) {
		this.skillneed = skillneed;
	}
	public String getskillneed1() {
		return skillneed1;
	}
	public void setskillneed1(String skillneed1) {
		this.skillneed1 = skillneed1;
	}
	public String getskillneed2() {
		return skillneed2;
	}
	public void setskillneed2(String skillneed2) {
		this.skillneed2 = skillneed2;
	}
	public String getpayment1() {
		return payment1;
	}
	public void setpayment1(String payment1) {
		this.payment1 = payment1;
	}
	public String getpayment2() {
		return payment2;
	}
	public void setpayment2(String payment2) {
		this.payment2 = payment2;
	}
	public String getpayment() {
		return payment;
	}
	public void setpayment(String payment) {
		this.payment = payment;
	}
	public String getdescription() {
		return description;
	}
	public void setdescription(String description) {
		this.description = description;
    }
	public Boolean getremote() {
		return remote;
	}
	public void setremote(Boolean remote) {
		this.remote = remote;
    }
	public Integer getmulttype() {
		return multtype;
	}
	public void setmulttype(Integer multtype) {
		this.multtype = multtype;
    }
}
