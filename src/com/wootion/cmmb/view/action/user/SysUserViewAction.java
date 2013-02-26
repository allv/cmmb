package com.wootion.cmmb.view.action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.view.action.BaseAction;

/**
 */
public class SysUserViewAction extends BaseAction
{
    private Long   userID;

    private Wtuser user;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse arg1)
    {
        user = (Wtuser) ServiceFactroy.getUserService().getObjectByID(
                Wtuser.class, userID);
        request.setAttribute("forward", "querysysuser.do");
        return SUCESS;
    }

    public Wtuser getUser()
    {
        return user;
    }

    public void setUser(Wtuser user)
    {
        this.user = user;
    }

    public Long getUserID()
    {
        return userID;
    }

    public void setUserID(Long userID)
    {
        this.userID = userID;
    }

}
