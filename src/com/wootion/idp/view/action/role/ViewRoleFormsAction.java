package com.wootion.idp.view.action.role;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cmmb.persistenc.po.bean.Form;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.role.RoleManagerService;
import com.wootion.idp.view.action.BaseAction;
import com.wootion.idp.view.vo.FormVO;

public class ViewRoleFormsAction extends BaseAction {

	private String mid;
	private String roleName;
	private List<Form> currentForms = new ArrayList<Form>();

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

	public List<Form> getCurrentForms() {
		return currentForms;
	}

	public void setCurrentForms(List<Form> currentForms) {
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
		Set<Form> forms = role.getForms();
		currentForms.clear();
		for(Form form:forms) {
			currentForms.add(form);
		}
		Collections.sort(currentForms, new Comparator<Form>() {
			@Override
			public int compare(Form o1, Form o2) {
				return o1.getId().intValue() - o2.getId().intValue();
			}
			
		});
		return SUCESS;
	}

	public RoleManagerService getRoleService() {
		if (roleService == null)
			roleService = ServiceFactroy.getRoleService();
		return roleService;
	}

}
