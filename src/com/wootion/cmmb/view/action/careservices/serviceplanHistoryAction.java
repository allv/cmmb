package com.wootion.cmmb.view.action.careservices;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.Serviceplanhistory;
import com.wootion.cmmb.service.careservices.ServiceplanService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class serviceplanHistoryAction extends BaseAction{

	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String sid;
    private String snumber;
    private String sname;
    private String sgender;
    private String sage;
    private String sdate;
    private String sproject1;
    private String sproject2;
    private String sproject3;
    private String sproject4;
    private String sproject5;
    private String sproject6;
    private String sproject7;
    private String sproject8;
    private String sother;
    private String speople;
    private String status;
    private String sbelongpro;
    
    private QueryResult<Serviceplanhistory> result;
    public ServiceplanService serviceplanservice;
    serviceplanHistoryAction()
    {
    	serviceplanservice = IMPServiceFactory.getServiceplanService();
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
			result = serviceplanservice.getQuerySerHistoryResult(firstindex, maxresult, 
					sdate, sname, speople, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "serviceplanhistory";
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

	public String getSnumber() {
		return snumber;
	}

	public void setSnumber(String snumber) {
		this.snumber = snumber;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSgender() {
		return sgender;
	}

	public void setSgender(String sgender) {
		this.sgender = sgender;
	}

	public String getSage() {
		return sage;
	}

	public void setSage(String sage) {
		this.sage = sage;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getSproject1() {
		return sproject1;
	}

	public void setSproject1(String sproject1) {
		this.sproject1 = sproject1;
	}

	public String getSproject2() {
		return sproject2;
	}

	public void setSproject2(String sproject2) {
		this.sproject2 = sproject2;
	}

	public String getSproject3() {
		return sproject3;
	}

	public void setSproject3(String sproject3) {
		this.sproject3 = sproject3;
	}

	public String getSproject4() {
		return sproject4;
	}

	public void setSproject4(String sproject4) {
		this.sproject4 = sproject4;
	}

	public String getSproject5() {
		return sproject5;
	}

	public void setSproject5(String sproject5) {
		this.sproject5 = sproject5;
	}

	public String getSproject6() {
		return sproject6;
	}

	public void setSproject6(String sproject6) {
		this.sproject6 = sproject6;
	}

	public String getSproject7() {
		return sproject7;
	}

	public void setSproject7(String sproject7) {
		this.sproject7 = sproject7;
	}

	public String getSproject8() {
		return sproject8;
	}

	public void setSproject8(String sproject8) {
		this.sproject8 = sproject8;
	}

	public String getSother() {
		return sother;
	}

	public void setSother(String sother) {
		this.sother = sother;
	}

	public String getSpeople() {
		return speople;
	}

	public void setSpeople(String speople) {
		this.speople = speople;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSbelongpro() {
		return sbelongpro;
	}

	public void setSbelongpro(String sbelongpro) {
		this.sbelongpro = sbelongpro;
	}

	public QueryResult<Serviceplanhistory> getResult() {
		return result;
	}

	public void setResult(QueryResult<Serviceplanhistory> result) {
		this.result = result;
	}
}
