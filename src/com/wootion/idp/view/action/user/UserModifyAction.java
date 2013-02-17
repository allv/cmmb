package com.wootion.idp.view.action.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.view.action.BaseAction;

public class UserModifyAction extends BaseAction
{

    private Long   mid;

    private Wtuser user;
    
    /**用户角色列表*/
    private List<Wtrole> roleList;
    
    /**用户角色*/
    private Wtrole userRoles;

    public String execute(HttpServletRequest request,
            HttpServletResponse response)
    {
        user = (Wtuser) ServiceFactroy.getUserService().getObjectByID(
                Wtuser.class, mid);
        //RoleManagerService roleService = ServiceFactroy.getRoleService();
        //roleList = roleService.getRecords();
        //roleList = ServiceFactroy.getUserService().getUserRole(mid);
        //userRoles = null;
        return SUCESS;
    }

    public Long getMid()
    {
        return mid;
    }

    public void setMid(Long mid)
    {
        this.mid = mid;
    }

    public Wtuser getUser()
    {
        return user;
    }

    public void setUser(Wtuser user)
    {
        this.user = user;
    }

    public List<Wtrole> getRoleList()
    {
        return roleList;
    }

    public void setRoleList(List<Wtrole> roleList)
    {
        this.roleList = roleList;
    }

    public Wtrole getUserRoles()
    {
        return userRoles;
    }

    public void setUserRoles(Wtrole userRoles)
    {
        this.userRoles = userRoles;
    }

 
}
