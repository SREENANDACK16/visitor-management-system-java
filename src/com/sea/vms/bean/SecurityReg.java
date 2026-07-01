package com.sea.vms.bean;

public class SecurityReg {

	String userid;
	String username;
	long phone;
	String address;
	String pswd;
	public SecurityReg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public SecurityReg(String userid, String username, long phone, String address, String pswd) {
		super();
		this.userid = userid;
		this.username = username;
		this.phone = phone;
		this.address = address;
		this.pswd = pswd;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPswd() {
		return pswd;
	}
	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	@Override
	public String toString() {
		return "SecurityReg [userid=" + userid + ", username=" + username + ", phone=" + phone + ", address=" + address
				+ ", pswd=" + pswd + "]";
	}
	
	
}
