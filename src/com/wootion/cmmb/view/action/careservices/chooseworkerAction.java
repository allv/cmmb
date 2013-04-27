package com.wootion.cmmb.view.action.careservices;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.service.careservices.careService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.persistence.po.bean.Wtuser;
import com.wootion.idp.view.action.BaseAction;

public class chooseworkerAction extends BaseAction
{
    private String              nowpage       = null; // 页码

    private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;


    private QueryResult<Wtuser> result;
    public careService careservice;
    chooseworkerAction() {
		careservice = IMPServiceFactory.getCareService();
	} 
	
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
        String workername = (String)request.getParameter("workername");
        String department = (String)request.getParameter("department");
        try {
			result = careservice.getQueryUserResult(firstindex, maxresult,
					workername,department,request.getSession().getId());
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return "chooseworkers";
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

    public String getPerPageNumber()
    {
        return perPageNumber;
    }

    public void setPerPageNumber(String perPageNumber)
    {
        this.perPageNumber = perPageNumber;
    }
}