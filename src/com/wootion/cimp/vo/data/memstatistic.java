package com.wootion.cimp.vo.data;

public class memstatistic implements java.io.Serializable
{
	private static final long serialVersionUID = 1L;

	private String workid ;
	private String membername;
	
	private String totaltime;
	
	private String mylandlinenumber;
	
	private String myaddress;
	
	private String startservedate;
	
	private String endservedate;

	public memstatistic(){}
	public memstatistic(String workid,String membername,String mylandlinenumber,String myaddress,String startservedate,String endservedate,String totaltime){
		this.workid = workid;
		this.membername = membername;
		this.totaltime = totaltime;
		this.mylandlinenumber = mylandlinenumber;
		this.myaddress = myaddress ;
		this.startservedate = startservedate;
		this.endservedate = endservedate;
	}
	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public String getTotaltime() {
		return totaltime;
	}

	public void setTotaltime(String totaltime) {
		this.totaltime = totaltime;
	}
	public String getMylandlinenumber() {
		return mylandlinenumber;
	}
	public void setMylandlinenumber(String mylandlinenumber) {
		this.mylandlinenumber = mylandlinenumber;
	}
	public String getMyaddress() {
		return myaddress;
	}
	public void setMyaddress(String myaddress) {
		this.myaddress = myaddress;
	}
	public String getWorkid() {
		return workid;
	}
	public void setWorkid(String workid) {
		this.workid = workid;
	}
	public String getStartservedate() {
		return startservedate;
	}
	public void setStartservedate(String startservedate) {
		this.startservedate = startservedate;
	}
	public String getEndservedate() {
		return endservedate;
	}
	public void setEndservedate(String endservedate) {
		this.endservedate = endservedate;
	}

}