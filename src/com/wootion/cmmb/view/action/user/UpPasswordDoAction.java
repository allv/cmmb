package com.wootion.cmmb.view.action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.user.UserManagerService;
import com.wootion.idp.view.action.BaseAction;

/**
 * <p>文件名称: UpPasswordDoAction.java</p>
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
public class UpPasswordDoAction extends BaseAction
{
    private Long   userID;

    private String password;

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse arg1)
    {
        UserManagerService userService = ServiceFactroy.getUserService();
        Wtuser user = (Wtuser) userService.getObjectByID(Wtuser.class, userID);
        if (user != null)
        {
            user.setWtuserPassword(password);
            userService.modifyObject(user);

            request.setAttribute("msg", "修改密码成功！");
            request.setAttribute("type", "ok");
        }
        else
        {
            request.setAttribute("msg", "修改密码失败！");
            request.setAttribute("type", "err");
        }

        request.setAttribute("back", request.getContextPath() + "/welcome.do");

        return SUCESS;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
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
