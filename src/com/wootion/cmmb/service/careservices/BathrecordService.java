package com.wootion.cmmb.service.careservices;

import java.text.ParseException;
import java.util.List;

import com.wootion.cmmb.persistenc.po.bean.Activityinfo;
import com.wootion.cmmb.persistenc.po.bean.bathrecordhistory;
import com.wootion.cmmb.persistenc.po.bean.bathrecordinfo;
import com.wootion.idp.common.utils.QueryResult;

public interface BathrecordService {
    public void saveBathrecord(bathrecordinfo binfos);
    
    public QueryResult<bathrecordinfo> getQueryActResult(Integer index,
            Integer maxresult, String cdate, String cname, String cpeople,
            String sessionID)
			throws ParseException;
    
    public boolean deleBathrecordinfo(String cdate) throws Exception;
	
	public boolean delebatchoose(String cid) throws Exception;
    
    public List<bathrecordinfo> lookBathrecord(String cdate)throws Exception;
    
    public List<bathrecordhistory> lookBathrecordhis(String cdate)throws Exception;
    
    public String modifybat(String cid, String cdate, String cnumber, String cname, String clevel, 
			String cstarttime, String cendtime, String cpeople, String cinfo, String cbelongpro) throws ParseException;
    
    public QueryResult<bathrecordhistory> getQueryActHistoryResult(Integer index,
            Integer maxresult, String cdate, String cname, String cpeople,
            String sessionID)
			throws ParseException;
}
