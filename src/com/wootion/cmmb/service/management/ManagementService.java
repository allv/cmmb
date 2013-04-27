package com.wootion.cmmb.service.management;

import java.text.ParseException;

import com.wootion.cmmb.persistenc.po.bean.Managementhistory;
import com.wootion.cmmb.persistenc.po.bean.Managementinfo;
import com.wootion.idp.common.utils.QueryResult;

public interface ManagementService {
	public void saveManagement(Managementinfo minfos);
	
	public QueryResult<Managementinfo> getQueryManResult(Integer index,
            Integer maxresult, String mstarttime,String mserialnum, String mimagefee, String mnumber,String a1,
            String sessionID)
			throws ParseException;
	
	public boolean delemanchoose(String mid) throws Exception;
	
	public Managementinfo lookManagement(String mid)throws Exception;
	
	public Managementhistory lookManagementhis(String mid)throws Exception;
	
	public String modifyman(Managementinfo minfos) throws ParseException;

	public QueryResult<Managementhistory> getQueryManHistoryResult(Integer index,
            Integer maxresult, String mstarttime, String morganizer, String mserialnum,
            String sessionID)
			throws ParseException;
}
