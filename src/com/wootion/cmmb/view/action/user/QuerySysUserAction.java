package com.wootion.cmmb.view.action.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cmmb.service.ServiceFactroy;
import com.wootion.cmmb.service.user.UserService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.user.UserManagerService;
import com.wootion.idp.view.action.BaseAction;

/**
 * 文件名称：UserAction.java
 * 
 */
public class QuerySysUserAction extends BaseAction
{
    private String              nowpage       = null; // 页码

    private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;

    private String              startDate;           // 用户创建开始时间

    private String              endDate;             // 用户创建结束时间，主要用于查询一个时间区间内创建的用户

    private String              username;

    private String              userShort;     //用户简称

    private String              userType;     //用户类型

    private QueryResult<Wtuser> result;

    @Override
    public String execute(HttpServletRequest request,
            HttpServletResponse response)
    {
        Integer firstindex = 1;//当前页数
        Integer maxresult = 10;//每页显示数
        if (nowpage != null && !nowpage.trim().equals(""))
        {
            firstindex = Integer.parseInt(nowpage.trim());
            if (firstindex == 0)
            {
                firstindex = 1;
            }
        }
        if (maxpage != null && !maxpage.trim().equals(""))
        {
            maxresult = Integer.parseInt(maxpage.trim());
        }
        UserService userService = ServiceFactroy.getListUserService();
        result = userService.getQueryUserResult(firstindex, maxresult,
                startDate, endDate, username, null, null,
                userType, userShort, request.getSession().getId());
        return SUCESS;
    }

    public QueryResult<Wtuser> getResult()
    {
        return result;
    }

    public void setResult(QueryResult<Wtuser> result)
    {
        this.result = result;
    }

    public String getNowpage()
    {
        return nowpage;
    }

    public void setNowpage(String nowpage)
    {
        this.nowpage = nowpage;
    }

    public String getMaxpage()
    {
        return maxpage;
    }

    public void setMaxpage(String maxpage)
    {
        this.maxpage = maxpage;
    }

    public String getStartDate()
    {
        return startDate;
    }

    public void setStartDate(String startDate)
    {
        this.startDate = startDate;
    }

    public String getEndDate()
    {
        return endDate;
    }

    public void setEndDate(String endDate)
    {
        this.endDate = endDate;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPerPageNumber()
    {
        return perPageNumber;
    }

    public void setPerPageNumber(String perPageNumber)
    {
        this.perPageNumber = perPageNumber;
    }

	public String getUserShort() {
		return userShort;
	}

	public void setUserShort(String userShort) {
		this.userShort = userShort;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
}