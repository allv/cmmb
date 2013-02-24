package com.wootion.idp.view.action.role;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.role.RoleManagerService;
import com.wootion.idp.view.action.BaseAction;

public class ViewRoleMemberAction extends BaseAction {

    private String mid;
    private String roleName;
    private List<Wtuser> lst;
    
    private RoleManagerService roleService;

    @Override
    public String execute(HttpServletRequest arg0, HttpServletResponse arg1) {
	getRoleMembers();
	return SUCESS;
    }

    protected void getRoleMembers() {
	Wtrole role = (Wtrole) getRoleService().getObjectByID(Wtrole.class,
		Long.valueOf(Long.parseLong(mid)));
	if (role != null)
	    roleName = role.getWtroleName();
	lst = roleService.getRoleUsers(Long.valueOf(Long.parseLong(mid)));
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
	if(roleService == null ) roleService = ServiceFactroy.getRoleService();
        return roleService;
    }

}
