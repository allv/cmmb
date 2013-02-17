package com.wootion.cmmb.view.action.recovery;

import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.psychologyhistory;
import com.wootion.cmmb.persistenc.po.bean.psychologyinfo;
import com.wootion.cmmb.service.psychology.PsychologyService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class psychologyHistoryAction extends BaseAction{
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    private String pid;
	private String pdate;
	private String pstarttime;
	private String pendtime;
	private String pattend;
	private String pinfo;
	private String pwrite;
	private String pbelongpro;
	private String pnumber;
	private QueryResult<psychologyhistory> result;
	public PsychologyService psychologyservice;
	psychologyHistoryAction() {
		psychologyservice = IMPServiceFactory.getPsychologyService();
	}
	
	@Override
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
			result = psychologyservice.getQueryPsyHistoryResult(firstindex, maxresult, 
					pdate, pwrite, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "psychologyhistory";
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

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPdate() {
		return pdate;
	}

	public void setPdate(String pdate) {
		this.pdate = pdate;
	}

	public String getPstarttime() {
		return pstarttime;
	}

	public void setPstarttime(String pstarttime) {
		this.pstarttime = pstarttime;
	}

	public String getPendtime() {
		return pendtime;
	}

	public void setPendtime(String pendtime) {
		this.pendtime = pendtime;
	}

	public String getPattend() {
		return pattend;
	}

	public void setPattend(String pattend) {
		this.pattend = pattend;
	}

	public String getPinfo() {
		return pinfo;
	}

	public void setPinfo(String pinfo) {
		this.pinfo = pinfo;
	}

	public String getPwrite() {
		return pwrite;
	}

	public void setPwrite(String pwrite) {
		this.pwrite = pwrite;
	}

	public QueryResult<psychologyhistory> getResult() {
		return result;
	}

	public void setResult(QueryResult<psychologyhistory> result) {
		this.result = result;
	}

	public String getPbelongpro() {
		return pbelongpro;
	}

	public void setPbelongpro(String pbelongpro) {
		this.pbelongpro = pbelongpro;
	}

	public String getPnumber() {
		return pnumber;
	}

	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
    
}
