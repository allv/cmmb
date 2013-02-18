/*jadclipse*/// Decompiled by Jad v1.5.8f. Copyright 2001 Pavel Kouznetsov.

package com.wootion.idp.view.action.role;

import com.wootion.idp.persistence.po.bean.Wtrole;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.role.RoleManagerService;
import com.wootion.idp.view.action.BaseAction;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GetRolePermissionAction extends BaseAction
{

    public GetRolePermissionAction()
    {
    }

    public String execute(HttpServletRequest request, HttpServletResponse response)
    {
        RoleManagerService roleService = ServiceFactroy.getRoleService();
        Wtrole role = (Wtrole)roleService.getObjectByID(Wtrole.class, Long.valueOf(Long.parseLong(mid)));
        
        //Wtrole parentrole = (Wtrole)roleService.getObjectByID(Wtrole.class, Long.valueOf(Long.parseLong(role.getParentRole())));
        if(role != null)
            roleName = role.getWtroleName();
        lst = roleService.getRoleNagativation(Long.valueOf(Long.parseLong(mid)));
        //得到父角色，子角色的权限不能超过父角色 ，只能在父角色已有的权限中选择
        List parentlst = roleService.getRoleNagativation(Long.valueOf(Long.parseLong(role.getParentRole())));
        request.setAttribute("parentlst", parentlst);
        return SUCESS;
    }

    public List getLst()
    {
        return lst;
    }

    public void setLst(List lst)
    {
        this.lst = lst;
    }

    public String getMid()
    {
        return mid;
    }

    public void setMid(String mid)
    {
        this.mid = mid;
    }

    public String getRoleName()
    {
        return roleName;
    }

    public void setRoleName(String roleName)
    {
        this.roleName = roleName;
    }

    private List lst;
    private String mid;
    private String roleName;
}


/*
	DECOMPILATION REPORT

	Decompiled from: E:\项目\cmmb\WebRoot\WEB-INF\lib\wootion.jar
	Total time: 297 ms
	Jad reported messages/errors:
The class file version is 50.0 (only 45.3, 46.0 and 47.0 are supported)
	Exit status: 0
	Caught exceptions:
*/