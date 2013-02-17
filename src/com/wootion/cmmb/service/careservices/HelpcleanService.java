package com.wootion.cmmb.service.careservices;

import java.text.ParseException;
import java.util.List;

import com.wootion.cmmb.persistenc.po.bean.Activityinfo;
import com.wootion.cmmb.persistenc.po.bean.Helpcleanhistory;
import com.wootion.cmmb.persistenc.po.bean.Helpcleaninfo;
import com.wootion.cmmb.persistenc.po.bean.bathrecordinfo;
import com.wootion.idp.common.utils.QueryResult;

public interface HelpcleanService {
    public void saveHelpclean(Helpcleaninfo hinfos);
    
    public QueryResult<Helpcleaninfo> getQueryHelResult(Integer index,
            Integer maxresult, String hdate, String hname, String hpeople,
            String sessionID)
			throws ParseException;
    
    public boolean deleHelpcleaninfo(String hdate) throws Exception;
	
	public boolean delehelchoose(String hid) throws Exception;
    
    public List<Helpcleaninfo> lookHelpclean(String hdate)throws Exception;
    
    public List<Helpcleanhistory> lookHelpcleanhis(String hdate)throws Exception;
    
    public String modifyhel(String hid, String hdate, String hnumber, String hname, String hclothingnum, 
			String hrequirement, String hpeople, String hinfo, String hbelongpro) throws ParseException;
    
    public QueryResult<Helpcleanhistory> getQueryHelHistoryResult(Integer index,
            Integer maxresult, String hdate, String hname, String hpeople,
            String sessionID)
			throws ParseException;
}
