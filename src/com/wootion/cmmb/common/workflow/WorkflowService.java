package com.wootion.cmmb.common.workflow;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.wootion.cmmb.persistenc.po.bean.Workflow;
import com.wootion.cmmb.persistenc.po.bean.WorkflowBills;
import com.wootion.cmmb.persistenc.po.bean.WorkflowRecords;

public interface WorkflowService {

	public abstract void submit(WorkflowHandle workflowAction,
			Long handleUserid, String remark);

	public abstract void audit(WorkflowHandle workflowAction,
			Long handleUserid, String remark);

	public abstract void reject(WorkflowHandle workflowAction,
			Long handleUserid, String rejectReason);

	public abstract void back(WorkflowHandle workflowAction, Long handleUserid,
			String remark);

	public abstract void checkWorkflowBill(WorkflowHandle workflowAction,
			HttpServletRequest httpServletRequest);

	public abstract Workflow getWorkflow(Long formId);

	public abstract WorkflowBills getWorkflowBill(Long formId, String billid);

	public abstract String getUsersName(String currentHandleUserIds);

	public abstract void deleteWorkflowBill(WorkflowHandle action);

	public abstract void viewWorkflowBill(WorkflowHandle action,
			HttpServletRequest request);

	public abstract List<WorkflowRecords> getWorkflowRecords(Long valueOf,
			String billid);

}