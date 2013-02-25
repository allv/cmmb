package com.wootion.idp.view.action.role;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.springframework.util.CollectionUtils;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.role.RoleManagerService;
import com.wootion.idp.service.user.UserManagerService;

public class AssignRoleMemeberAction extends ActionSupport {

	private static final long serialVersionUID = -153305043696776359L;

	private static final String SUCESS = "sucess";

	private String mid;
	private String roleName;
	private List<Wtuser> lst;

	private List<Wtuser> allUsers;
	private String assignedUsers;

	private RoleManagerService roleService;
	private UserManagerService userService;

	public String getRoleUser() {
		Wtrole role = (Wtrole) getRoleService().getObjectByID(Wtrole.class,
				Long.valueOf(Long.parseLong(mid)));
		if (role != null)
			roleName = role.getWtroleName();
		lst = roleService.getRoleUsers(Long.valueOf(Long.parseLong(mid)));
		allUsers = getUserService().getAllUsersWithUsable();
		List<Wtuser> result = new ArrayList<Wtuser>();
		for (Wtuser user : allUsers) {
			boolean flag = true;
			for (Wtuser curUser : lst) {
				if (curUser.getWtuserId().equals(user.getWtuserId())) {
					flag = false;
					break;
				}
			}
			if (flag)
				result.add(user);

		}
		allUsers = result;
		return SUCESS;
	}

	@SuppressWarnings("unchecked")
	public String assignRoleUser() {
		String[] users = assignedUsers.split(",");
		boolean result = getRoleService().addRoleUsers(Long.valueOf(getMid()),
				CollectionUtils.arrayToList(users));
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		if (result) {
			request.setAttribute("type", "ok");
			request.setAttribute("msg", "会员分配成功！！");
		} else {
			request.setAttribute("type", "err");
			request.setAttribute("msg", "会员分配失败，未找到对应的角色记录！");
		}
		return SUCESS;
	}

	public List<Wtuser> getAllUsers() {
		return allUsers;
	}

	public void setAllUsers(List<Wtuser> allUsers) {
		this.allUsers = allUsers;
	}

	public UserManagerService getUserService() {
		if (userService == null)
			return userService = ServiceFactroy.getUserService();
		;
		return userService;
	}

	public String getAssignedUsers() {
		return assignedUsers;
	}

	public void setAssignedUsers(String assignedUsers) {
		this.assignedUsers = assignedUsers;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public List<Wtuser> getLst() {
		return lst;
	}

	public void setLst(List<Wtuser> lst) {
		this.lst = lst;
	}

	public RoleManagerService getRoleService() {
		if (roleService == null)
			roleService = ServiceFactroy.getRoleService();
		return roleService;
	}

}
