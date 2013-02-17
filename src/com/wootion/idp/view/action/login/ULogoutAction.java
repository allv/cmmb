package com.wootion.idp.view.action.login;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.user.UserManagerService;
import com.wootion.idp.view.action.BaseAction;

public class ULogoutAction extends BaseAction{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse arg1) {
		UserManagerService userService = ServiceFactroy.getUserService();
		userService.userLogOut(request.getSession().getId());
		return null;
	}

}
