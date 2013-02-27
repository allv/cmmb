package com.wootion.idp.view.action.role;

import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cmmb.persistenc.po.bean.Form;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.role.RoleManagerService;
import com.wootion.idp.view.action.BaseAction;

public class ViewRoleFormsAction extends BaseAction {

	private Set<Form> currentForms = new HashSet<Form>();
	private String mid;
	private String roleName;

	private RoleManagerService roleService;

	public void setRoleService(RoleManagerService roleService) {
		this.roleService = roleService;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public Set<Form> getCurrentForms() {
		return currentForms;
	}

	public void setCurrentForms(Set<Form> currentForms) {
		this.currentForms = currentForms;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	@Override
	public String execute(HttpServletRequest arg0, HttpServletResponse arg1) {
		Wtrole role = (Wtrole) getRoleService().getObjectByID(Wtrole.class,
				Long.valueOf(Long.parseLong(mid)));
		roleName = role.getWtroleName();
		this.currentForms = role.getForms();
		return SUCESS;
	}

	public RoleManagerService getRoleService() {
		if (roleService == null)
			roleService = ServiceFactroy.getRoleService();
		return roleService;
	}

}
