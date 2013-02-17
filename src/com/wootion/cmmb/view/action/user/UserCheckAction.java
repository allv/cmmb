package com.wootion.cmmb.view.action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.view.action.BaseAction;

public class UserCheckAction extends BaseAction
{

    private Long   mid;

    private Wtuser user;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse arg1)
    {
        user = (Wtuser) ServiceFactroy.getUserService().getObjectByID(
                Wtuser.class, mid);
        request.setAttribute("isCheck", user.getIsCheck());
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

    public Long getMid()
    {
        return mid;
    }

    public void setMid(Long mid)
    {
        this.mid = mid;
    }

}
