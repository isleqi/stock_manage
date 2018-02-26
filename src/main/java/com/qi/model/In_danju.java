package com.qi.model;

public class In_danju {
	private int in_dnum;
    private Product product;
    private String pnum;

	private int snum;
	private int num;
	private In_person_info in_person_info;
	private String in_person;
	private String in_company;
	
	public int dnum;
	public  String units;         //为了结果的处理而设置（补坑。。。。）
	public  String person;
	public String tel;
	
	private String time;
	private String date;
	
	public String massage=null;    //储存单据的错误信息

	
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum=pnum;
	}
	
	public String getIn_person() {
		return in_person;
	}
	public void setIn_person(String in_person) {
		this.in_person=in_person;
	}
	public String getIn_company() {
		return in_company;
	}
	public void setIn_company(String in_company) {
		this.in_company=in_company;
	}
	
	public String getDate () {
		return date;
	}
	public void setDate(String date) {
		this.date=date;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time=time;
	}
	
	public In_person_info getIn_person_info() {
		return in_person_info;
	}
	public void setIn_person_info(In_person_info in_person_info) {
		this.in_person_info=in_person_info;
	}
	
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product=product;
	}
	
    public int getIn_dnum() {
		return in_dnum;
	}
	public void setIn_dnum(int in_dnum) {
		this.in_dnum=in_dnum;
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
