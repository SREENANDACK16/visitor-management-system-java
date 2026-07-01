package com.sea.vms.bean;

import java.util.Date;

public class MyApplication {
	long passid;
	long adharid;
	Date fdate;
	Date tdate;
	String reason;
	public MyApplication() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MyApplication(long passid, long adharid, Date fdate, Date tdate, String reason) {
		super();
		this.passid = passid;
		this.adharid = adharid;
		this.fdate = fdate;
		this.tdate = tdate;
		this.reason = reason;
	}
	public long getPassid() {
		return passid;
	}
	public void setPassid(long passid) {
		this.passid = passid;
	}
	public long getAdharid() {
		return adharid;
	}
	public void setAdharid(long adharid) {
		this.adharid = adharid;
	}
	public Date getFdate() {
		return fdate;
	}
	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}
	public Date getTdate() {
		return tdate;
	}
	public void setTdate(Date tdate) {
		this.tdate = tdate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	@Override
	public String toString() {
		return "MyApplication [passid=" + passid + ", adharid=" + adharid + ", fdate=" + fdate + ", tdate=" + tdate
				+ ", reason=" + reason + "]";
	}
	

}
