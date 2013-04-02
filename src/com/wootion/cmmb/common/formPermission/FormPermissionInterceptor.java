package com.wootion.cmmb.common.formPermission;

import org.apache.commons.lang.StringUtils;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.common.util.ServletUtil;
import com.wootion.cmmb.common.workflow.WorkflowParameter;
import com.wootion.idp.common.utils.DomainUtil;

public class FormPermissionInterceptor implements Interceptor {

	private static final long serialVersionUID = -2388906289983623296L;
	private FormPermissionService service;

	@Override
	public void destroy() {

	}

	@Override
	public void init() {

	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		if(invocation.getProxy().getMethod().indexOf("premodify")>=0) {
			Long currentUserId = ServletUtil.getCurrentUserId();
			String billid = (String) ServletUtil.getRequest().getParameter(WorkflowParameter.BILL_ID);
			if(StringUtils.isNotEmpty(billid)) {
				if (!this.getService().checkPermission(currentUserId.toString(), billid)) {
					return DomainUtil.UNAUTHORIZED_PERMISSION;
				}
			}
		}
		return invocation.invoke();
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
