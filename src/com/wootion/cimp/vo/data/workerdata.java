package com.wootion.cimp.vo.data;

public class workerdata implements java.io.Serializable
{
	private static final long serialVersionUID = 1L;

	private String workid ;
	
	private String workername;
	
	private String totaltime;
	
	private String corpAdd;
	
	private String linkman_tel;
	
	private String startservedate;
	
	private String endservedate;

	public workerdata(){}
	public workerdata(String workid,String workername,String linkman_tel,String corpAdd,
		   String startservedate,String endservedate,String totaltime){
		this.workid = workid;
		this.workername = workername;
		this.totaltime = totaltime;
		this.linkman_tel = linkman_tel;
		this.corpAdd = corpAdd ;
		this.startservedate = startservedate;
		this.endservedate = endservedate;
	}
	

	public String getTotaltime() {
		return totaltime;
	}

	public void setTotaltime(String totaltime) {
		this.totaltime = totaltime;
	}
	public String getWorkername() {
		return workername;
	}
	public void setWorkername(String workername) {
		this.workername = workername;
	}
	public String getCorpAdd() {
		return corpAdd;
	}
	public void setCorpAdd(String corpAdd) {
		this.corpAdd = corpAdd;
	}
	public String getLinkman_tel() {
		return linkman_tel;
	}
	public void setLinkman_tel(String linkman_tel) {
		this.linkman_tel = linkman_tel;
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