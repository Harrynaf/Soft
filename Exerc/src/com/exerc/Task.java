package com.exerc;

import java.io.Serializable;


public class Task implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String email;
	private String skillneed;
	private String payment;
	private String description;
	private Boolean remote;
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
}
