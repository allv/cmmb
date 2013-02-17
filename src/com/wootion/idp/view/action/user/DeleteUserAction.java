package com.wootion.idp.view.action.user;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.common.utils.EntityIDFactory;
import com.wootion.idp.persistence.po.bean.Wtorganization;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.user.UserManagerService;
import com.wootion.idp.view.action.BaseAction;

public class DeleteUserAction extends BaseAction {
	private String mid;

	@Override
	public String execute(HttpServletRequest request,
			HttpServletResponse response) {

		try
        {
            UserManagerService userService = ServiceFactroy.getUserService();
            Wtuser user = (Wtuser) userService.getObjectByID(Wtuser.class, Long
                    .parseLong(mid));
            user.setIsDelete(1);
            userService.modifyObject(user);
            //
            //		userService.deleteObjectById(Wtuser.class, Long.parseLong(mid));
            request.setAttribute("back", request.getContextPath()
                    + "/queryuser.do");
            request.setAttribute("msg", "删除用户成功!");
            request.setAttribute("type", "ok");
        }
        catch (Exception e)
        {
            e.printStackTrace();
            request.setAttribute("back", request.getContextPath()
                    + "/queryuser.do");
            request.setAttribute("msg", "删除用户失败!");
            request.setAttribute("type", "err");
            
        }
        return SUCESS;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

}