package com.wootion.cmmb.view.action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.user.UserManagerService;
import com.wootion.idp.view.action.BaseAction;

/**
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
