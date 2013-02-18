package com.wootion.idp.view.action.user;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.common.collections.PermissionCollection;
import com.wootion.idp.common.collections.UserCacheBean;
import com.wootion.idp.common.utils.EntityIDFactory;
import com.wootion.idp.persistence.po.bean.Wtorganization;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.role.RoleManagerService;
import com.wootion.idp.service.user.UserManagerService;
import com.wootion.idp.view.action.BaseAction;

public class DoFPRoleAction extends BaseAction {
	private String roles;
	private String userName;
	private Long userID;

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		
		UserManagerService userService = ServiceFactroy.getUserService();
		userService.saveUserRole(userID, roles);
		
		request
				.setAttribute("back", request.getContextPath()
						+ "/queryuser.do");
		request.setAttribute("msg", "用户分配角色成功!");
		request.setAttribute("type", "ok");
		return SUCESS;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Long getUserID() {
		return userID;
	}

	public void setUserID(Long userID) {
		this.userID = userID;
	}

	
}