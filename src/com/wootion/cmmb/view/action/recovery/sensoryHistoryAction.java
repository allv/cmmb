package com.wootion.cmmb.view.action.recovery;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.sensoryhistory;
import com.wootion.cmmb.service.activity.SensoryService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class sensoryHistoryAction extends BaseAction{
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    private String sid;
	private String sdate;
	private String sstarttime;
	private String sendtime;
	private String sattend;
	private String sinfo;
	private String swrite;
	private String sbelongpro;
	private String snumber;
	private QueryResult<sensoryhistory> result;
	public SensoryService sensoryservice;
	sensoryHistoryAction() {
		sensoryservice = IMPServiceFactory.getSensoryService();
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
			result = sensoryservice.getQuerySenHistoryResult(firstindex, maxresult, 
					sdate, sattend, swrite, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "sensoryhistory";
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

	public String getSid() {
		return sid;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getSstarttime() {
		return sstarttime;
	}

	public void setSstarttime(String sstarttime) {
		this.sstarttime = sstarttime;
	}

	public String getSendtime() {
		return sendtime;
	}

	public void setSendtime(String sendtime) {
		this.sendtime = sendtime;
	}

	public String getSattend() {
		return sattend;
	}

	public void setSattend(String sattend) {
		this.sattend = sattend;
	}

	public String getSinfo() {
		return sinfo;
	}

	public void setSinfo(String sinfo) {
		this.sinfo = sinfo;
	}

	public String getSwrite() {
		return swrite;
	}

	public void setSwrite(String swrite) {
		this.swrite = swrite;
	}

	public String getSbelongpro() {
		return sbelongpro;
	}

	public void setSbelongpro(String sbelongpro) {
		this.sbelongpro = sbelongpro;
	}

	public String getSnumber() {
		return snumber;
	}

	public void setSnumber(String snumber) {
		this.snumber = snumber;
	}

	public QueryResult<sensoryhistory> getResult() {
		return result;
	}

	public void setResult(QueryResult<sensoryhistory> result) {
		this.result = result;
	}
    
}
