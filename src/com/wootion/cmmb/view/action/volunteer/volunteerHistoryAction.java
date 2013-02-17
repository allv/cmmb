package com.wootion.cmmb.view.action.volunteer;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.Volunteerhistory;
import com.wootion.cmmb.service.volunteer.VolunteerService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class volunteerHistoryAction extends BaseAction
{
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String vid;
	private String vnumber;
	private String vtime;
	private String vname;
	private String vage;
	private String vgender;
	private String vphone;
	private String vspecialty;
	private String vcommunitywork;
	private String vstudy;
	private String vintention;
	private String vtrain;
	
	private QueryResult<Volunteerhistory> result;
	public VolunteerService volunteerservice;
	volunteerHistoryAction() {
		volunteerservice = IMPServiceFactory.getVolunteerService();
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
			result = volunteerservice.getQueryVolHistoryResult(firstindex, maxresult, 
					vname, vspecialty, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "volunteerhistory";
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
	public String getVid() {
		return vid;
	}
	public void setVid(String vid) {
		this.vid = vid;
	}
	public String getVnumber() {
		return vnumber;
	}
	public void setVnumber(String vnumber) {
		this.vnumber = vnumber;
	}
	public String getVtime() {
		return vtime;
	}
	public void setVtime(String vtime) {
		this.vtime = vtime;
	}
	public String getVname() {
		return vname;
	}
	public void setVname(String vname) {
		this.vname = vname;
	}
	public String getVage() {
		return vage;
	}
	public void setVage(String vage) {
		this.vage = vage;
	}
	public String getVgender() {
		return vgender;
	}
	public void setVgender(String vgender) {
		this.vgender = vgender;
	}
	public String getVphone() {
		return vphone;
	}
	public void setVphone(String vphone) {
		this.vphone = vphone;
	}
	public String getVspecialty() {
		return vspecialty;
	}
	public void setVspecialty(String vspecialty) {
		this.vspecialty = vspecialty;
	}
	public String getVcommunitywork() {
		return vcommunitywork;
	}
	public void setVcommunitywork(String vcommunitywork) {
		this.vcommunitywork = vcommunitywork;
	}
	public String getVstudy() {
		return vstudy;
	}
	public void setVstudy(String vstudy) {
		this.vstudy = vstudy;
	}
	public String getVintention() {
		return vintention;
	}
	public void setVintention(String vintention) {
		this.vintention = vintention;
	}
	public String getVtrain() {
		return vtrain;
	}
	public void setVtrain(String vtrain) {
		this.vtrain = vtrain;
	}
	public QueryResult<Volunteerhistory> getResult() {
		return result;
	}
	public void setResult(QueryResult<Volunteerhistory> result) {
		this.result = result;
	}
    
}
