package com.sea.vms.bean;

import java.util.Date;

public class Visitor {
  
	long passid;
	long adharid;
	String vname;
	String company;
	String doc;
	Date fdate;
	Date tdate;
	String reason;
	
	public Visitor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Visitor(long passid, long adharid, String vname, String company, String doc, Date fdate, Date tdate,
			String reason) {
		super();
		this.passid = passid;
		this.adharid = adharid;
		this.vname = vname;
		this.company = company;
		this.doc = doc;
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
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getDoc() {
		return doc;
	}
	public void setDoc(String doc) {
		this.doc = doc;
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
		return "Visitor [passid=" + passid + ", adharid=" + adharid + ", vname=" + vname + ", company=" + company
				+ ", doc=" + doc + ", fdate=" + fdate + ", tdate=" + tdate + ", reason=" + reason + "]";
	}
	
	
	


	
}
