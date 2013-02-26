package com.wootion.cmmb.view.action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.common.collections.PermissionCollection;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.view.action.BaseAction;

/**
 * <p>文件名称: UpPasswordAction.java</p>
 */
public class UpPasswordAction extends BaseAction
{
    private Wtuser user;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse arg1)
    {
        String sessionID = request.getSession().getId();
        Long userID = PermissionCollection.getInstance()
                .getUserCache(sessionID).getUserID();
        user = (Wtuser) ServiceFactroy.getUserService().getObjectByID(
                Wtuser.class, userID);
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

}
