package com.wootion.idp.view.action.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.user.UserManagerService;
import com.wootion.idp.view.action.BaseAction;

public class RoleFPUserAction extends BaseAction {
	private List<Wtrole> lstRole;
	private String userName;
	private Long mid;

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {
		UserManagerService userService = ServiceFactroy.getUserService();
		lstRole = userService.getUserRole(mid);
		Wtuser user = (Wtuser) userService.getObjectByID(Wtuser.class, mid);
		if (user != null) {
			userName = user.getWtuserLoginname();
		}
		return SUCESS;
	}

	public List<Wtrole> getLstRole() {
		return lstRole;
	}

	public void setLstRole(List<Wtrole> lstRole) {
		this.lstRole = lstRole;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Long getMid() {
		return mid;
	}

	public void setMid(Long mid) {
		this.mid = mid;
	}
}
