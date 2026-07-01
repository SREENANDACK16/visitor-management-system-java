package com.sea.vms.bean;

import java.io.InputStream;
import java.util.Date;

public class Pass {
	
	 long passid;
	long adharid;
	String vname;
	String company;
	String doc;
	Date fdate;
	Date tdate;
	String reason;
	InputStream image;
	InputStream document;
	String status;
	
	private String imageBase64;
	private String documentBase64;
	public Pass() {
		
		super();
		// TODO Auto-generated constructor stub
	}
	public Pass(long passid, long adharid, String vname, String company, String doc, Date fdate, Date tdate,
			String reason, InputStream image, InputStream document, String status) {
		super();
		this.passid = passid;
		this.adharid = adharid;
		this.vname = vname;
		this.company = company;
		this.doc = doc;
		this.fdate = fdate;
		this.tdate = tdate;
		this.reason = reason;
		this.image = image;
		this.document = document;
		this.status = status;
		this.image = image;
		this.document = document;
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
	public InputStream getImage() {
		return image;
	}
	public void setImage(InputStream image) {
		this.image = image;
	}
	public InputStream getDocument() {
		return document;
	}
	public void setDocument(InputStream document) {
		this.document = document;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getImageBase64() {
		return imageBase64;
	}
	public void setImageBase64(String imageBase64) {
		this.imageBase64 = imageBase64;
	}
	public String getDocumentBase64() {
		return documentBase64;
	}
	public void setDocumentBase64(String documentBase64) {
		this.documentBase64 = documentBase64;
	}
	@Override
	public String toString() {
		return "Pass [passid=" + passid + ", adharid=" + adharid + ", vname=" + vname + ", company=" + company
				+ ", doc=" + doc + ", fdate=" + fdate + ", tdate=" + tdate + ", reason=" + reason + ", image=" + image
				+ ", document=" + document + ", status=" + status + ", imageBase64=" + imageBase64 + ", documentBase64="
				+ documentBase64 + "]";
	}
	
	


}
