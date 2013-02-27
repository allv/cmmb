package com.wootion.cmmb.persistenc.po.bean;

import java.util.Date;
import java.util.Set;

public class Workflow {

	private Long id;
	private String name;
	private String description;
	private Date createtime;
	private Form form;
	private Set<WorkflowBills> bills;
	private Set<WorkflowNodes> nodes;
	private Set<WorkflowNodes> records;

	public Set<WorkflowBills> getBills() {
		return bills;
	}

	public void setBills(Set<WorkflowBills> bills) {
		this.bills = bills;
	}

	public Set<WorkflowNodes> getNodes() {
		return nodes;
	}

	public void setNodes(Set<WorkflowNodes> nodes) {
		this.nodes = nodes;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Form getForm() {
		return form;
	}

	public void setForm(Form form) {
		this.form = form;
	}

	public Set<WorkflowNodes> getRecords() {
		return records;
	}

	public void setRecords(Set<WorkflowNodes> records) {
		this.records = records;
	}
}
