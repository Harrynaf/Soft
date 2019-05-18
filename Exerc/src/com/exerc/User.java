package com.exerc;

import java.io.Serializable;


public class User implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String email;
	private String pass;
	private String nick;
	private String dot;
	private String country;
	private String skill;
	public String getemail() {
		return email;
	}
	public void setemail(String email) {
		this.email = email;
	}
	public String getpass() {
		return pass;
	}
	public void setpass(String pass) {
		this.pass = pass;
	}
	public String getnick() {
		return nick;
	}
	public void setnick(String nick) {
		this.nick = nick;
	}
	public String getdot() {
		return dot;
	}
	public void setdot(String dot) {
		this.dot = dot;
	}
	public String getcountry() {
		return country;
	}
	public void setcountry(String country) {
		this.country = country;
	}
	public String getskill() {
		return skill;
	}
	public void setskill(String skill) {
		this.skill = skill;
	}
}
