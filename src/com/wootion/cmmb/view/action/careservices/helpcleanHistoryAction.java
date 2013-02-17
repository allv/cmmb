package com.wootion.cmmb.view.action.careservices;

import java.text.ParseException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.Helpcleanhistory;
import com.wootion.cmmb.service.careservices.HelpcleanService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class helpcleanHistoryAction extends BaseAction{

	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String hid;
    private String hdate;
    private String hnumber;
    private String hname;
    private String hclothingnum;
    private String hrequirement;
    private String hpeople;
    private String hinfo;
    private String hbelongpro;
    
    private QueryResult<Helpcleanhistory> result;
    public HelpcleanService helpcleanservice;
    helpcleanHistoryAction()
    {
    	helpcleanservice = IMPServiceFactory.getHelpcleanService();
    }
    
	public String execute(HttpServletRequest request, HttpServletResponse response) {
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
        
        try {
			result = helpcleanservice.getQueryHelHistoryResult(firstindex, maxresult, 
					hdate, hname, hpeople, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "helpcleanhistory";
	}
	
	public String getNowpage() {
		return nowpage;
	}

	public void setNowpage(String nowpage) {
		this.nowpage = nowpage;
	}

	public String getMaxpage() {
		return maxpage;
	}

	public void setMaxpage(String maxpage) {
		this.maxpage = maxpage;
	}

	public String getPerPageNumber() {
		return perPageNumber;
	}

	public void setPerPageNumber(String perPageNumber) {
		this.perPageNumber = perPageNumber;
	}

	public String getHid() {
		return hid;
	}

	public void setHid(String hid) {
		this.hid = hid;
	}

	public String getHdate() {
		return hdate;
	}

	public void setHdate(String hdate) {
		this.hdate = hdate;
	}

	public String getHnumber() {
		return hnumber;
	}

	public void setHnumber(String hnumber) {
		this.hnumber = hnumber;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getHclothingnum() {
		return hclothingnum;
	}

	public void setHclothingnum(String hclothingnum) {
		this.hclothingnum = hclothingnum;
	}

	public String getHrequirement() {
		return hrequirement;
	}

	public void setHrequirement(String hrequirement) {
		this.hrequirement = hrequirement;
	}

	public String getHpeople() {
		return hpeople;
	}

	public void setHpeople(String hpeople) {
		this.hpeople = hpeople;
	}

	public String getHinfo() {
		return hinfo;
	}

	public void setHinfo(String hinfo) {
		this.hinfo = hinfo;
	}

	public String getHbelongpro() {
		return hbelongpro;
	}

	public void setHbelongpro(String hbelongpro) {
		this.hbelongpro = hbelongpro;
	}

	public QueryResult<Helpcleanhistory> getResult() {
		return result;
	}

	public void setResult(QueryResult<Helpcleanhistory> result) {
		this.result = result;
	}
	
	
}
