package com.qi.model;

public class Product {
	private String pnum;
	private String pname;
	private String model;
	private String factory;
	private String size;
	
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size=size;
	}
	public String getFactory() {
		return factory;
	}
	public void setFactory(String factory) {
		this.factory=factory;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname=pname;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum=pnum;
	}
	public String getModle() {
		return model;
	}
	public void setModel(String model) {
		this.model=model;
	}

}
