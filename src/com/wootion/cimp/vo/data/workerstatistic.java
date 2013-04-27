package com.wootion.cimp.vo.data;

public class workerstatistic implements java.io.Serializable
{
    //统计表主鍵
    private String workid;
    //工作人员姓名
    private String workername;
    //人员工作时长
    private int worktime;
    //工作日期
    private String workdate;
    //工作时段
    private String duration;
    //工作内容
    private String workcontent;
    //工作人员部门
    private String department;
    //會員名稱
    private String membername;
    
    //護理表編號
    private String carenumber;
    
    //康復表編號
    private String recovernumber;
    
    //rownumber每張表固定行數編號
    private int linenumber;
    
    //会员是否经过经理确认 0：未确认 1：已确认 
    private String a1;
    //工作人员是否经过确认 0：未确认 1：已确认 
    private String a2;
    private String a3;
    private String a4;
    private String a5;
    private String a6;
    private String a7;
    private String a8;
    private String a9;
    // Constructors
    /** default constructor */
    public workerstatistic()
    {
    }
	public String getWorkid() {
		return workid;
	}
	public void setWorkid(String workid) {
		this.workid = workid;
	}
	public String getWorkername() {
		return workername;
	}
	public void setWorkername(String workername) {
		this.workername = workername;
	}
	public int getWorktime() {
		return worktime;
	}
	public void setWorktime(int worktime) {
		this.worktime = worktime;
	}
	public String getWorkdate() {
		return workdate;
	}
	public void setWorkdate(String workdate) {
		this.workdate = workdate;
	}
	public String getDuration() {
		return duration;
	}
	public void setDuration(String duration) {
		this.duration = duration;
	}
	public String getWorkcontent() {
		return workcontent;
	}
	public void setWorkcontent(String workcontent) {
		this.workcontent = workcontent;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getA1() {
		return a1;
	}
	public void setA1(String a1) {
		this.a1 = a1;
	}
	public String getA2() {
		return a2;
	}
	public void setA2(String a2) {
		this.a2 = a2;
	}
	public String getA3() {
		return a3;
	}
	public void setA3(String a3) {
		this.a3 = a3;
	}
	public String getA4() {
		return a4;
	}
	public void setA4(String a4) {
		this.a4 = a4;
	}
	public String getA5() {
		return a5;
	}
	public void setA5(String a5) {
		this.a5 = a5;
	}
	public String getA6() {
		return a6;
	}
	public void setA6(String a6) {
		this.a6 = a6;
	}
	public String getA7() {
		return a7;
	}
	public void setA7(String a7) {
		this.a7 = a7;
	}
	public String getA8() {
		return a8;
	}
	public void setA8(String a8) {
		this.a8 = a8;
	}
	public String getA9() {
		return a9;
	}
	public void setA9(String a9) {
		this.a9 = a9;
	}
	public String getMembername() {
		return membername;
	}
	public void setMembername(String membername) {
		this.membername = membername;
	}
	public String getCarenumber() {
		return carenumber;
	}
	public void setCarenumber(String carenumber) {
		this.carenumber = carenumber;
	}
	public String getRecovernumber() {
		return recovernumber;
	}
	public void setRecovernumber(String recovernumber) {
		this.recovernumber = recovernumber;
	}
	public int getLinenumber() {
		return linenumber;
	}
	public void setLinenumber(int linenumber) {
		this.linenumber = linenumber;
	}
}