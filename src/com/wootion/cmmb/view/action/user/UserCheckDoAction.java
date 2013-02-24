package com.wootion.cmmb.view.action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.user.UserManagerService;
import com.wootion.idp.view.action.BaseAction;

public class UserCheckDoAction extends BaseAction
{

    private Long    userID;

    /**审核状态*/
    private Integer isCheck;

    /**客户简称*/
    private String  userShort;

    /**客户标识*/
    private String  userMark;

    /**客户扩展标识*/
    private String  userExtendMark;

    /**审核描述*/
    private String  checkNote;

    /**客户分类*/
    private String  userType;

    /**紧急用户*/
    private String  urgentUser;
//	/** 大客户的FTP帐号 */
//	private String ftpAccount;
//	/** 大客户的FTP密码 */
//	private String ftppwd;
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse arg1)
    {

        UserManagerService userService = ServiceFactroy.getUserService();
        Wtuser user = (Wtuser) userService.getObjectByID(Wtuser.class, userID);

        if (user != null)
        {
            user.setIsCheck(isCheck);
//            user.setUserMark(userMark);
//            user.setUserExtendMark(userExtendMark);
//            user.setUserType(userType);
//            user.setUserShort(userShort);
//            user.setCheckNote(checkNote);
//            user.setUrgentUser(urgentUser);
//            user.setFtpAccount(ftpAccount);
//    		user.setFtppwd(ftppwd);
            if (isCheck == 1) // 当审核通过时，将其激活
                user.setWtuserIsuseable("1");

            userService.modifyObject(user);

            request.setAttribute("msg", "审核用户成功！");
            request.setAttribute("type", "ok");
        }
        else
        {
            request.setAttribute("msg", "审核用户失败！");
            request.setAttribute("type", "err");
        }

        request.setAttribute("back", request.getContextPath() + "/queryuser.do");

        return SUCESS;
    }

    public Long getUserID()
    {
        return userID;
        
    }

    public void setUserID(Long userID)
    {
        this.userID = userID;
    }

    public Integer getIsCheck()
    {
        return isCheck;
    }

    public void setIsCheck(Integer isCheck)
    {
        this.isCheck = isCheck;
    }

    public String getUserShort()
    {
        return userShort;
    }

    public void setUserShort(String userShort)
    {
        this.userShort = userShort;
    }

    public String getUserMark()
    {
        return userMark;
    }

    public void setUserMark(String userMark)
    {
        this.userMark = userMark;
    }

    public String getUserExtendMark()
    {
        return userExtendMark;
    }

    public void setUserExtendMark(String userExtendMark)
    {
        this.userExtendMark = userExtendMark;
    }

    public String getCheckNote()
    {
        return checkNote;
    }

    public void setCheckNote(String checkNote)
    {
        this.checkNote = checkNote;
    }

    public String getUserType()
    {
        return userType;
    }

    public void setUserType(String userType)
    {
        this.userType = userType;
    }

	public String getUrgentUser() {
		return urgentUser;
	}

	public void setUrgentUser(String urgentUser) {
		this.urgentUser = urgentUser;
	}
//	public String getFtpAccount() {
//		return ftpAccount;
//	}
//
//	public void setFtpAccount(String ftpAccount) {
//		this.ftpAccount = ftpAccount;
//	}
//
//	public String getFtppwd() {
//		return ftppwd;
//	}
//
//	public void setFtppwd(String ftppwd) {
//		this.ftppwd = ftppwd;
//	}
}
