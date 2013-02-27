package com.wootion.cmmb.persistenc.po.bean;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import com.wootion.idp.persistence.po.bean.Wtrole;

public class Form {

	private Long id;
	private Date createtime;
	private String name;
	private String description;
	private String code;
	private Set<Wtrole> roles = new HashSet<Wtrole>();
	private Workflow workflow;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
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

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public Set<Wtrole> getRoles() {
		return roles;
	}

	public void setRoles(Set<Wtrole> roles) {
		this.roles = roles;
	}

	public Workflow getWorkflow() {
		return workflow;
	}

	public void setWorkflow(Workflow workflow) {
		this.workflow = workflow;
	}

}
