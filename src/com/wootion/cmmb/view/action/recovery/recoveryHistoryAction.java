package com.wootion.cmmb.view.action.recovery;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wootion.cimp.services.IMPServiceFactory;
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.cmmb.service.activity.ActivityService;
import com.wootion.idp.common.utils.QueryResult;
import com.wootion.idp.view.action.BaseAction;

public class recoveryHistoryAction extends BaseAction
{
	private String              nowpage       = null; // 页码

	private String              maxpage       = null; // 每页显示条数

    private String              perPageNumber = null;
    
    private String acName;
	private String acNumber;
	private String acStime;
	private String acPlace;
	private String acInfo;
	private String abelongpro;
	private String anumber;
    
	private QueryResult<activityhistory> result;
	public ActivityService activityservice;
	recoveryHistoryAction() {
		activityservice = IMPServiceFactory.getActivityService();
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
        	result = activityservice.getQueryActHistoryResult(firstindex, maxresult, 
        			acStime, acName, request.getSession().getId());  
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return "recoveryhistory";
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
	
	public String getAcName() {
		return acName;
	}

	public void setAcName(String acName) {
		this.acName = acName;
	}

	public String getAcNumber() {
		return acNumber;
	}

	public void setAcNumber(String acNumber) {
		this.acNumber = acNumber;
	}

	public String getAcStime() {
		return acStime;
	}

	public void setAcStime(String acStime) {
		this.acStime = acStime;
	}

	public String getAcPlace() {
		return acPlace;
	}

	public void setAcPlace(String acPlace) {
		this.acPlace = acPlace;
	}

	public String getAcInfo() {
		return acInfo;
	}

	public void setAcInfo(String acInfo) {
		this.acInfo = acInfo;
	}

	public String getAbelongpro() {
		return abelongpro;
	}

	public void setAbelongpro(String abelongpro) {
		this.abelongpro = abelongpro;
	}

	public String getAnumber() {
		return anumber;
	}

	public void setAnumber(String anumber) {
		this.anumber = anumber;
	}

	public QueryResult<activityhistory> getResult() {
		return result;
	}

	public void setResult(QueryResult<activityhistory> result) {
		this.result = result;
	}
	
}
