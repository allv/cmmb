package com.wootion.cmmb.common.workflow;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;

import com.wootion.cmmb.common.util.ServletUtil;

public class WorkflowAspect {

	private WorkflowService service;

	public WorkflowService getService() {
		return service;
	}

	public void setService(WorkflowService service) {
		this.service = service;
	}

	public void checkWorkflow(JoinPoint joinPoint) {
		WorkflowHandle action = (WorkflowHandle) joinPoint.getThis();
		service.checkWorkflowBill(action, ServletUtil.getRequest());
	}
	
	public void handleWorkflow(JoinPoint joinPoint) {
		WorkflowHandle action = (WorkflowHandle) joinPoint.getThis();
		HttpServletRequest request = ServletUtil.getRequest();
		String submitFlag = request.getParameter(WorkflowParameter.SUBMIT_FLAG);

		String remark = request.getParameter("remark");
		Long handleUserid = ServletUtil.getCurrentUserId();
		if (submitFlag != null
				&& submitFlag.equals(WorkflowParameter.HANDLE_TYPE_SUBMIT.toString())) {
			service.submit((WorkflowHandle) action, handleUserid, remark);
		}
		if (submitFlag != null
				&& submitFlag.equals(WorkflowParameter.HANDLE_TYPE_AUDIT.toString())) {
			service.audit((WorkflowHandle) action, handleUserid, remark);
		}
		if (submitFlag != null
				&& submitFlag.equals(WorkflowParameter.HANDLE_TYPE_REJECT.toString())) {
			service.reject((WorkflowHandle) action, handleUserid, remark);
		}
		if (submitFlag != null
				&& submitFlag.equals(WorkflowParameter.HANDLE_TYPE_BACK.toString())) {
			service.back((WorkflowHandle) action, handleUserid, remark);
		}
	}
	
	public void deleteWorkflow(JoinPoint joinPoint) {
		WorkflowHandle action = (WorkflowHandle) joinPoint.getThis();
		service.deleteWorkflowBill((WorkflowHandle) action);
	}
	
	public void viewWorkflow(JoinPoint joinPoint) {
		WorkflowHandle action = (WorkflowHandle) joinPoint.getThis();
		service.viewWorkflowBill(action, ServletUtil.getRequest());
	}

}
