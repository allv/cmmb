package com.wootion.idp.view.action.role;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.common.utils.EntityIDFactory;
import com.wootion.idp.persistence.po.bean.Wtorganization;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.role.RoleManagerService;
import com.wootion.idp.service.user.UserManagerService;
import com.wootion.idp.view.action.BaseAction;

public class AddRoleAction extends BaseAction {
	private String wtroleName;
	private String wtroleDescription;
	private String parentrole;

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		Wtrole role = new Wtrole();
		role.setWtroleCreatetime(new Date());
		role.setWtroleDescription(wtroleDescription);
		role.setWtroleId(EntityIDFactory.getBeanID());
		role.setWtroleIsuseable("1");
		role.setWtroleName(wtroleName);
		role.setWtroleType("1");
		role.setIsDelete(0);
		//父角色，初始化时建立的
		role.setParentRole(parentrole);
		RoleManagerService roleService = ServiceFactroy.getRoleService();
		roleService.addObject(role);

		request
				.setAttribute("back", request.getContextPath()
						+ "/queryrole.do");
		request.setAttribute("msg", "新增角色成功!");
		request.setAttribute("type", "ok");
		//request.setAttribute("type", "err");
		return SUCESS;
	}

	public String getWtroleName() {
		return wtroleName;
	}

	public void setWtroleName(String wtroleName) {
		this.wtroleName = wtroleName;
	}

	public String getWtroleDescription() {
		return wtroleDescription;
	}

	public void setWtroleDescription(String wtroleDescription) {
		this.wtroleDescription = wtroleDescription;
	}

	public String getParentrole() {
		return parentrole;
	}

	public void setParentrole(String parentrole) {
		this.parentrole = parentrole;
	}

}