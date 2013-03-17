package com.wootion.idp.view.action.user;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.common.utils.DomainUtil;
import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.role.RoleManagerService;
import com.wootion.idp.view.action.BaseAction;

public class UserAddAction extends BaseAction
{

    private List<Wtrole> roleList;
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
    	 RoleManagerService roleService = ServiceFactroy.getRoleService();
         roleList = roleService.getRecords();
         List<Wtrole> result = new ArrayList<Wtrole>();
         for(Wtrole role:roleList) { 
        	 if(!DomainUtil.isGroupRole(role)) {
        		 result.add(role);
        	 }
         }
         roleList = result;
         return SUCESS;
    }
    public List<Wtrole> getRoleList()
    {
        return roleList;
    }
    public void setRoleList(List<Wtrole> roleList)
    {
        this.roleList = roleList;
    }
   

}
