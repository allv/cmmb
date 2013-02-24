package com.wootion.cimp.vo.data;

import java.util.Date;

/**
 * TTemplate entity. @author MyEclipse Persistence Tools
 */

public class Project implements java.io.Serializable
{
    // Fields    
    //項目主鍵
    private String proid;
    //項目编号
    private String proidentity;
    //項目名称
    private String proname;
    //項目状态
    private String prostate;
    //項目负责人
    private String  proresponsor;
    //項目执行机构
    private String proagency;
    //項目权限 
    private String proauthority;
    //項目招标结果
    private String proresult;
    //合同编号
    private String procontract;
    //項目执行开始日期
    private String prostartdate;
    //項目执行结束日期
    private String proenddate;
    //项目总价值
    private String probudget;
    //拨款次数
    private String protimes;
    
    //项目简介
    private String prodesc;
   
    //所有标的名称
    private String trdata;
    
    //所有统计项名称
    private String tddata;
    
    private String r1;

    private String r2;
    
    private String r3;

    // Constructors

    /** default constructor */
    public Project()
    {
    }

    /** minimal constructor */
    public Project(String proid, String proidentity, String proname,
            String prostate,String proresponsor,String proagency,String proauthority,String proresult,String procontract,String prostartdate,String proenddate,String probudget,String protimes)
    {
        this.proid = proid;
        this.proidentity = proidentity;
        this.proname = proname;
        this.prostate = prostate;
        this.proresponsor = proresponsor;
        this.proagency = proagency;
        this.proauthority = proauthority;
        this.procontract = procontract;
        this.prostartdate = prostartdate;
        this.proenddate = proenddate;
        this.probudget = probudget;
        this.protimes = protimes;
       
    }
    // Property accessors

	public String getProid() {
		return proid;
	}

	public void setProid(String proid) {
		this.proid = proid;
	}

	public String getProidentity() {
		return proidentity;
	}

	public void setProidentity(String proidentity) {
		this.proidentity = proidentity;
	}

	public String getProname() {
		return proname;
	}

	public void setProname(String proname) {
		this.proname = proname;
	}

	public String getProstate() {
		return prostate;
	}

	public void setProstate(String prostate) {
		this.prostate = prostate;
	}

	public String getProresponsor() {
		return proresponsor;
	}

	public void setProresponsor(String proresponsor) {
		this.proresponsor = proresponsor;
	}

	public String getProagency() {
		return proagency;
	}

	public void setProagency(String proagency) {
		this.proagency = proagency;
	}

	public String getProauthority() {
		return proauthority;
	}

	public void setProauthority(String proauthority) {
		this.proauthority = proauthority;
	}

	public String getProresult() {
		return proresult;
	}

	public void setProresult(String proresult) {
		this.proresult = proresult;
	}

	public String getProcontract() {
		return procontract;
	}

	public void setProcontract(String procontract) {
		this.procontract = procontract;
	}

	public String getProstartdate() {
		return prostartdate;
	}

	public void setProstartdate(String prostartdate) {
		this.prostartdate = prostartdate;
	}

	public String getProenddate() {
		return proenddate;
	}

	public void setProenddate(String proenddate) {
		this.proenddate = proenddate;
	}

	public String getProbudget() {
		return probudget;
	}

	public void setProbudget(String probudget) {
		this.probudget = probudget;
	}

	public String getProtimes() {
		return protimes;
	}

	public void setProtimes(String protimes) {
		this.protimes = protimes;
	}

	public String getR1() {
		return r1;
	}

	public void setR1(String r1) {
		this.r1 = r1;
	}

	public String getR2() {
		return r2;
	}

	public void setR2(String r2) {
		this.r2 = r2;
	}

	public String getR3() {
		return r3;
	}

	public void setR3(String r3) {
		this.r3 = r3;
	}

	public String getTrdata() {
		return trdata;
	}

	public void setTrdata(String trdata) {
		this.trdata = trdata;
	}

	public String getTddata() {
		return tddata;
	}

	public void setTddata(String tddata) {
		this.tddata = tddata;
	}

	public String getProdesc() {
		return prodesc;
	}

	public void setProdesc(String prodesc) {
		this.prodesc = prodesc;
	}

	
   
}