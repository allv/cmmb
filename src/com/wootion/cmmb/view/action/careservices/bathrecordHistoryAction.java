package com.wootion.cmmb.view.action.careservices;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.bathrecordhistory;
import com.wootion.cmmb.service.careservices.BathrecordService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class bathrecordHistoryAction extends BaseAction{

	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String cid;
    private String cdate;
    private String cnumber;
    private String cname;
    private String clevel;
    private String cstarttime;
    private String cendtime;
    private String cpeople;
    private String cinfo;
    private String cbelongpro;
    
    private QueryResult<bathrecordhistory> result;
    public BathrecordService bathrecordservice;
    bathrecordHistoryAction()
    {
    	bathrecordservice = IMPServiceFactory.getBathrecordService();
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
			result = bathrecordservice.getQueryActHistoryResult(firstindex, maxresult, 
					cdate, cname, cpeople, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "bathrecordhistory";
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
	public String getCid() {
		return cid;
	}
	public void setCid(String cid) {
		this.cid = cid;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public String getCnumber() {
		return cnumber;
	}
	public void setCnumber(String cnumber) {
		this.cnumber = cnumber;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getClevel() {
		return clevel;
	}
	public void setClevel(String clevel) {
		this.clevel = clevel;
	}
	public String getCstarttime() {
		return cstarttime;
	}
	public void setCstarttime(String cstarttime) {
		this.cstarttime = cstarttime;
	}
	public String getCendtime() {
		return cendtime;
	}
	public void setCendtime(String cendtime) {
		this.cendtime = cendtime;
	}
	public String getCpeople() {
		return cpeople;
	}
	public void setCpeople(String cpeople) {
		this.cpeople = cpeople;
	}
	public String getCinfo() {
		return cinfo;
	}
	public void setCinfo(String cinfo) {
		this.cinfo = cinfo;
	}
	public String getCbelongpro() {
		return cbelongpro;
	}
	public void setCbelongpro(String cbelongpro) {
		this.cbelongpro = cbelongpro;
	}

	public QueryResult<bathrecordhistory> getResult() {
		return result;
	}

	public void setResult(QueryResult<bathrecordhistory> result) {
		this.result = result;
	}
    
}
