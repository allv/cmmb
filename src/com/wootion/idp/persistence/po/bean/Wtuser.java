package com.wootion.idp.persistence.po.bean;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Wtuser entity.
 * 
 * @author MyEclipse Persistence Tools 用户信息实体类
 */

public class Wtuser implements java.io.Serializable {
    
    public static String Usabled = "1";
    public static String UnUsabled = "0";
    
	private String corpName;
	
	/** 所属部门*/
	private String department;
	private String corpAdd;
	private String corpNote;
	private Integer corpCode;
	private String corpTel;
	private String corpFax;
	private String corpAP;
	private String openBank;
	private String openName;
	private String bankID;
	private String linkman;
	private String linkmanTel;
	private String linkmanEmail;
	private String linkmanAdd;
	private Long wtuserId;
	private String wtuserLoginname;
	private String wtuserPassword;
	private Date wtuserCreatetime;
	private Date wtuserLogintime;
	private Date wtuserLastlogintime;
	private Integer wtuserLoginnumber = 0;
	private String wtuserIsuseable = "0";
	/** 审核状态 */
	private Integer isCheck = 0;
	/** 审核描述 */
	private String checkNote;
	/** 用户角色关联集合 */
	private Set<WtUserRoleRelationship> wtUserRoleRelationships = new LinkedHashSet<WtUserRoleRelationship>(
			0);
	/** 是否删除 */
	private Integer isDelete = 0;
	public Long getWtuserId() {
		return wtuserId;
	}
	public void setWtuserId(Long wtuserId) {
		this.wtuserId = wtuserId;
	}
	public String getWtuserLoginname() {
		return wtuserLoginname;
	}
	public void setWtuserLoginname(String wtuserLoginname) {
		this.wtuserLoginname = wtuserLoginname;
	}
	public String getWtuserPassword() {
		return wtuserPassword;
	}
	public void setWtuserPassword(String wtuserPassword) {
		this.wtuserPassword = wtuserPassword;
	}
	public Date getWtuserLastlogintime() {
		return wtuserLastlogintime;
	}
	public void setWtuserLastlogintime(Date wtuserLastlogintime) {
		this.wtuserLastlogintime = wtuserLastlogintime;
	}
	public Integer getWtuserLoginnumber() {
		return wtuserLoginnumber;
	}
	public void setWtuserLoginnumber(Integer wtuserLoginnumber) {
		this.wtuserLoginnumber = wtuserLoginnumber;
	}
	public String getWtuserIsuseable() {
		return wtuserIsuseable;
	}
	public void setWtuserIsuseable(String wtuserIsuseable) {
		this.wtuserIsuseable = wtuserIsuseable;
	}
	public Integer getIsCheck() {
		return isCheck;
	}
	public void setIsCheck(Integer isCheck) {
		this.isCheck = isCheck;
	}
	public String getCheckNote() {
		return checkNote;
	}
	public void setCheckNote(String checkNote) {
		this.checkNote = checkNote;
	}
	public Set<WtUserRoleRelationship> getWtUserRoleRelationships() {
		return wtUserRoleRelationships;
	}
	public void setWtUserRoleRelationships(
			Set<WtUserRoleRelationship> wtUserRoleRelationships) {
		this.wtUserRoleRelationships = wtUserRoleRelationships;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	
	public Date getWtuserCreatetime() {
		return wtuserCreatetime;
	}
	public void setWtuserCreatetime(Date wtuserCreatetime) {
		this.wtuserCreatetime = wtuserCreatetime;
	}
	public Date getWtuserLogintime() {
		return wtuserLogintime;
	}
	public void setWtuserLogintime(Date wtuserLogintime) {
		this.wtuserLogintime = wtuserLogintime;
	}
	public String getCorpName() {
		return corpName;
	}
	public void setCorpName(String corpName) {
		this.corpName = corpName;
	}
	public String getCorpAdd() {
		return corpAdd;
	}
	public void setCorpAdd(String corpAdd) {
		this.corpAdd = corpAdd;
	}
	public String getCorpNote() {
		return corpNote;
	}
	public void setCorpNote(String corpNote) {
		this.corpNote = corpNote;
	}
	public Integer getCorpCode() {
		return corpCode;
	}
	public void setCorpCode(Integer corpCode) {
		this.corpCode = corpCode;
	}
	public String getCorpTel() {
		return corpTel;
	}
	public void setCorpTel(String corpTel) {
		this.corpTel = corpTel;
	}
	public String getCorpFax() {
		return corpFax;
	}
	public void setCorpFax(String corpFax) {
		this.corpFax = corpFax;
	}
	public String getCorpAP() {
		return corpAP;
	}
	public void setCorpAP(String corpAP) {
		this.corpAP = corpAP;
	}
	public String getOpenBank() {
		return openBank;
	}
	public void setOpenBank(String openBank) {
		this.openBank = openBank;
	}
	public String getOpenName() {
		return openName;
	}
	public void setOpenName(String openName) {
		this.openName = openName;
	}
	public String getBankID() {
		return bankID;
	}
	public void setBankID(String bankID) {
		this.bankID = bankID;
	}
	public String getLinkman() {
		return linkman;
	}
	public void setLinkman(String linkman) {
		this.linkman = linkman;
	}
	public String getLinkmanTel() {
		return linkmanTel;
	}
	public void setLinkmanTel(String linkmanTel) {
		this.linkmanTel = linkmanTel;
	}
	public String getLinkmanEmail() {
		return linkmanEmail;
	}
	public void setLinkmanEmail(String linkmanEmail) {
		this.linkmanEmail = linkmanEmail;
	}
	public String getLinkmanAdd() {
		return linkmanAdd;
	}
	public void setLinkmanAdd(String linkmanAdd) {
		this.linkmanAdd = linkmanAdd;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
   	}
	@Override
	public boolean equals(Object obj) {
		Wtuser user = (Wtuser) obj;
		return this.wtuserId.equals(user.getWtuserId());
	}
}