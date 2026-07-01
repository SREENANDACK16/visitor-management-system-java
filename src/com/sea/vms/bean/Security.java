package com.sea.vms.bean;

import java.io.InputStream;


public class Security {
	
	
	long passid;
	InputStream image;
	InputStream document;
	String status;
	public Security() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Security( long passid, InputStream image, InputStream document, String status) {
		super();
		
		this.passid = passid;
		this.image = image;
		this.document = document;
		this.status = status;
	}
	
	public long getPassid() {
		return passid;
	}
	public void setPassid(long passid) {
		this.passid = passid;
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
	@Override
	public String toString() {
		return "Security [ passid=" + passid + ", image=" + image + ", document=" + document
				+ ", status=" + status + "]";
	}
	

}
