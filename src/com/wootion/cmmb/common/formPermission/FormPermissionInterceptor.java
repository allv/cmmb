package com.wootion.cmmb.common.formPermission;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;
import com.wootion.idp.common.collections.PermissionCollection;
import com.wootion.idp.common.collections.UserCacheBean;
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
			Long currentUserId = getCurrentUserId(getRequest().getSession().getId());
			String billid = (String) this.getRequest().getAttribute(
					FormPermissionAspect.PRIMARY_KEY_iD);
			if (!service.checkPermission(currentUserId.toString(), billid)) {
				return DomainUtil.UNAUTHORIZED_PERMISSION;
			}
		}
		return invocation.invoke();
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
		return service;
	}

	public void setService(FormPermissionService service) {
		this.service = service;
	}

}
