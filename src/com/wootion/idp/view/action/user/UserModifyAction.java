package com.wootion.idp.view.action.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.common.utils.DomainUtil;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.role.RoleManagerService;
import com.wootion.idp.view.action.BaseAction;

public class UserModifyAction extends BaseAction {

	private Long mid;

	private Wtuser user;

	/** 用户角色列表 */
	private List<Wtrole> roleList;

	private List<WtroleVOForUpdate> allRoles;

	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		user = (Wtuser) ServiceFactroy.getUserService().getObjectByID(
				Wtuser.class, mid);
		RoleManagerService roleService = ServiceFactroy.getRoleService();
		List<Wtrole> allRoleRecords = roleService.getRecords();
		roleList = ServiceFactroy.getUserService().getUserRoles(mid);
		allRoles = new ArrayList<WtroleVOForUpdate>();
		for(Wtrole role:allRoleRecords) {
			if(DomainUtil.isGroupRole(role)) continue;
			WtroleVOForUpdate newRole = new WtroleVOForUpdate();
			newRole.setRole(role);
			boolean flag = false;
			for(Wtrole tempRole:roleList) {
				if(role.getWtroleId().equals(tempRole.getWtroleId()) ) {
					flag = true;
					break;
				}
			}
			newRole.setChecked(flag);
			allRoles.add(newRole);
		}
		return SUCESS;
	}

	public Long getMid() {
		return mid;
	}

	public void setMid(Long mid) {
		this.mid = mid;
	}

	public Wtuser getUser() {
		return user;
	}

	public void setUser(Wtuser user) {
		this.user = user;
	}

	public List<Wtrole> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Wtrole> roleList) {
		this.roleList = roleList;
	}

	public List<WtroleVOForUpdate> getAllRoles() {
		return allRoles;
	}

	public void setAllRoles(List<WtroleVOForUpdate> allRoles) {
		this.allRoles = allRoles;
	}

}
