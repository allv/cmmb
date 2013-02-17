package com.wootion.cmmb.view.action.careservices;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.Othercareserviceshistory;
import com.wootion.cmmb.service.careservices.OthercareservicesService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class othercareservicesHistoryAction extends BaseAction{

	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String oid;
    private String onumber;
    private String odate;
    private String oname;
    private String ocontent;
    private String ostarttime;
    private String oendtime;
    private String opeople;
    private String oevaluation;
    private String oinfo;
    private String obelongpro;
    
    private QueryResult<Othercareserviceshistory> result;
    public OthercareservicesService othercareservicesservice;
    othercareservicesHistoryAction()
    {
    	othercareservicesservice = IMPServiceFactory.getOthercareservicesService();
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
			result = othercareservicesservice.getQueryCarHistoryResult(firstindex, maxresult, 
					odate, oname, opeople, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "othercareserviceshistory";
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

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getOnumber() {
		return onumber;
	}

	public void setOnumber(String onumber) {
		this.onumber = onumber;
	}

	public String getOdate() {
		return odate;
	}

	public void setOdate(String odate) {
		this.odate = odate;
	}

	public String getOname() {
		return oname;
	}

	public void setOname(String oname) {
		this.oname = oname;
	}

	public String getOcontent() {
		return ocontent;
	}

	public void setOcontent(String ocontent) {
		this.ocontent = ocontent;
	}

	public String getOstarttime() {
		return ostarttime;
	}

	public void setOstarttime(String ostarttime) {
		this.ostarttime = ostarttime;
	}

	public String getOendtime() {
		return oendtime;
	}

	public void setOendtime(String oendtime) {
		this.oendtime = oendtime;
	}

	public String getOpeople() {
		return opeople;
	}

	public void setOpeople(String opeople) {
		this.opeople = opeople;
	}

	public String getOevaluation() {
		return oevaluation;
	}

	public void setOevaluation(String oevaluation) {
		this.oevaluation = oevaluation;
	}

	public String getOinfo() {
		return oinfo;
	}

	public void setOinfo(String oinfo) {
		this.oinfo = oinfo;
	}

	public String getObelongpro() {
		return obelongpro;
	}

	public void setObelongpro(String obelongpro) {
		this.obelongpro = obelongpro;
	}

	public QueryResult<Othercareserviceshistory> getResult() {
		return result;
	}

	public void setResult(QueryResult<Othercareserviceshistory> result) {
		this.result = result;
	}
	
}
