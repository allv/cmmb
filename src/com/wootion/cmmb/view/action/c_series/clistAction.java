package com.wootion.cmmb.view.action.c_series;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cimp.services.projectService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.cimp.vo.data.Project;
import com.wootion.idp.view.action.BaseAction;

public class clistAction extends BaseAction
{
    private String              nowpage       = null; // 页码

    private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;

    //項目主鍵
    private String proid;
    //項目编号
    private String proidentity;
    //項目名称
    private String proname;
    //項目状态
    private String prostate;
    //項目负责人
    private String proresponsor;
    //項目执行机构
    private String proagency;
    //項目权限 
    private String proauthority;
    //項目招标结果
    private String proresult;
    //合同编号
    private String procontract;
    //項目执行开始日期
    private String prostartdate;
    //項目执行结束日期
    private String proenddate;
    //项目总价值
    private String probudget;
    //拨款次数
    private String protimes;
    //项目简介
    private String prodesc;
    
    private String r1;

    private String r2;
    
    private String r3;

    private QueryResult<Project> result;

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
        
        projectService proService = IMPServiceFactory.getProjectService();
        try {
			result = proService.getQueryProResult(firstindex, maxresult,
					prostartdate, prostate, proname, proidentity,
			         request.getSession().getId());
		} catch (ParseException e) {
			e.printStackTrace();
		}
        return SUCESS;
    }

    public QueryResult<Project> getResult()
    {
        return result;
    }

    public void setResult(QueryResult<Project> result)
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

	public String getProid() {
		return proid;
	}

	public void setProid(String proid) {
		this.proid = proid;
	}

	public String getProidentity() {
		return proidentity;
	}

	public void setProidentity(String proidentity) {
		this.proidentity = proidentity;
	}

	public String getProname() {
		return proname;
	}

	public void setProname(String proname) {
		this.proname = proname;
	}

	public String getProstate() {
		return prostate;
	}

	public void setProstate(String prostate) {
		this.prostate = prostate;
	}

	public String getProresponsor() {
		return proresponsor;
	}

	public void setProresponsor(String proresponsor) {
		this.proresponsor = proresponsor;
	}

	public String getProagency() {
		return proagency;
	}

	public void setProagency(String proagency) {
		this.proagency = proagency;
	}

	public String getProauthority() {
		return proauthority;
	}

	public void setProauthority(String proauthority) {
		this.proauthority = proauthority;
	}

	public String getProresult() {
		return proresult;
	}

	public void setProresult(String proresult) {
		this.proresult = proresult;
	}

	public String getProcontract() {
		return procontract;
	}

	public void setProcontract(String procontract) {
		this.procontract = procontract;
	}

	public String getProstartdate() {
		return prostartdate;
	}

	public void setProstartdate(String prostartdate) {
		this.prostartdate = prostartdate;
	}

	public String getProenddate() {
		return proenddate;
	}

	public void setProenddate(String proenddate) {
		this.proenddate = proenddate;
	}

	public String getProbudget() {
		return probudget;
	}

	public void setProbudget(String probudget) {
		this.probudget = probudget;
	}

	public String getProtimes() {
		return protimes;
	}

	public void setProtimes(String protimes) {
		this.protimes = protimes;
	}

	public String getProdesc() {
		return prodesc;
	}

	public void setProdesc(String prodesc) {
		this.prodesc = prodesc;
	}

	public String getR1() {
		return r1;
	}

	public void setR1(String r1) {
		this.r1 = r1;
	}

	public String getR2() {
		return r2;
	}

	public void setR2(String r2) {
		this.r2 = r2;
	}

	public String getR3() {
		return r3;
	}

	public void setR3(String r3) {
		this.r3 = r3;
	}

  
}