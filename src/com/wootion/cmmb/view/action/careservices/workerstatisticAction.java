package com.wootion.cmmb.view.action.careservices;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cimp.vo.data.memstatistic;
import com.wootion.cimp.vo.data.workerdata;
import com.wootion.cmmb.service.careservices.careService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class workerstatisticAction extends BaseAction
{
    private String              nowpage       = null; // 页码

    private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;


    private QueryResult<memstatistic> result;
    public careService careservice;
    workerstatisticAction() {
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
        String isManager = (String)careservice.isManager();
        request.setAttribute("ismanager", isManager);
        String workername = (String)request.getParameter("workername");
        String startDate = (String)request.getParameter("startDate");
        String endDate = (String)request.getParameter("endDate");
        String careflag = (String)request.getParameter("careflag");
        try {
				result = careservice.getQueryMemStatisticResult(firstindex, maxresult,
						workername,startDate,endDate,careflag);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//保存搜索条件
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("workername", workername);
		if("recovermem".equals(careflag)){
			return "recovermemdata";
		}else{
			return "personstatistic";
		}
    }

    public QueryResult<memstatistic> getResult()
    {
        return result;
    }

    public void setResult(QueryResult<memstatistic> result)
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