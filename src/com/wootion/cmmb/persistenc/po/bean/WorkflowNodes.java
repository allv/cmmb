package com.wootion.cmmb.persistenc.po.bean;

import java.util.Date;

import com.wootion.cmmb.common.workflow.WorkflowParameter;

public class WorkflowNodes {

	private Long id;
	private Integer level;
	private Integer nodeType;
	private Integer nextNodeType;
	private Date createtime;
	private String description;
	private Workflow workflow;
	private String hanleUsers;
	private String hanleUsersWithName;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getNodeType() {
		return nodeType;
	}

	public void setNodeType(Integer nodeType) {
		this.nodeType = nodeType;
	}

	public Integer getNextNodeType() {
		return nextNodeType;
	}

	public void setNextNodeType(Integer nextNodeType) {
		this.nextNodeType = nextNodeType;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Workflow getWorkflow() {
		return workflow;
	}

	public void setWorkflow(Workflow workflow) {
		this.workflow = workflow;
	}

	public String getHanleUsers() {
		return hanleUsers;
	}

	public void setHanleUsers(String hanleUsers) {
		this.hanleUsers = hanleUsers;
	}

	public String getNodeTypeDisplayValue() {
		return WorkflowParameter.getNodeTypeDisplayValue(nodeType);
	}

	public String getHanleUsersWithName() {
		return hanleUsersWithName;
	}

	public void setHanleUsersWithName(String hanleUsersWithName) {
		this.hanleUsersWithName = hanleUsersWithName;
	}

}
