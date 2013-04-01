package com.wootion.cmmb.persistenc.po.bean;

import java.util.Date;

public class FormPermission {

	private Long id;
	private Date lastUpdTime;
	private String currentHandleUsers;
	private String historyHandleUsers;
	private String billid;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getLastUpdTime() {
		return lastUpdTime;
	}

	public void setLastUpdTime(Date lastUpdTime) {
		this.lastUpdTime = lastUpdTime;
	}

	public String getCurrentHandleUsers() {
		return currentHandleUsers;
	}

	public void setCurrentHandleUsers(String currentHandleUsers) {
		this.currentHandleUsers = currentHandleUsers;
	}

	public String getHistoryHandleUsers() {
		return historyHandleUsers;
	}

	public void setHistoryHandleUsers(String historyHandleUsers) {
		this.historyHandleUsers = historyHandleUsers;
	}

	public String getBillid() {
		return billid;
	}

	public void setBillid(String billid) {
		this.billid = billid;
	}
}
