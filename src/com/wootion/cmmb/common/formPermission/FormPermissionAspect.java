package com.wootion.cmmb.common.formPermission;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.aspectj.lang.JoinPoint;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.common.workflow.WorkflowHandle;
import com.wootion.idp.common.collections.PermissionCollection;
import com.wootion.idp.common.collections.UserCacheBean;

public class FormPermissionAspect {

	public static final String PRIMARY_KEY_iD = "primary_key_id";

	private FormPermissionService service;
	
	public void handleFormPermission(JoinPoint joinPoint) {
		WorkflowHandle action = (WorkflowHandle) joinPoint.getThis();
		String billid = (String) this.getRequest().getAttribute(PRIMARY_KEY_iD);
		Long handleUserid = getCurrentUserId(getRequest().getSession().getId());
		if (billid != null) {
			service.saveOrUpdateFormPermission(billid, action, handleUserid);
		}
	}

	public void deleteFormPermission(JoinPoint joinPoint) {
		String billid = (String) this.getRequest().getAttribute(PRIMARY_KEY_iD);
		if (billid != null) {
			service.deleteFormPermission(billid);
		}
	}

	private HttpServletRequest getRequest() {
		ActionContext ctx = ActionContext.getContext();
		return (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	}

	private Long getCurrentUserId(String sessionID) {
		UserCacheBean uc1 = PermissionCollection.getInstance().getUserCache(
				sessionID);
		return uc1.getUserID();
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
