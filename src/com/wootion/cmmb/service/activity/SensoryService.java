package com.wootion.cmmb.service.activity;

import java.text.ParseException;
import java.util.List;

import com.wootion.cimp.vo.data.Project;
import com.wootion.cmmb.persistenc.po.bean.activityhistory;
import com.wootion.cmmb.persistenc.po.bean.psychologyinfo;
import com.wootion.cmmb.persistenc.po.bean.sensoryhistory;
import com.wootion.cmmb.persistenc.po.bean.sensoryinfo;
import com.wootion.idp.common.utils.QueryResult;

public interface SensoryService {
	public QueryResult<sensoryinfo> getQuerySenResult(Integer index,
            Integer maxresult, String sdate, String sattend, String swrite,
            String sessionID)
			throws ParseException;
	
	public void saveSenchology(sensoryinfo sinfos);
	
	public boolean delesenchology(String snumber) throws Exception;
	
	public boolean delesenchoose(String sid) throws Exception;
	
    public List<sensoryinfo> lookSenchology(String snumber)throws Exception;
    
    public List<sensoryhistory> lookSensoryhis(String snumber)throws Exception;
	
	public String modifysen(String sid, String snumber, String sdate, String sstarttime, String sendtime, 
			String sattend, String sinfo, String swrite, String sbelongpro) throws ParseException;
	
	public QueryResult<sensoryhistory> getQuerySenHistoryResult(Integer index,
            Integer maxresult, String sdate, String sattend, String swrite,
            String sessionID)
			throws ParseException;
}
