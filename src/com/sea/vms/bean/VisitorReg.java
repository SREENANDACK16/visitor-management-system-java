package com.sea.vms.bean;

public class VisitorReg {
	long adharid;
	String name;
	String address;
	long phone;
	String emailid;
	String pwd;
	String cpwd;
	public VisitorReg() {
		super();
		// TODO Auto-generated constructor stub
	}
	public VisitorReg(long adharid, String name, String address, long phone, String emailid, String pwd, String cpwd) {
		super();
		this.adharid = adharid;
		this.name = name;
		this.address = address;
		this.phone = phone;
		this.emailid = emailid;
		this.pwd = pwd;
		this.cpwd = cpwd;
	}
	public long getAdharid() {
		return adharid;
	}
	public void setAdharid(long adharid) {
		this.adharid = adharid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getCpwd() {
		return cpwd;
	}
	public void setCpwd(String cpwd) {
		this.cpwd = cpwd;
	}
	@Override
	public String toString() {
		return "VisitorReg [adharid=" + adharid + ", name=" + name + ", address=" + address + ", phone=" + phone
				+ ", emailid=" + emailid + ", pwd=" + pwd + ", cpwd=" + cpwd + "]";
	}
	

}
