package com.qi.model;

import java.sql.Date;

public class Out_danju {
	private int out_dnum;
    private Product product;
    private String pnum;
	private int snum;
	private int num;
	private Out_person_info out_person_info;
	private String out_person;
	private String out_company;
	
	public int dnum;
	public  String units;         //为了结果的处理而设置（补坑。。。。）
	public  String person;
	public String tel;
	
	
	private String time;
	private Date date;
	
	public String massage=null;    //储存单据的错误信息
	
		
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum=pnum;
	}
	
	public Date getDate () {
		return date;
	}
	public void setDate(Date date) {
		this.date=date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time=time;
	}
	public String getOut_person() {
		return out_person;
	}
	public void setOut_person(String out_person) {
		this.out_person=out_person;
	}
	public String getOut_company() {
		return out_company;
	}
	public void setOut_company(String out_company) {
		this.out_company=out_company;
	}
	public Out_person_info getOut_person_info() {
		return out_person_info;
	}
	public void setOut_person_info(Out_person_info out_person_info) {
		this.out_person_info=out_person_info;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product=product;
	}
	public int getOut_dnum() {
		return out_dnum;
	}
	
	public int getSnum() {
		return snum;
	}
	public void setSnum(int snum) {
		this.snum=snum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num=num;
	}

}
