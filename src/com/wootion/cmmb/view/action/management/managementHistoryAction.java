package com.wootion.cmmb.view.action.management;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.Managementhistory;
import com.wootion.cmmb.service.management.ManagementService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class managementHistoryAction extends BaseAction
{
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String mid;
	private String mmodifytime;
	private String mstarttime;
	private String mendtime;
	private String mnumber;
	private String mplace;
	private String morganizer;
	private String mserialnum;
	private String minfo;
	private String mbelongpro;
	private String mimageurl;
	
	private QueryResult<Managementhistory> result;
	public ManagementService managementservice;
	managementHistoryAction() {
		managementservice = IMPServiceFactory.getManagementService();
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
			result = managementservice.getQueryManHistoryResult(firstindex, maxresult, 
					mstarttime, morganizer, mserialnum, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "managementhistory";
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
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMmodifytime() {
		return mmodifytime;
	}
	public void setMmodifytime(String mmodifytime) {
		this.mmodifytime = mmodifytime;
	}
	public String getMstarttime() {
		return mstarttime;
	}
	public void setMstarttime(String mstarttime) {
		this.mstarttime = mstarttime;
	}
	public String getMendtime() {
		return mendtime;
	}
	public void setMendtime(String mendtime) {
		this.mendtime = mendtime;
	}
	public String getMnumber() {
		return mnumber;
	}
	public void setMnumber(String mnumber) {
		this.mnumber = mnumber;
	}
	public String getMplace() {
		return mplace;
	}
	public void setMplace(String mplace) {
		this.mplace = mplace;
	}
	public String getMorganizer() {
		return morganizer;
	}
	public void setMorganizer(String morganizer) {
		this.morganizer = morganizer;
	}
	public String getMserialnum() {
		return mserialnum;
	}
	public void setMserialnum(String mserialnum) {
		this.mserialnum = mserialnum;
	}
	public String getMinfo() {
		return minfo;
	}
	public void setMinfo(String minfo) {
		this.minfo = minfo;
	}
	public String getMbelongpro() {
		return mbelongpro;
	}
	public void setMbelongpro(String mbelongpro) {
		this.mbelongpro = mbelongpro;
	}
	public QueryResult<Managementhistory> getResult() {
		return result;
	}
	public void setResult(QueryResult<Managementhistory> result) {
		this.result = result;
	}
	public String getMimageurl() {
		return mimageurl;
	}
	public void setMimageurl(String mimageurl) {
		this.mimageurl = mimageurl;
	}
}
