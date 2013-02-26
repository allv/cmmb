package com.wootion.cmmb.service.management;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import com.wootion.cimp.vo.data.Project;
import com.wootion.cmmb.persistenc.po.bean.Activityinfo;
import com.wootion.cmmb.persistenc.po.bean.Managementhistory;
import com.wootion.cmmb.persistenc.po.bean.Managementinfo;
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.idp.common.utils.QueryResult;

public interface ManagementService {
	public void saveManagement(Managementinfo minfos);
	
	public QueryResult<Managementinfo> getQueryManResult(Integer index,
            Integer maxresult, String mstarttime,String mserialnum, String mimagefee, String mnumber,
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
