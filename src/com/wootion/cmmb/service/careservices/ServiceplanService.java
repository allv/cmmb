package com.wootion.cmmb.service.careservices;

import java.text.ParseException;
import java.util.List;

import com.wootion.cmmb.persistenc.po.bean.Activityinfo;
import com.wootion.cmmb.persistenc.po.bean.Othercareservicesinfo;
import com.wootion.cmmb.persistenc.po.bean.Serviceplanhistory;
import com.wootion.cmmb.persistenc.po.bean.Serviceplaninfo;
import com.wootion.cmmb.persistenc.po.bean.bathrecordinfo;
import com.wootion.idp.common.utils.QueryResult;

public interface ServiceplanService {
    public void saveServiceplan(Serviceplaninfo sinfos);
    
    public QueryResult<Serviceplaninfo> getQuerySerResult(Integer index,
            Integer maxresult, String sdate, String sname, String speople,
            String sessionID)
			throws ParseException;
    
    public boolean deleServiceplaninfo(String snumber) throws Exception;
	
	public boolean deleSerchoose(String sid) throws Exception;
    
    public List<Serviceplaninfo> lookServiceplan(String snumber)throws Exception;
    
    public List<Serviceplanhistory> lookServiceplanhis(String snumber)throws Exception;
    
    public String modifyser(String sid, String snumber, String sname, String sgender, String sage, 
			String sdate, String sproject1, String sproject2, String sproject3, String sproject4, 
			String sproject5, String sproject6, String sproject7, String sproject8, 
			String sother, String speople, String status, String sbelongpro) throws ParseException;
    
    public QueryResult<Serviceplanhistory> getQuerySerHistoryResult(Integer index,
            Integer maxresult, String sdate, String sname, String speople,
            String sessionID)
			throws ParseException;
}
