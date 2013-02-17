package com.wootion.cmmb.view.action.recovery;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.Bloodpressurehistory;
import com.wootion.cmmb.service.activity.BloodpressureService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class BloodpressureHistoryAction extends BaseAction{
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String bid;
	private String bdate;
	private String bnumber;
	private String bname;
	private String bgender;
	private String bage;
	private String bphone;
	private String bstarttime;
	private String bdiseases;
	private String bfilenumber;
	private String bbelongpro;
	private String binfo;
	private String bwritedate;
	private String bloodnum;
	private String bpulse;
	private QueryResult<Bloodpressurehistory> result;
	public BloodpressureService bloodpressureservice;
	BloodpressureHistoryAction() {
		bloodpressureservice = IMPServiceFactory.getBloodpressureService();
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
			result = bloodpressureservice.getQueryBloHistoryResult(firstindex, maxresult, 
					bstarttime, bname, bfilenumber, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "bloodpressurehistory";
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
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	public String getBnumber() {
		return bnumber;
	}
	public void setBnumber(String bnumber) {
		this.bnumber = bnumber;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getBgender() {
		return bgender;
	}
	public void setBgender(String bgender) {
		this.bgender = bgender;
	}
	public String getBage() {
		return bage;
	}
	public void setBage(String bage) {
		this.bage = bage;
	}
	public String getBphone() {
		return bphone;
	}
	public void setBphone(String bphone) {
		this.bphone = bphone;
	}
	public String getBstarttime() {
		return bstarttime;
	}
	public void setBstarttime(String bstarttime) {
		this.bstarttime = bstarttime;
	}
	public String getBdiseases() {
		return bdiseases;
	}
	public void setBdiseases(String bdiseases) {
		this.bdiseases = bdiseases;
	}
	public String getBfilenumber() {
		return bfilenumber;
	}
	public void setBfilenumber(String bfilenumber) {
		this.bfilenumber = bfilenumber;
	}
	public String getBbelongpro() {
		return bbelongpro;
	}
	public void setBbelongpro(String bbelongpro) {
		this.bbelongpro = bbelongpro;
	}
	public String getBinfo() {
		return binfo;
	}
	public void setBinfo(String binfo) {
		this.binfo = binfo;
	}
	public String getBwritedate() {
		return bwritedate;
	}
	public void setBwritedate(String bwritedate) {
		this.bwritedate = bwritedate;
	}
	public String getBloodnum() {
		return bloodnum;
	}
	public void setBloodnum(String bloodnum) {
		this.bloodnum = bloodnum;
	}
	public String getBpulse() {
		return bpulse;
	}
	public void setBpulse(String bpulse) {
		this.bpulse = bpulse;
	}
	public QueryResult<Bloodpressurehistory> getResult() {
		return result;
	}
	public void setResult(QueryResult<Bloodpressurehistory> result) {
		this.result = result;
	}
	
}
