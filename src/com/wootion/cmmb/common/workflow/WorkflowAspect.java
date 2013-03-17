package com.wootion.cmmb.common.workflow;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.aspectj.lang.JoinPoint;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.idp.common.collections.PermissionCollection;
import com.wootion.idp.common.collections.UserCacheBean;

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
		service.checkWorkflowBill(action, this.getRequest());
	}
	
	public void handleWorkflow(JoinPoint joinPoint) {
		WorkflowHandle action = (WorkflowHandle) joinPoint.getThis();
		HttpServletRequest request = this.getRequest();
		String submitFlag = request.getParameter(WorkflowParameter.SUBMIT_FLAG);

		String remark = request.getParameter("remark");
		Long handleUserid = getCurrentUserId(request.getSession().getId());
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
		service.viewWorkflowBill(action, this.getRequest());
	}
	
	private Long getCurrentUserId(String sessionID) {
		UserCacheBean uc1 = PermissionCollection.getInstance().getUserCache(
				sessionID);
		return uc1.getUserID();
	}

	private HttpServletRequest getRequest() {
		ActionContext ctx = ActionContext.getContext();
		return (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	}
}
