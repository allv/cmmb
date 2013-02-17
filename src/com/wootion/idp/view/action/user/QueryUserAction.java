package com.wootion.idp.view.action.user;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.service.ServiceFactroy;
import com.wootion.idp.service.user.UserManagerService;
import com.wootion.idp.view.action.BaseAction;

public class QueryUserAction extends BaseAction
{
    private String              nowpage       = null; // 页码

    private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;

    private String              startDate;           // 用户创建开始时间

    private String              endDate;             // 用户创建结束时间，主要用于查询一个时间区间内创建的用户

    private String              username;

    private String              wtuserIsuseable;     //用户是否有效

    /**审核状态*/
    private Integer             isCheck;
    
    /**审核状态*/
    private String             userType;

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
        int clienttype = 1;
        UserManagerService userService = ServiceFactroy.getUserService();
        result = userService.getQueryUserResult(firstindex, maxresult,
                startDate, endDate, username, wtuserIsuseable, isCheck,
                 request.getSession().getId(), clienttype);
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

    public String getWtuserIsuseable()
    {
        return wtuserIsuseable;
    }

    public void setWtuserIsuseable(String wtuserIsuseable)
    {
        this.wtuserIsuseable = wtuserIsuseable;
    }

    public Integer getIsCheck()
    {
        return isCheck;
    }

    public void setIsCheck(Integer isCheck)
    {
        this.isCheck = isCheck;
    }

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
}