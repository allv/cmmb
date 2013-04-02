package com.wootion.cmmb.common.util;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.idp.common.collections.PermissionCollection;
import com.wootion.idp.common.collections.UserCacheBean;

public class ServletUtil {
	
	public static HttpServletRequest getRequest() {
		ActionContext ctx = ActionContext.getContext();
		return (HttpServletRequest) ctx.get(ServletActionContext.HTTP_REQUEST);
	}

	public static Long getCurrentUserId() {
		String sessionID = getRequest().getSession().getId();
		UserCacheBean uc1 = PermissionCollection.getInstance().getUserCache(
				sessionID);
		return uc1.getUserID();
	}
}