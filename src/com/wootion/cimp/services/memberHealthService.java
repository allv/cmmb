package com.wootion.cimp.services;

import java.text.ParseException;

import com.wootion.cimp.vo.data.healtheval;
import com.wootion.cimp.vo.data.healthpsyeval;
import com.wootion.cmmb.persistenc.po.bean.Activityhouse;
import com.wootion.idp.common.utils.QueryResult;

public interface memberHealthService {
	public QueryResult<healtheval> getQueryHealthResult(Integer index,
            Integer maxresult, String assesdate, String memname,
            String belongproname, String healthnumber,String sessionID)
			throws ParseException;
	
	public QueryResult<Activityhouse> getQueryActivityHouseResult(Integer index,
            Integer maxresult, String ahnum, String ahtotalpeo,
            String ahtotalnum, String ahmanager,String sessionID)
			throws ParseException;
	
	public String saveHealthEval(healtheval heal);
	
	public String saveActivityHouse(Activityhouse ahouse);
	
	public String saveActivityCounter(Activityhouse ahouse);
	
	public Activityhouse lookActivityHouse(String ahouseid);
	
	public boolean deleActivityHouse(String ahid);
	
	public String modifyActivityHouse(Activityhouse heal);
	
	public String saveHealthPsyEval(healthpsyeval heal);
	
	public healtheval lookHealthEval(String healthid);
	
	public healthpsyeval lookHealthPsyEval(String healthid);
	
	public String modifyHealthEval(healtheval heal);
	
	public boolean deleHealth(String healthid);
	
	public String modifyHealthPsyEval(healthpsyeval heal);
	
	public String filterMemberNumbers(String adlmarks,String adlmarks2,String listen,String view,String smoke,String drink)throws Exception;
}
