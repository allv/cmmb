package com.wootion.cmmb.view.action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.view.action.BaseAction;

/**
 * <p>文件名称: UnRegisterAction.java</p>
 */
public class UnRegisterAction extends BaseAction
{
    private Long   mid;

    private Wtuser user;

    public String execute(HttpServletRequest request,
            HttpServletResponse response)
    {
        user = (Wtuser) ServiceFactroy.getUserService().getObjectByID(
                Wtuser.class, mid);
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
}
