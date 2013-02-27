package com.wootion.cmmb.persistenc.po.bean;

import java.util.Date;

import com.wootion.idp.persistence.po.bean.Wtuser;

public class WorkflowRecords {

	private Long id;
	private String billid;
	private Integer level;
	private Date handletime;
	private Integer handleType;
	private String remark;
	private Integer sort;
	private Workflow workflow;
	private Wtuser handleUser;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getBillid() {
		return billid;
	}

	public void setBillid(String billid) {
		this.billid = billid;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Date getHandletime() {
		return handletime;
	}

	public void setHandletime(Date handletime) {
		this.handletime = handletime;
	}

	public Integer getHandleType() {
		return handleType;
	}

	public void setHandleType(Integer handleType) {
		this.handleType = handleType;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public Workflow getWorkflow() {
		return workflow;
	}

	public void setWorkflow(Workflow workflow) {
		this.workflow = workflow;
	}

	public Wtuser getHandleUser() {
		return handleUser;
	}

	public void setHandleUser(Wtuser handleUser) {
		this.handleUser = handleUser;
	}

}
