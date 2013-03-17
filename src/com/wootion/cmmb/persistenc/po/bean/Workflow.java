package com.wootion.cmmb.persistenc.po.bean;

import java.util.Comparator;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import java.util.TreeSet;

import com.wootion.idp.common.utils.DomainUtil;

public class Workflow {

	private Long id;
	private String name;
	private String description;
	private Date createtime;
	private Form form;
	private Integer useful;
	private Set<WorkflowBills> bills;
	private Set<WorkflowNodes> nodes;
	private Set<WorkflowRecords> records;
	private String usefulDisplayValue;
	private Integer deleted;
	
	
	public static final Integer WORKFLOW_USEFUL = 1;
	public static final Integer WORKFLOW_UN_USEFUL = 0;
	public static final Integer WORKFLOW_DELETED = 1;
	public static final Integer WORKFLOW_UN_DELETED = 0;

	public Set<WorkflowBills> getBills() {
		return bills;
	}

	public void setBills(Set<WorkflowBills> bills) {
		this.bills = bills;
	}

	public Set<WorkflowNodes> getNodes() {
		if(this.nodes==null) nodes = new HashSet<WorkflowNodes>();
		return nodes;
	}
	
	public Set<WorkflowNodes> getSortNodesASC() {
		Set<WorkflowNodes> result = new TreeSet<WorkflowNodes>(new Comparator<WorkflowNodes>() {
			@Override
			public int compare(WorkflowNodes o1, WorkflowNodes o2) {
				return o1.getLevel() - o2.getLevel();
			}
		});
		for(WorkflowNodes node:this.nodes) {
			result.add(node);
		}
		return result;
	}
	
	public Set<WorkflowNodes> getSortNodesDESC() {
		Set<WorkflowNodes> result = new TreeSet<WorkflowNodes>(new Comparator<WorkflowNodes>() {
			@Override
			public int compare(WorkflowNodes o1, WorkflowNodes o2) {
				return o2.getLevel() - o1.getLevel();
			}
		});
		for(WorkflowNodes node:this.nodes) {
			result.add(node);
		}
		return result;
	}
	
	public void generateNextNodeType() {
		if(this.nodes != null && this.nodes.size() >1) {
			Set<WorkflowNodes> sortedNodesDESC = this.getSortNodesDESC();
			Integer nextNodeType = null;
			for(WorkflowNodes node:sortedNodesDESC) {
				node.setNextNodeType(nextNodeType);
				nextNodeType = node.getNodeType();
			}
		}
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

	public Set<WorkflowRecords> getRecords() {
		return records;
	}
	
	public Set<WorkflowRecords> getSortedRecordsASC() {
		Set<WorkflowRecords> result = new TreeSet<WorkflowRecords>(new Comparator<WorkflowRecords>() {
			@Override
			public int compare(WorkflowRecords o1, WorkflowRecords o2) {
				return o1.getSort() - o2.getSort();
			}
		});
		for(WorkflowRecords record:this.records) {
			result.add(record);
		}
		return result;
	}
	
	public Set<WorkflowRecords> getSortedRecordsDESC() {
		Set<WorkflowRecords> result = new TreeSet<WorkflowRecords>(new Comparator<WorkflowRecords>() {
			@Override
			public int compare(WorkflowRecords o1, WorkflowRecords o2) {
				return o2.getSort() - o1.getSort();
			}
		});
		for(WorkflowRecords node:this.records) {
			result.add(node);
		}
		return result;
	}

	public void setRecords(Set<WorkflowRecords> records) {
		this.records = records;
	}

	public Integer getUseful() {
		return useful;
	}

	public void setUseful(Integer useful) {
		this.useful = useful;
	}

	public String getUsefulDisplayValue() {
		if(isUsefulness()) {
			usefulDisplayValue = "正常";
		}else {
			usefulDisplayValue = "已禁用";
		}
		return usefulDisplayValue;
	}

	public void setUsefulDisplayValue(String userfulDisplayValue) {
		this.usefulDisplayValue = userfulDisplayValue;
	}
	
	public boolean isUsefulness() {
		return DomainUtil.isWorkflowUseful(this);
	}

	public Integer getDeleted() {
		return deleted;
	}

	public void setDeleted(Integer deleted) {
		this.deleted = deleted;
	}
	
	public boolean isWorkflowDeleted() {
		return DomainUtil.isWorkflowDeleted(this);
	}
}
