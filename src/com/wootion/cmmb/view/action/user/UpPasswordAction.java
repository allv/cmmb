package com.wootion.cmmb.view.action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.common.collections.PermissionCollection;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.view.action.BaseAction;

/**
 * <p>文件名称: UpPasswordAction.java</p>
 * <p>文件描述: 本类描述:</p>
 * <p>版权所有: 版权所有(C)2001-2006</p>
 * <p>公   司: 华通科技有限公司</p>
 * <p>内容摘要: </p>
 * <p>其他说明: </p>
 * <p>完成日期：Aug 12, 2010</p>
 * <p>修改记录0：无</p>
 * @version 1.0
 * @author Deng Honghong
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
