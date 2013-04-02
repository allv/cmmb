package com.wootion.cmmb.common.formPermission;

import org.aspectj.lang.JoinPoint;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.common.util.ServletUtil;
import com.wootion.cmmb.common.workflow.WorkflowHandle;
import com.wootion.cmmb.common.workflow.WorkflowParameter;

public class FormPermissionAspect {

//	public static final String PRIMARY_KEY_iD = "primary_key_id";

	private FormPermissionService service;
	
	public void handleFormPermission(JoinPoint joinPoint) {
		WorkflowHandle action = (WorkflowHandle) joinPoint.getThis();
		String billid = (String) ServletUtil.getRequest().getParameter(WorkflowParameter.BILL_ID);
		Long handleUserid = ServletUtil.getCurrentUserId();
		if (billid != null) {
			service.saveOrUpdateFormPermission(billid, action, handleUserid);
		}
	}

	public void deleteFormPermission(JoinPoint joinPoint) {
		String billid = (String) ServletUtil.getRequest().getParameter(WorkflowParameter.BILL_ID);
		if (billid != null) {
			service.deleteFormPermission(billid);
		}
	}

	public FormPermissionService getService() {
		if(service == null ) {
			service = IMPServiceFactory.getFormPermissionService();
		}
		return service;
	}

	public void setService(FormPermissionService service) {
		this.service = service;
	}

}
