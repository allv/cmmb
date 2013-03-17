package com.wootion.cmmb.common.workflow;

import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.Workflow;
import com.wootion.cmmb.persistenc.po.bean.WorkflowBills;
import com.wootion.cmmb.persistenc.po.bean.WorkflowNodes;
import com.wootion.cmmb.persistenc.po.bean.WorkflowRecords;

public class WorkflowAction extends ActionSupport {

	private static final long serialVersionUID = 5677393323850016394L;
	private static final String SUCESS = "sucess";

	private String billid;
	private String formid;

	private String formName;
	private String currentHandleUsers;

	private Set<WorkflowNodes> workflowNodes;
	private WorkflowBills workflowBill;
	private Set<WorkflowRecords> workflowRecords;

	private WorkflowService service;

	public String viewWorkflowBillStatus() {
		HttpServletRequest request = this.getRequest();
		this.formid = request.getParameter("formid");
		this.billid = request.getParameter("billid");
		Workflow wf = getService().getWorkflow(Long.valueOf(formid));
		workflowNodes = wf.getSortNodesASC();
		workflowRecords = wf.getSortedRecordsASC();
		workflowBill = getService().getWorkflowBill(Long.valueOf(formid),billid);
		currentHandleUsers = getService().getUsersName(workflowBill.getCurrentHandleUsers());
		formName = wf.getForm().getName();
		return SUCESS;
	}

	private HttpServletRequest getRequest() {
		ActionContext ctx = ActionContext.getContext();
		return (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	}

	public String getBillid() {
		return billid;
	}

	public void setBillid(String billid) {
		this.billid = billid;
	}

	public String getFormid() {
		return formid;
	}

	public void setFormid(String formid) {
		this.formid = formid;
	}

	public WorkflowService getService() {
		if (service == null) {
			service = IMPServiceFactory.getWorkflowService();
		}
		return service;
	}

	public void setService(WorkflowService service) {
		this.service = service;
	}

	public String getFormName() {
		return formName;
	}

	public void setFormName(String formName) {
		this.formName = formName;
	}

	public Set<WorkflowNodes> getWorkflowNodes() {
		return workflowNodes;
	}

	public void setWorkflowNodes(Set<WorkflowNodes> workflowNodes) {
		this.workflowNodes = workflowNodes;
	}

	public WorkflowBills getWorkflowBill() {
		return workflowBill;
	}

	public void setWorkflowBill(WorkflowBills workflowBill) {
		this.workflowBill = workflowBill;
	}

	public Set<WorkflowRecords> getWorkflowRecords() {
		return workflowRecords;
	}

	public void setWorkflowRecords(Set<WorkflowRecords> workflowRecords) {
		this.workflowRecords = workflowRecords;
	}

	public String getCurrentHandleUsers() {
		return currentHandleUsers;
	}

	public void setCurrentHandleUsers(String currentHandleUsers) {
		this.currentHandleUsers = currentHandleUsers;
	}

}
