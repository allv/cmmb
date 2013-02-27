package com.wootion.cmmb.persistenc.po.bean;

public class WorkflowBills {

	private Long id;
	private Integer currentLevel;
	private String billid;
	private String currentHandleUsers;
	private String rejectReason;
	private Workflow workflow;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getCurrentLevel() {
		return currentLevel;
	}

	public void setCurrentLevel(Integer currentLevel) {
		this.currentLevel = currentLevel;
	}

	public String getBillid() {
		return billid;
	}

	public void setBillid(String billid) {
		this.billid = billid;
	}

	public String getCurrentHandleUsers() {
		return currentHandleUsers;
	}

	public void setCurrentHandleUsers(String currentHandleUsers) {
		this.currentHandleUsers = currentHandleUsers;
	}

	public String getRejectReason() {
		return rejectReason;
	}

	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}

	public Workflow getWorkflow() {
		return workflow;
	}

	public void setWorkflow(Workflow workflow) {
		this.workflow = workflow;
	}

}
