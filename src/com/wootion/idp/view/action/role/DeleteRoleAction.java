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

public class DeleteRoleAction extends BaseAction {
	private String mid;

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {

		RoleManagerService roleService = ServiceFactroy.getRoleService();

		try {
			//roleService.deleteObjectById(Wtrole.class, Long.parseLong(mid));
		    Wtrole role = (Wtrole) roleService.getObjectByID(Wtrole.class, Long
                    .parseLong(mid));
		    role.setIsDelete(1);
		    roleService.modifyObject(role);
		    
			request.setAttribute("type", "ok");
			request.setAttribute("msg", "删除角色成功！！");
		} catch (Exception e) {
			request.setAttribute("type", "err");
			request.setAttribute("msg",
					"删除角色失败，未找到对应的角色记录或者该角色与其他记录有关联，请先删除关联项！！");
		}

		request
				.setAttribute("back", request.getContextPath()
						+ "/queryrole.do");

		return SUCESS;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

}